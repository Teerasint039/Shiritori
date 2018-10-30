<%@page import="Model.Room"%>
<%@page import="java.util.List"%>
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

            .text-white-50 { color: rgba(255, 255, 255, .5); }

            .bg-purple { background-color: #6f42c1; }

            .lh-100 { line-height: 1; }
            .lh-125 { line-height: 1.25; }
            .lh-150 { line-height: 1.5; }

        </style>
    </head>

    <body class="text-center">
        <!-- pc -->
        <div class="container mb-5 d-none d-sm-block">
            <main role="main" class="container" style="margin-top: 10%;">
                <div class=" align-items-center p-3 my-3 text-white-50 bg-purple rounded shadow-sm">
                    <div class="lh-100" >
                        <div class="row">
                            <div class="col-md-8" style="margin-top: 1%;">
                                <h4 class="text-white text-left">Create and Show Code</h4>
                            </div>
                            <div class="col-md-4 text-right">

                                <!-- Button trigger modal -->
                                <button type="button" class="btn btn-outline-light rounded-circle border-0" data-toggle="modal" data-target="#exampleModalCenter"style="width: 3rem; height: 3rem; ">
                                    <img src="../Icon/plus.svg" class="img-fluid" alt="Responsive image" >
                                </button>                                

                                <!-- Modal -->
                                <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" style="color: black;">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalCenterTitle">Create Room</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>

                                            <form action="#">
                                                <div class="modal-body" style="text-align: left;">
                                                    <div class="form-group row">
                                                        <label for="code" class="col-sm-4 col-form-label">Code:</label>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="inputPassword" class="col-sm-4 col-form-label">Level: </label>
                                                        <div class="col-sm-8">
                                                            <select class="form-control">
                                                                <option value="1">1</option>
                                                                <option value="2">2</option>
                                                                <option value="3">3</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="exampleFormControlTextarea1" class="col-sm-4 col-form-label">Comment: </label>   
                                                        <div class="col-sm-8">
                                                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="2"></textarea>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="modal-footer" >
                                                    <button type="button" class="btn btn-primary">OK</button>
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>                                              
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="my-3 p-3 bg-white rounded shadow-sm">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Code</th>
                                <th>Level</th>
                                <th>Comment</th>          
                            </tr>
                        </thead>
                        <tbody>
                            <!--new-->
                            <%
                                List<Room> rooms = (List) request.getAttribute("rooms");
                                if (rooms != null) {
                                    for (Room a : rooms) {
                            %>
                            <tr>
                                <td><%=a.getRoomCode()%></td>
                                <td><%=a.getLevel()%></td>
                                <td><%=a.getComment()%></td>
                            </tr>
                            <%}
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