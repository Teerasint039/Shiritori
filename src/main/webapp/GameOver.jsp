<%-- 
    Document   : GameOver
    Created on : Apr 8, 2018, 2:07:54 AM
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
        <title>Game Over</title>

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

        <div class="jumbotron text-center"> 
            <img src="Icon/crying.png" width="200px" height="200px">
            <h1>Game over</h1>
        </div>

    </body>
</html>
