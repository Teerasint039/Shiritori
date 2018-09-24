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

            .btn{
                width: 15rem;
                height: 4rem;
                border-width: 0.3ch;
                padding-top: 1%;
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
                    <img src="Icon/header.png" class="img-fluid">
                </div>
                <div class="row justify-content-center">
                    <a href="Menupractice.jsp" class="btn btn-lg btn-success border-white" style="margin-bottom: 1%; margin-top: 2%;">Practice Mode</a>
                </div>
                <div class="row justify-content-center">
                    <a href="${pageContext.request.contextPath}/StartSingleModeGameServlet" class="btn btn-lg btn-info border-white" style="margin-bottom: 1%; ">Single player</a>
                </div>
                <div class="row justify-content-center">
                    <a href="#" class="btn btn-lg btn-danger border-white" style="margin-bottom: 1%;">Multi player</a>
                </div>
            </div>

            <!-- sm phone -->
            <div class="container mb-5 d-md-none">
                <div class="row justify-content-center">
                    <img src="Icon/header.png" class="img-fluid" style="width: 25em;height: 7rem;background-attachment: fixed;margin-top: 15%;">
                </div>
                <div class="row justify-content-center">
                    <a href="#" class="btn btn-lg btn-success border-white" style="margin-bottom: 2%; margin-top: 3%; padding-top: 3%;">Practice
                        Mode</a>
                </div>
                <div class="row justify-content-center">
                    <a href="${pageContext.request.contextPath}/StartSingleModeGameServlet" class="btn btn-lg btn-warning border-white" style="margin-bottom: 2%; padding-top: 3%; color: #ffffff">Single
                        player</a>
                </div>
                <div class="row justify-content-center">
                    <a href="#" class="btn btn-lg btn-danger border-white" style="margin-bottom: 2%; padding-top: 3%;">Multi player</a>
                </div>
                <div class="row justify-content-center">
                    <a href="#" class="btn btn-lg btn-info border-white" style="padding-top: 3%;">Vocabulary</a>
                </div>
            </div>

        </div>

        <!-- footer -->


        <!-- Bootstrap core JavaScript -->

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>

    </body>

</html>