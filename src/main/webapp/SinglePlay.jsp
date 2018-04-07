<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="MenuStyles.css">
    <link rel="stylesheet" href="SingleStyles.css">
    <title>Voice Controlled Notes App</title>
</head>
<body>

    <header >
        <div class="container ">
            <h1 class="logo">Shiritori<span>Logo</span></h1>

            <nav class="site-nav ">
                <ul>
                    <li><a href=""><i class="site-nav--icon"><img src="Icon/user.png" class="iconmenu"></i>Sign up</a></li> 
                    <li><a href=""><i class="site-nav--icon"><img src="Icon/login.png" class="iconmenu"></i>Login</a></li>
                </ul> 
            </nav>

            <div class="menu-toggle">
                <div class="hamburger"></div>
            </div>
        </div>
    </header>



    <div class="container">

        <div class="jumbotron">
            <p class="h1">Single Player</p>
            <hr class="my-4">

             <div class="row justify-content-center">
                <div class="col-md-auto ">
                    <p>Start with: <b>${param.char}</b></p>
                    
            <input type="hidden" id="hiddenChar" value="${param.char}" />
            <input type="hidden" id="hiddenHeart" value="${param.heart}" />
                </div> 
                &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                <img src="Icon/heart${param.heart}.jpg">
                &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                <div class="row ">
                    <B>Timer: </B>
                    &emsp;
                    <span id="countdowntimer">10 </span>
                </div>  
            </div>
                <br>

            <div class="row justify-content-center">
                <div class="col-md-auto ">
                    <p class="font-weight-bold">Previous Word:</p>                  
                </div>
                <div class="col-md-auto ">
                    <p class="font-weight-normal" id="previous">None</p>
                </div>
            </div>

            <div class="row">
                <div class="col text-center ">
                    <div class="input-group input-group-lg" >        
                        <input type="text" class="form-control text-center " id="note-textarea"   aria-label="Large" aria-describedby="inputGroup-sizing-sm" placeholder="Vocab" readonly>
                    </div>
                </div>
            </div>
            <br>
            <div class="row  justify-content-center">
                <div class="col-sm-auto">
                    <p class="font-weight-bold">Meaning:</p>
                </div>
                <div class="col-sm-auto">
                    <p class="font-weight-normal"id="meaning">None</p>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col text-center">
                    <button type="button" class="btn btn-light"  id="start-record-btn" title="Start Recording"><img src="Icon/microphone-voice-tool-circular-black-button.png" width="100" hight="100" /></button> 
                </div>
            </div>
            <br>
            <div class="row">
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
    <script src="SingleScript.js"></script>

</body>
</html>



