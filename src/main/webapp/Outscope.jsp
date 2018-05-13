<%-- 
    Document   : Status
    Created on : Apr 8, 2018, 12:29:18 AM
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
        <title>Out of Scope</title>

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
            }
            h1{
                margin: 2%;
                color: black;
                font-size: 50px;
            }
        </style>
    </head>
    <body onload="myFunction()">
        <<input type="hidden" id="hiddenGameId" value="<%=request.getParameter("gameId")%>" />
        <input type="hidden" id="hiddenChar" value="<%=request.getParameter("char")%>" />
        <input type="hidden" id="hiddenPchar" value="<%=request.getParameter("pchar")%>" />
        <input type="hidden" id="hiddenHeart" value="<%=request.getParameter("heart")%>" />
        <input type="hidden" id="hiddenScore" value="<%=request.getParameter("score")%>" />
        <input type="hidden" id="hiddenPrevious" value="<%=request.getParameter("previous")%>" />

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
            <img src="Icon/thinking.png" width="200px" height="200px">
            <h1>Out scope</h1>
        </div>

        <script>
            function myFunction() {
                setTimeout(function () {
                    
                        window.location.href = "SinglePlay.jsp?char=" + document.getElementById('hiddenPchar').value
                                + "&heart=" + document.getElementById("hiddenHeart").value
                                + "&gameId=" + document.getElementById("hiddenGameId").value
                                + "&previous=" + document.getElementById("hiddenPrevious").value
                                + "&score=" + document.getElementById("hiddenScore").value;
                }, 3000);
            }
        </script>

    </body>
</html>
