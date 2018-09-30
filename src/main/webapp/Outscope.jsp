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
            html, body{
                background-image: url("Icon/bgSingleplayer.png")  ;
                background-size: cover;
                background-position: center;
                background-attachment: fixed;
                background-repeat: no-repeat;
                font-family: "Montserrat ExtraBold";
            }
        </style>
    </head>
    <body class="text-center" onload="myFunction()">
        <input type="hidden" id="hiddenGameId" value="<%=request.getParameter("gameId")%>" />
        <input type="hidden" id="level" value="<%=request.getParameter("level")%>" />
        <input type="hidden" id="userid" value="<%=request.getParameter("userid")%>" />
        <input type="hidden" id="username" value="<%=request.getParameter("username")%>" />
        <input type="hidden" id="hiddenChar" value="<%=request.getParameter("char")%>" />
        <input type="hidden" id="hiddenPchar" value="<%=request.getParameter("pchar")%>" />
        <input type="hidden" id="hiddenHeart" value="<%=request.getParameter("heart")%>" />
        <input type="hidden" id="hiddenScore" value="<%=request.getParameter("score")%>" />
        <input type="hidden" id="hiddenPrevious" value="<%=request.getParameter("previous")%>" />

        <div class="container d-none d-md-block">
            <div class="row justify-content-md-center">
                <div class="col">
                    <img src="Icon/popupoutscope.png" class="img-fluid" alt="Responsive image" style="width: 45rem; height: 20em;margin-top: 13%; ">
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

                window.location.href = "SinglePlay.jsp?char=" + document.getElementById('hiddenPchar').value
                        + "&heart=" + document.getElementById("hiddenHeart").value
                        + "&gameId=" + document.getElementById("hiddenGameId").value
                        + "&level=" + document.getElementById('level').value
                        + "&userid=" + document.getElementById('userid').value
                        + "&username=" + document.getElementById('username').value
                        + "&previous=" + document.getElementById("hiddenPrevious").value
                        + "&score=" + document.getElementById("hiddenScore").value;
            }, 3000);
        }
        </script>

    </body>
</html>
