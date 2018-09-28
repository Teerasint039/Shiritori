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
            body{
                background-image: url("Icon/backgroundMenu.png");
                overflow: hidden;
                background-size: cover;
                background-repeat: no-repeat;
            }

            html, body{
                height: 100%;
                margin: 0;
                padding: 0;
            }
            .img-fluid{
                width: 30em;
                height: 9rem;
                background-attachment: fixed;
                margin-top: 15%;
                background-repeat: no-repeat;
            }
        </style>
    </head>

    <body class="text-center">

        <!-- main -->
        <div class="background">
            <!-- pc -->
            <div class="container mb-5 d-none d-sm-block">
                <div class="row justify-content-center ">
                    <img class=" img-fluid" src="Icon/header.png" alt="" >
                </div>
                <div class="row justify-content-center ">
                    <form action="RegisterServlet" method="get" class="form-signin" style="width: 20rem" >
                        <label for="inputEmail" class="sr-only"  > User name</label>
                        <input type="text" name="username" id="inputText" class="form-control" placeholder="User name" required="" autofocus="">
                        <label for="inputPassword" class="sr-only">Password</label>
                        <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required="">
                        <button class="btn btn-lg btn-primary btn-block" type="submit" style="margin-top: 5%;">Register</button>
                        <a href ="Signin.jsp">
                        <button class="btn btn-danger btn-lg btn-block"  type="button" >Cancel</button>
                        </a>
                    </form>
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

    </body>

</html>
