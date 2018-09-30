<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" import="java.io.*"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="MenuStyles.css">
    <title>Voice Controlled Notes App</title>

    <style>
        .logomenu{
            color: #FFFFFF;
        }
        #div1 {
            font-size:48px;
        }
        .jumbotron{
            margin-top: 8%;
            margin-left: 15%;
            margin-right: 15%;
            margin-bottom: 5%;
            border-radius:10px;
        }
        .boxtext{
            border-color: #E54B4B;
        }
    </style>
</head>
<body>

    <header >
        <div class="container ">
            <a href="Menu.jsp"><h1 class="logo logomenu">Shiritori<span>Logo</span></h1></a>

            <nav class="site-nav ">
                <ul>
                    <li><a href=""><i class="site-nav--icon"><img src="Icon/user.png" class="iconmenu"></i>Sign Up</a></li> 
                    <li><a href=""><i class="site-nav--icon"><img src="Icon/login.png" class="iconmenu"></i>Log In</a></li>
                </ul> 
            </nav>

            <div class="menu-toggle">
                <div class="hamburger"></div>
            </div>
        </div>
    </header>


    <div class="jumbotron ">    
        <div class="container">
            <div class="row  justify-content-center">
                <div class="col col-lg-4 ">
                    <div class="media ">
                        <img class="align-self-center mr-3" src="Icon/star.png" width="50px" height="50px">
                        <div class="media-body">
                            <h5 class="mt-4"> <%=request.getAttribute("score")%></h5>
                        </div>
                    </div>
                </div>

                <div class="col col-lg-4 text-center">    
                    <img src="Icon/heart<%=request.getAttribute("heart")%>.png" width="90px" height="90px">   
                </div>

                <div class="col col-lg-4 " >        
                    <div class="media">
                        <img class="align-self-center mr-3 " src="Icon/clock.png" width="60px" height="60px">
                        <div class="media-body">
                            <h5 class="mt-4" id="countdowntimer"><%=request.getAttribute("time")%></h5>
                        </div>
                    </div>    
                </div>
            </div>

            <div class="row">
                <div class="col">
                    <h5 class="mt-4">Start with: <b><%=request.getAttribute("pchar")%></b></h5>
                    <input type="hidden" id="hiddenGameId" name="gameId" value="<%=request.getAttribute("gameId")%>" />
                    <input type="hidden" id="level" value="<%=request.getParameter("level")%>" />
                    <input type="hidden" id="userid" value="<%=request.getParameter("userid")%>" />
                    <input type="hidden" id="username" value="<%=request.getParameter("username")%>" />
                    <input type="hidden" id="hiddenChar" name="char" value="<%=request.getAttribute("char")%>" />
                    <input type="hidden" id="hiddenHeart" name="heart" value="<%=request.getAttribute("heart")%>" />
                    <input type="hidden" id="hiddenScore" name="score" value="<%=request.getAttribute("score")%>" />
                    <input type="hidden" id="hiddenTime" name="time" value="<%=request.getAttribute("time")%>" />
                    <input type="hidden" id="hiddenVocab" name="vocab" value="<%=request.getAttribute("vocab")%>" />
                    <input type="hidden" id="hiddenStatus" name="status" value="<%=request.getAttribute("status")%>" />
                </div>
            </div>

            <div class="row ">
                <div class="col-md-auto ">
                    <h5 class="mt-4 font-weight-normal">Previous Word:</h5>                  
                </div>
                <div class="col-md-auto ">
                    <h5 class="mt-4 font-weight-normal" id="previous"><%=request.getAttribute("previous")%></h5>
                </div>
            </div>
            <br>

            <div class="row">
                <div class="col text-center ">
                    <div class="input-group input-group-lg boxtext" >        
                        <input type="text" class="form-control text-center " id="note-textarea"   aria-label="Large" aria-describedby="inputGroup-sizing-sm" placeholder=<%=request.getAttribute("vocab")%> readonly>
                    </div>
                </div>
            </div>
            <br>

            <div class="row  justify-content-center">
                <div class="col-sm-auto">
                    <h5 class="font-weight-normal">Meaning:</h5>
                </div>
                <div class="col-sm-auto">
                    <h5 class="font-weight-normal"id="meaning"><%=request.getAttribute("meaning")%></h5>
                </div>
            </div>
            <br>

            <div class="row justify-content-center">
                <div class="col text-center">
                    <button type="button" class="btn"  id="start-record-btn" title="Start Recording"><img src="Icon/microphone-voice-tool-circular-black-button.png" width="100" hight="100" /></button> 
                </div>
            </div>
            <br>
            <div class="row justify-content-center">
                <div class="col text-center">
                    <p id="recording-instructions">Press the <strong>Start Recognition</strong> button and allow access.</p>                
                </div>
            </div>

        </div>
    </div>



    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="MenuScript.js"></script>
    <script src="GetMeaningScript.js"></script>

</body>
</html>



