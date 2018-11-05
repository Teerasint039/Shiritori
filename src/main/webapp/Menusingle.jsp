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
                background-image: url("Icon/bgSingleplayer.svg")  ;
                background-size: cover;
                background-position: center;
                background-attachment: fixed;
                background-repeat: no-repeat;
                font-family: "Montserrat";
            }

        </style>
    </head>

    <body class="text-center">
        <!-- pc -->
        <div class="container lg-5 d-none d-md-block">
            <div class="row justify-content-center" style="margin-top: 9%; color: white; font-family: Montserrat ExtraBold">
                <div class="col-md-12 ">
                    <a href ="Menu.jsp?userid=<%=request.getParameter("userid")%>&username=<%=request.getParameter("username")%>">
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
                                <a href="LevelSelection.jsp?userid=<%=request.getParameter("userid")%>&username=<%=request.getParameter("username")%>" class="btn btn-primary" style="margin-top: 5%; width: 10rem;">Play</a>
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
                                <input type="hidden" id="userid" name="userid" value="<%=request.getParameter("userid")%>">
                                <input type="hidden" id="username" name="username" value="<%=request.getParameter("username")%>">
                                <button type="submit" name="Join" class="btn btn-success" style="margin-top: 5%; width: 10rem;" placeholder="Code">Join</button>
                                <!--<a href= class="btn btn-success" style="margin-top: 5%; width: 10rem;">Join</a>-->
                            </div>
                            <img class="card-img-right flex-auto d-none d-lg-block" style="width: 200px; height: 250px; " src="Icon/bgjoin.svg" data-holder-rendered="true" >
                        </div>
                    </form>               
                </div>
            </div>
        </div>
        <input type="hidden" name="hiddenAlert" id="hiddenAlert" value="<%=request.getParameter("alert")%>"  >



        <!-- Bootstrap core JavaScript -->
        
        <script>
            var message = document.getElementById("hiddenAlert").value;
            if (message !== "") {
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