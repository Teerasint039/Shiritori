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
            html, body{
                background-image: url("Icon/bgTeacher.svg")  ;
                background-size: cover;
                background-position: center;
                background-attachment: fixed;
                background-repeat: no-repeat;
                font-family: "Montserrat";
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
<!--        <form action="${pageContext.request.contextPath}/ShowResultServlet" method="post">
            <div class="modal-body" style="text-align: left;">
                <div class="form-group row">
                    <label for="exampleFormControlTextarea1" class="col-sm-4 col-form-label">Code: </label>   
                    <div class="col-sm-8">
                        <input type="text" name="roomcode" id="roomcode">
                        <input type="submit" class="btn btn-primary" name="OK">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>      
                    </div>
                </div>
            </div>
        </form>-->
        <!-- pc -->
        <div class="container mb-5 d-none d-sm-block">
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
                                <h4 class="text-white text-left">Code:</h4><%=request.getAttribute("roomcode")%>
                                <h4 class="text-white text-left">Level:</h4><%=request.getAttribute("level")%>
                                <h4 class="text-white text-left">Comment:</h4><%=request.getAttribute("comment")%>
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