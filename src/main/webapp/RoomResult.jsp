<%@page import="Model.RoomResult"%>
<%@page import="Model.SingleModeGame"%>
<%@page import="Model.Room"%>
<%@page import="java.util.List"%>
<%@page import="Model.Vocab"%>
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

            .text-white-50 { color: rgba(255, 255, 255, .5); }

            .bg-purple { background-color: #6f42c1; }
            .bg-purple1 { background-color: #8b67cd; }

            .lh-100 { line-height: 1; }
            .lh-125 { line-height: 1.25; }
            .lh-150 { line-height: 1.5; }

        </style>
    </head>

    <body class="text-center">
        </form>-->
        <!-- pc -->
        <div class="container d-none d-md-block">
            <main role="main" class="container" style="margin-top: 10%;">
                <div class=" align-items-center p-3 my-3 text-white-50 bg-purple rounded shadow-sm">
                    <div class="lh-100" >
                        <div class="row">
                            <div class="col-md-4 text-left">
                                <a href ="MenuTeacher.jsp">
                                    <button type="button" class="btn btn-outline-light rounded-circle" style="width: 5rem; height: 5rem; border: 0; ">
                                        <img src="Icon/bthome.svg" class="img-fluid" alt="Responsive image" >
                                    </button>
                                </a>
                            </div> 
                            <div class="col-md-4 text-center" style="margin-top: 2%;">
                                <h4 class="text-white">Room Result</h4>
                            </div>                  
                        </div>
                    </div>
                </div>

                <div class=" align-items-center p-3 my-3 text-white-50 bg-purple1 rounded shadow-sm">
                    <div class="lh-100" >
                        <div class="row">
                            <div class="col-md-8" style="margin-top: 1%;">
                                <h4 class="text-white text-left">Code: <%=request.getAttribute("roomcode")%></h4>
                                <h4 class="text-white text-left">Level: <%=request.getAttribute("level")%></h4>
                                <h4 class="text-white text-left">Comment: <%=request.getAttribute("comment")%></h4>
                            </div>                        
                        </div>
                    </div>
                </div>

                <div class="my-3 p-3 bg-white rounded shadow-sm">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Number</th>
                                <th>Name</th>
                                <th>Score</th>          
                            </tr>
                        </thead>
                        <tbody>
                            <!--new-->
                            <%
                                List<RoomResult> results = (List) request.getAttribute("results");
                                int number = 0;
                                if (results != null) {
                                    for (RoomResult a : results) {
                                        number++;
                            %>
                            <tr>
                                <td><%=number%></td>
                                <td><%=a.getUserName()%></td>
                                <td><%=a.getScore()%></td>
                            </tr>
                            <%      }
                                }%>

                        </tbody>
                    </table> 
                </div>            

            </main>



        </div>

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

    </body>

</html>