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
                background-image: url("Icon/backgroundMenu.svg");
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

            .btn{
                width: 18rem;
                height: 4rem;
                border-width: 0.3ch;
                padding-top: 1%;
            }

        </style>
    </head>

    <body class="text-center">

        <!-- pc -->
        <div class="container md-5 d-none d-sm-block">
            <div class="row justify-content-center ">
                <img src="Icon/header.svg" class="img-fluid" style="width: 30em;height: 9rem; background-attachment: fixed; margin-top: 15%; background-repeat: no-repeat;">
            </div>
            <div class="row justify-content-center">
                <a href="Menupractice.jsp" class="btn btn-lg btn-success border-white" style="margin-bottom: 1%; margin-top: 2%;">Practice Mode</a>
            </div>
            <div class="row justify-content-center">
                <a href="Menusingle.jsp" class="btn btn-lg btn-info border-white" style="margin-bottom: 1%; ">Single player</a>
            </div>

            <div class="row justify-content-end">
                <div class="col-auto"style="margin-top: 5%;">
                    <form action="${pageContext.request.contextPath}/GetVocabServlet" method="post" class="col-auto"style="margin-top: 5%;">
                        <input type="hidden" name="level" id="level" value="0"/>
                        <input type="image" src="Icon/dictionary.svg" alt="Submit Form" class="btn btn-outline-light rounded-circle border-0" style="width: 6rem; height: 6rem; border: 0;" value="submit" name="submit" />
                    </form>
<!--                    <a href ="GetVocabServlet?userid=<%=request.getParameter("userid")%>&username=<%=request.getParameter("username")%>&level=0" >
                        <button type="button" class="btn btn-outline-light rounded-circle border-0" style="width: 6rem; height: 6rem; border: 0;">
                            <img src="Icon/dictionary.svg" class="img-fluid" alt="Responsive image" >
                        </button>
                    </a>-->
                    <a href ="Signin.jsp" >
                        <button type="button" class="btn btn-outline-light rounded-circle border-0" style="width: 6rem; height: 6rem; border: 0;">
                            <img src="Icon/logout.svg" class="img-fluid" alt="Responsive image" >
                        </button>                       
                    </a>    
                </div>
            </div>
        </div>

        <!-- sm phone -->
        <div class="container md-5 d-sm-none ">
            <div class="row justify-content-center ">
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