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
                background-image: url("Icon/bgSingleplayer.svg");
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
            <div class="row justify-content-center" style="margin-top: 9%; color: white; font-family: Montserrat ExtraBold">
                <div class="col-md-12 ">
                    <a href ="Menu.jsp">
                        <button type="button" class="btn btn-outline-light rounded-circle border-0" style="width: 6rem; height: 6rem;border: 0; margin-right: 8rem; ">
                            <img src="Icon/bthome.svg" class="img-fluid" alt="Responsive image" >
                        </button>
                    </a>                       
                    <span class="center" style="font-size:30pt; margin-left: 2%; margin-top: 2%;margin-right: 16rem;">Single player</span>
                </div>
            </div>

            <div class="row mb-2"style="margin-top: 5%;">
                <div class="col-md-6">
                    <form>
                        <div class="card flex-md-row mb-4 shadow-sm h-md-250">
                            <div class="card-body d-flex flex-column align-items-start" >
                                <h3 class="mb-0">
                                    <strong class="d-inline-block mb-2 text-primary">PlayGame</strong>
                                </h3>
                                <a href="LevelSelection.jsp" class="btn btn-primary" style="margin-top: 5%; width: 10rem;">Play</a>
                            </div>
                            <img class="card-img-right flex-auto d-none d-lg-block"   style="width: 200px; height: 250px;" src="Icon/bgplay.svg" data-holder-rendered="true">
                        </div>
                    </form>
                </div>
                <div class="col-md-6" >
                    <form action="${pageContext.request.contextPath}/ShowRoomDetailServlet" method="post">
                        <div class="card flex-md-row mb-4 shadow-sm h-md-250">
                            <div class="card-body d-flex flex-column align-items-start" >
                                <h3 class="mb-0">
                                    <strong class="d-inline-block mb-2 text-success">Join room</strong>
                                </h3>
                                <input type="text" id="roomcode" name="roomcode" class="form-control" placeholder="Code" required="" autofocus="">
                                <button type="submit" name="Join" class="btn btn-success" style="margin-top: 5%; width: 10rem;" placeholder="Code">Join</button>
                            </div>
                            <img class="card-img-right flex-auto d-none d-lg-block" style="width: 200px; height: 250px; " src="Icon/bgjoin.svg" data-holder-rendered="true" >
                        </div>
                    </form>               
                </div>
            </div>
        </div>
        <input type="hidden" name="hiddenAlert" id="hiddenAlert" value="<%=request.getAttribute("alert")%>"  >

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

        <script>
            var message = document.getElementById("hiddenAlert").value;
            if (message !== "" || message !== = null) {
                window.alert(message);
            }
        </script>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
        <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>




    </body>

</html>