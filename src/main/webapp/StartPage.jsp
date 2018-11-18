<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Shiritori Game</title>

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
              crossorigin="anonymous">

        <style>
            html, body{
                background-image: url("Icon/bgSingleplayer.svg")  ;
                background-size: cover;
                background-position: center;
                background-attachment: fixed;
                background-repeat: no-repeat;
                font-family: "Montserrat ExtraBold";
            }
            div.jumbotron{
                margin-top: 15%;
                height: 25rem;
                border-radius:10px;
                background-color: #ffffff;
                opacity: 0.6;
                filter: alpha(opacity=60); /* For IE8 and earlier */
            }
        </style>
    </head>

    <body class="text-center">
        <!-- pc -->
        <div class="container d-none d-sm-block">
            <div class="jumbotron">                  
                <div class="row justify-content-center" >
                    <p id="beginWord"> The Game will start in </p>
                </div>         

                <div class="row justify-content-center" >
                    <h1 id="countdowntimer" style="font-size: 5cm;">3 </h1>
                    <form action="SinglePlay.jsp" method="post" id="myForm" name="myForm">
                        <input type="hidden" name="gameId" id="gameId" value="<%=request.getAttribute("gameId")%>" />
                        <input type="hidden" name="level" id="level" value="<%=request.getAttribute("level")%>" />
                        <input type="hidden" name="userid" id="userid" value="<%=request.getAttribute("userid")%>" />
                        <input type="hidden" name="roomcode" id="roomcode" value="<%=request.getAttribute("roomcode")%>" />
                        <input type="hidden" name="char" id="char" value="" />
                        <input type="hidden" name="heart" id="heart" value="3" />
                        <input type="hidden" name="score" id="score" value="0" />
                        <input type="hidden" name="previous" id="previous" value="" />
                    </form>
                </div>             
            </div>
        </div>

        <!-- sm -->
        <div class="container md-5 d-md-sm-none ">
            <div class="row justify-content-center ">
                <div class="card" style="margin-top: 50%; font-family: serif;">
                    <div class="card-body">
                        <h3>ไม่รองรับหน้าจอขนาดเล็กนะครับ</h3>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap core JavaScript -->

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
        <script src="StartPageScript.js"></script>

    </body>
</html>
