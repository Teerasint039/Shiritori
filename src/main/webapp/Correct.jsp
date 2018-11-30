<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
            body{
                background-image: url("Icon/bgSingleplayer.svg");
                overflow: hidden;
                background-size: cover;
                background-repeat: no-repeat;
                font-family: "Montserrat ExtraBold";
            }

            html, body{
                height: 100%;
                margin: 0;
                padding: 0;
            }
        </style>

    </head>
    <body class="text-center" onload="myFunction()">
        <form action="" method="post" id="myForm">
            <input type="hidden" id="gameId" name="gameId" value="<%=request.getAttribute("gameId")%>" />
            <input type="hidden" id="userid" name="userid" value="<%=request.getAttribute("userid")%>" />
            <input type="hidden" id="level" name="level" value="<%=request.getAttribute("level")%>" />
            <input type="hidden" id="roomcode" name="roomcode" value="<%=request.getAttribute("roomcode")%>" />
            <input type="hidden" id="char" name="char" value="<%=request.getAttribute("char")%>" />
            <input type="hidden" id="heart" name="heart" value="<%=request.getAttribute("heart")%>" />
            <input type="hidden" id="score" name="score" value="<%=request.getAttribute("score")%>" />
            <input type="hidden" id="time" name="time" value="<%=request.getAttribute("time")%>" />
            <input type="hidden" id="previous" name="previous" value="<%=request.getAttribute("previous")%>" />
        </form>

        <div class="container d-none d-md-block">
            <div class="row justify-content-md-center">
                <div class="col">
                    <img src="Icon/popupcorrect.png" class="img-fluid" alt="Responsive image" style="width: 45rem; height: 20em;margin-top: 13%; ">
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

        <script>
        function myFunction() {
            setTimeout(function () {
                var heart = document.getElementById('heart').value;
                var newScore = parseInt(document.getElementById('score').value) + 1;
                if (heart <= 0) {
                    document.getElementById("myForm").action = "GameOver.jsp";
                    document.getElementById("myForm").submit();
                } else {
                    document.getElementById("heart").value = heart;
                    document.getElementById("score").value = newScore;
                    document.getElementById("myForm").action = "SinglePlay.jsp";
                    document.getElementById("myForm").submit();
                }
            }, 3000);
        }
        </script>
    </body>
</html>
