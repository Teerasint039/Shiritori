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
                background-image: url("Icon/bgTeacher.svg");
                overflow: hidden;
                background-size: cover;
                background-repeat: no-repeat;
                font-family: "Montserrat";
            }

            html, body{
                height: 100%;
                margin: 0;
                padding: 0;
            }

        </style>
    </head>

    <body class="text-center">
        <!-- pc -->
        <div class="container d-none d-md-block">
            <div class="row justify-content-center" style="margin-top: 15%; color: white;">
                <div class="col-md-12 ">                      
                    <span class="center" style="font-size:30pt; margin-top: 2%;">Teacher</span>
                </div>
            </div>
            <div class="row mb-2"style="margin-top: 5%;">
                <div class="col-md-6">
                    <div class="card flex-md-row mb-4 shadow-sm h-md-250">
                        <div class="card-body d-flex flex-column align-items-start" >
                            <h5 class="mb-0">
                                <strong class="d-inline-block mb-2 text-primary">Create and Show Code</strong>
                            </h5>
                            <a href="${pageContext.request.contextPath}/ShowCodeServlet" class="btn btn-primary " style="margin-top: 5%; width: 13rem;">Create and Show Code</a>
                        </div>
                        <img class="card-img-right flex-auto d-none d-lg-block"   style="width: 200px; height: 250px;" src="Icon/bgcreatecode.svg" data-holder-rendered="true">
                    </div>
                </div>

                <div class="col-md-6" >
                    <form action="${pageContext.request.contextPath}/ShowResultServlet" method="post">
                        <div class="card flex-md-row mb-4 shadow-sm h-md-250">
                            <div class="card-body d-flex flex-column align-items-start" >
                                <h5 class="mb-0">
                                    <strong class="d-inline-block mb-2 text-success">Show result score</strong>
                                </h5>
                                <input type="text" id="roomcode" name="roomcode" class="form-control" placeholder="Code" required="" autofocus="">
                                <button type="text" name="Search" class="btn btn-success" style="margin-top: 5%; width: 13rem;" placeholder="Search...">Search</button>
                            </div>
                            <img class="card-img-right flex-auto d-none d-lg-block" style="width: 200px; height: 250px; " src="Icon/bgshowscore.svg" data-holder-rendered="true" >
                        </div>
                    </form>               
                </div>
            </div>

        </div>
        <input type="hidden" name="alert" id="alert" value="<%=request.getAttribute("alert")%>">

        <!-- sm -->
        <div class="container md-5 d-md-sm-none ">
            <div class="row justify-content-center ">
                <div class="card" style="margin-top: 50%; font-family: serif;">
                    <div class="card-body">
                        <h3>ไม่รองรับหน้าจอขนาดเล็กนะครับ</h3>
                    </div>
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
        <script>
            var message = document.getElementById("alert").value;
            if (message !== "null" && message !== null){
                window.alert(message);
            }
        </script>

    </body>

</html>