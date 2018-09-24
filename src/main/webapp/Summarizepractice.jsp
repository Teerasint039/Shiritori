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
        <div class="background">
            <!-- pc -->
            <div class="container d-none d-md-block">             
                <div class="row justify-content-md-center">
                    <div class="col">
                        <img src="Icon/popupGameoverpractice.png" class="img-fluid" alt="Responsive image" style="width: 35rem; margin-top: 4%;">
                        <div class="card-img-overlay" style="color: black; margin-top: 21%; ">
                            <h2 style="font-size: 2cm;">3</h2>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-md-center">
                    <div class="col">
                        <button type="button" class="btn btn-outline-light rounded-circle" style="width: 5rem; margin-right: 7%;  height: 5rem; border: 0;">
                            <img src="Icon/Reset.png" class="img-fluid" alt="Responsive image">                
                        </button>
                        <button type="button" class="btn btn-outline-light rounded-circle" style="width: 5rem; height: 5rem; border: 0;">
                        <img src="Icon/bthome.png" class="img-fluid" alt="Responsive image" >
                        </button>
                    </div>
                </div>
            </div>

            <!-- sm phone -->

        </div>


        <!-- Bootstrap core JavaScript -->

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
        <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>

    </body>

</html>


