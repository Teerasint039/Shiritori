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
                background-image: url("../Icon/bgTeacher.svg")  ;
                background-size: cover;
                background-position: center;
                background-attachment: fixed;
                background-repeat: no-repeat;
                font-family: "Montserrat";
            }

            .btn{
                width: 15rem;
                height: 4rem;
                border-width: 0.3ch;
                padding-top: 1%;
            }
            
        </style>
    </head>

    <body class="text-center">
        <!-- pc -->
        <div class="container mb-5 d-none d-sm-block">
            <div class="row justify-content-center" style="margin-top: 15%; color: white;">
                <div class="col-md-12 ">                      
                    <span class="center" style="font-size:30pt; margin-top: 2%;">SinglePlay</span>
                </div>
            </div>

            <div class="row justify-content-center">
                <a href="#" class="btn btn-lg btn-success border-white" style="margin-bottom: 1%; margin-top: 2%;">Create and Show Code</a>
            </div>
            <div class="row justify-content-center">
                <a href="#" class="btn btn-lg btn-info border-white" style="margin-bottom: 1%; ">Show result score</a>
            </div>
        </div>

        <!-- sm phone -->

        <!-- Bootstrap core JavaScript -->

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>

    </body>

</html>