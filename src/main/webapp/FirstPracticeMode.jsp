<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" import="java.io.*"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        
        <title>Practice Mode Game</title>

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
              crossorigin="anonymous">

        <style>
            body{
                background-image: url("Icon/backgroundplaygame.png");
                overflow: hidden;
                background-size: cover;
                background-repeat: no-repeat;
                font-family: sans-serif;
            }
            html, body{
                height: 100%;
                margin: 0;
                padding: 0;
                font-family:-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
            }
        </style>
    </head>

    <body class="text-center">
        <!-- main -->
        <input type="hidden" id="gameId" value="<%=request.getAttribute("gameId")%>" />
        <input type="hidden" id="hiddenScore" value="<%=request.getAttribute("score")%>" />
        <input type="hidden" id="time" value="<%=request.getAttribute("time")%>" />
        <input type="hidden" id="hiddenVocab" value="<%=request.getAttribute("vocab")%>" />
        <input type="hidden" id="categoryId" value="<%=request.getAttribute("categoryId")%>" />
        <div class="background">
            <!-- pc -->

            <div class="container d-none d-md-block">
                <div class="row justify-content-md-center">
                    <div class="col-md-6">
                        <img src="Icon/score.png" class="img-fluid" alt="Responsive image" style="width: 9rem; margin-top: 10%; margin-right: 10%;">
                        <div class="card-img-overlay" style="color: black; margin-top: 7%; margin-right: 50%;">
                            <h2><%=request.getAttribute("score")%></h2>
                        </div>

                        <img src="Icon/time.png" class="img-fluid" alt="Responsive image" style="width: 9rem; margin-top: 10%; margin-left: 20%;">
                        <div class="card-img-overlay" style="color: black; margin-top: 7%; margin-left: 60%;">
                            <h2 id="countdowntimer"><%=request.getAttribute("time")%></h2>
                        </div>
                    </div>                
                </div>

                <div class="row justify-content-md-center ">
                    <div class="col-md-6 ">
                        <img src="Icon/Card<%=request.getAttribute("category")%>/card <%=request.getAttribute("vocab")%>.png" class="img-fluid" alt="Responsive image" style="width: 15rem; margin-top: 5%;">
                    </div>
                </div>

                <div class="row justify-content-md-center">
                    <div class="col-md-auto" style="color: white; margin-top: 2%;"> 
                        <p class="text-center">
                        <h2><%=request.getAttribute("vocab")%>:</h2>
                        </p>
                    </div>

                    <div class="col-md-auto" style=" margin-top: 4%;"> 
                        <div class="boxtext" >        
                            <input type="text" class="form-control text-center " id="note-textarea"   aria-label="Large" aria-describedby="inputGroup-sizing-sm" placeholder="Vocab" readonly>
                        </div>
                    </div> 
                </div>

                <div class="row justify-content-md-center">
                    <div class="col col-md-12">
                        <button type="button" class="btn btn-outline-light rounded-circle border-0"  id="start-record-btn" style="margin-top: 3%; width: 8rem; height: 8rem;" >
                            <img src="Icon/microphone.png" class="img-fluid"  alt="Responsive image">
                        </button>
                    </div>
                </div>

                <div class="row justify-content-center">
                    <div class="col text-center" style="color: white;">
                        <p id="recording-instructions">Press the <strong>Start Recognition</strong> button and allow access.</p>                
                    </div>
                </div> 
              
            </div>
        </div>


        <!-- Bootstrap core JavaScript -->

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
        <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
        <script src="PracticeScript.js"></script> 

    </body>

</html>

