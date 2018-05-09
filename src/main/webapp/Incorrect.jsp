<%-- 
    Document   : Incorrect
    Created on : Apr 18, 2018, 1:10:43 PM
    Author     : Teerasint
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="MenuStyles.css">
        <title>Incorrect</title>

        <style>
            .logomenu{
                color: #FFFFFF;
            }
            .jumbotron{
                margin-top: 8%;
                margin-left: 15%;
                margin-right: 15%;
                margin-bottom: 5%;
                border-radius:10px;
                background: #dc143c;
            }
            h1{
                margin: 2%;
                color: #FFFFFF;
                font-size: 50px;
            }
        </style>
    </head>
    <body onload="myFunction()">
        <input type="hidden" id="hiddenChar" value="<%=request.getParameter("char")%>" />
        <input type="hidden" id="hiddenHeart" value="<%=request.getParameter("heart")%>" />
        <input type="hidden" id="hiddenScore" value="<%=request.getParameter("score")%>" />

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

        <div class="jumbotron text-center"> 
            <img src="Icon/Incorrect-mark-button.png" width="200px" height="200px">
            <h1>Incorrect</h1>
        </div>

        <script>
            function myFunction() {
                setTimeout(function () {
                    var heart = document.getElementById('hiddenHeart').value - 1;
                    if (heart <= 0) {
                        window.location.href = "GameOver.jsp";
                    } else
                        window.location.href = "SinglePlay.jsp?char=" + document.getElementById('hiddenChar').value + "&heart=" + heart + "&score=" + document.getElementById("hiddenScore").value;
                }, 3000);
            }
        </script>
    </body>
</html>
