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
                background-image: url("Icon/bgplaypractice.svg")  ;
                background-size: cover;
                background-position: center;
                background-attachment: fixed;
                background-repeat: no-repeat;
                font-family: "Montserrat ExtraBold";
            }
            .carousel-inner{
                border-radius: 25px;
            }
        </style>
    </head>

    <body class="text-center">

        <!-- main -->
        <div class="background">
            <!-- pc -->
            <div class="container mb-4 d-none d-sm-block">
                <div class="row justify-content-center" style="margin-top: 9%; color: white;">
                    <div class="col-md-12 ">
                        <a href ="Menu.jsp">
                            <button type="button" class="btn btn-outline-light rounded-circle border-0" style="width: 6rem; height: 6rem;border: 0; margin-right: 8rem; ">
                                <img src="Icon/bthome.svg" class="img-fluid" alt="Responsive image" >
                            </button>
                        </a>                       
                        <span class="center" style="font-size:30pt; margin-left: 2%; margin-top: 2%;margin-right: 16rem;">Practice Mode</span>
                    </div>
                </div>

                <div class="row justify-content-center" style="margin-top: 1%;">
                    <div class="col-md-2">
                        <a class="carousel-control" href="#carouselExampleIndicators" role="button" data-slide="prev">
                            <img src="Icon/left1.png" class="img-fluid" alt="Responsive image" style="width: 6rem; margin-top:60%;">
                        </a>
                    </div>
                    <div class="col-md-auto ">
                        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <form action="${pageContext.request.contextPath}/StartPracticeModeGameServlet" method="post" class="col-auto"style="margin-top: 5%;">
                                        <input type="hidden" name="categoryId" id="categoryId" value="3"/>
                                        <input type="image" src="Icon/Fruits.svg" alt="Submit Form" class="btn btn-light rounded " style="width: 30rem;height: 20rem;" value="submit" name="submit" />
                                    </form>
<!--                                    <button type="button" class="btn btn-light rounded " style="width: 30rem;height: 20rem;">
                                        <a href ="${pageContext.request.contextPath}/StartPracticeModeGameServlet?categoryId=3&userid=<%=request.getParameter("userid")%>&username=<%=request.getParameter("username")%>">
                                            <img src="Icon/Fruits.svg" class="img-fluid" alt="Responsive image">
                                        </a>
                                    </button>-->
                                </div>
                                <div class="carousel-item">
                                    <form action="${pageContext.request.contextPath}/StartPracticeModeGameServlet" method="post" class="col-auto"style="margin-top: 5%;">
                                        <input type="hidden" name="categoryId" id="categoryId" value="1"/>
                                        <input type="image" src="Icon/Animals.svg" alt="Submit Form" class="btn btn-light rounded " style="width: 30rem;height: 20rem;" value="submit" name="submit" />
                                    </form>
<!--                                    <button type="button" class="btn btn-light rounded" style="width: 30rem;height: 20rem;">
                                        <a href ="${pageContext.request.contextPath}/StartPracticeModeGameServlet?categoryId=1&userid=<%=request.getParameter("userid")%>&username=<%=request.getParameter("username")%>">
                                            <img src="Icon/Animals.svg" class="img-fluid" alt="Responsive image">
                                        </a>
                                    </button>-->
                                </div>
                                <div class="carousel-item">
                                    <form action="${pageContext.request.contextPath}/StartPracticeModeGameServlet" method="post" class="col-auto"style="margin-top: 5%;">
                                        <input type="hidden" name="categoryId" id="categoryId" value="2"/>
                                        <input type="image" src="Icon/Sports.svg" alt="Submit Form" class="btn btn-light rounded " style="width: 30rem;height: 20rem;" value="submit" name="submit" />
                                    </form>
<!--                                    <button type="button" class="btn btn-light rounded" style="width: 30rem;height: 20rem;">
                                        <a href ="${pageContext.request.contextPath}/StartPracticeModeGameServlet?categoryId=2&userid=<%=request.getParameter("userid")%>&username=<%=request.getParameter("username")%>">
                                            <img src="Icon/Sports.svg" class="img-fluid" alt="Responsive image">
                                        </a>
                                    </button>-->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <a class="carousel-control" href="#carouselExampleIndicators" role="button" data-slide="next">
                            <img src="Icon/right.png" class="img-fluid" alt="Responsive image" style="width: 6rem; margin-top:60%;">
                        </a>
                    </div>
                </div>

                <div class="row justify-content-end">
                    <div class="col-md-4">
                        <img src="Icon/Showrobot.svg" class="img-fluid" alt="Responsive image" style="width: 23rem; margin-top: 7%; margin-left: 20%;">
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
