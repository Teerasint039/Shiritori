<%@page import="java.util.List"%>
<%@page import="Model.Answer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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

            .card{
                margin: 0 auto;
                margin-top: 4%;
                margin-left: 8%;
                margin-right: 8%;
            }

            .card-body{
                margin: 0 auto;
            }
            .example-1 {
                position: relative;
                overflow-y: scroll;
                height: 200px;
                width: 30rem;
                margin-bottom: 8%;
            }
            .scrollbar-ripe-malinka::-webkit-scrollbar {
                width: 12px;
                background-color: #F5F5F5; }

            .scrollbar-ripe-malinka::-webkit-scrollbar-thumb {
                border-radius: 10px;
                -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
                background-image: -webkit-linear-gradient(330deg, #f093fb 0%, #f5576c 100%);
                background-image: linear-gradient(120deg, #f093fb 0%, #f5576c 100%);
            }

        </style>

    </head>
    <body class="text-center">
        <div class="container d-none d-md-block">
            <div class="row justify-content-md-centerj">
                <div class="col">
                    <div class="card">
                        <h2 class="card-header" style="text-align: center;">Result</h2>
                        <div class="card-body">
                            <div class="container">
                                <div class="row">
                                    <div class="col">
                                        <h5 class="card-title" style="text-align: center;">Score: <%=request.getAttribute("score")%></h5>
                                    </div>
                                </div>
                                <%
                                    List<Answer> answers = (List) request.getAttribute("answers");
                                    if (answers != null) {
                                %>
                                <div class="row justify-content-center">                  
                                    <div class="col-md-auto">
                                        <div class="table-responsive example-1 scrollbar-ripe-malinka">
                                            <table class="table table-striped table-sm ">
                                                <thead>
                                                    <tr>
                                                        <th>Vocab</th>
                                                        <th>Result</th>
                                                    </tr>  
                                                </thead>
                                                <tbody>
                                                    <%
                                                        for (Answer a : answers) {
                                                    %>
                                                    <tr>
                                                        <td><div class="col"><h5><%=a.getVocab()%></h5></div></td>
                                                        <td><div class="col"><h5><%=a.getStatus()%></h5></div></td>
                                                    </tr>
                                                    <%}
                                                        }
                                                    %>
                                                </tbody>                                        
                                            </table>                                                                                                                             
                                        </div>
                                    </div>
                                </div>

                                <div class="row text-center">
                                    <div class="col-6">
                                        <a href="${pageContext.request.contextPath}/Menusingle.jsp" >
                                            <button type="button" class="btn btn-outline-light rounded-circle" style="width: 6rem;  height: 6rem; border: 0;margin-right: 7%; margin-top: 3%; ">
                                                <img src="Icon/Reset.svg" class="img-fluid" alt="Responsive image">                
                                            </button>
                                        </a>
                                    </div>
                                    <div class="col-6">
                                        <a href="${pageContext.request.contextPath}/Menu.jsp" >
                                            <button type="button" class="btn btn-outline-light rounded-circle" style="width: 6rem; height: 6rem; border: 0; margin-top: 3%;">
                                                <img src="Icon/bthome.svg" class="img-fluid" alt="Responsive image" >
                                            </button>
                                        </a>
                                    </div>
                                </div> 
                            </div>

                        </div>
                    </div>
                </div>
            </div>
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
        <script src="MenuScript.js"></script>
    </body>
</html>
