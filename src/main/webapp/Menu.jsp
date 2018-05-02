<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="MenuStyles.css">
        <link rel="stylesheet" href="SingleStyles.css">

        <style>
            .button1{
                background-color: #E54B4B;
                color: white;
                border: 2px solid white;
                margin: 0 auto;
                margin-bottom: 3%;
                width: 250px;
                height: 70px;
                box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
            }
            .button1:hover{
                background-color:#ce3131; 
                color: white; 
            }
            .logomenu{
                color: #FFFFFF;
            }
        </style>

        <title>Menu</title>

    </head>
    <body>

        <header>
            <div class="container">
                    <a href="Menu.jsp"><h1 class="logo logomenu">Shiritori<span>Logo</span></h1></a>
                
                <nav class="site-nav">
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

        <div class="container">
            <div class="jumbotron">             
                 <div class="row justify-content-center">
                     <a href="#"><button type="button" class="btn button1 ">Practice Mode</button></a>
                </div>         
                
                <div class="row  justify-content-center">
                    <a href="StartPage.jsp" ><button type="button" class="btn button1 ">Single player</button></a>
                </div>             

                <div class="row justify-content-center">
                    <a href="#"><button type="button" class="btn button1 ">Multi player</button></a>
                </div>
                
                 <div class="row justify-content-center">
                     <a href="#"><button class="button" style="vertical-align:middle"><span>Vocab </span></button></a>
                </div>
            </div>
        </div>



        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="MenuScript.js"></script>
    </body>
</html>
