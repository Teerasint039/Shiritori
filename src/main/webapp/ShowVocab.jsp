<%@page import="Model.Vocab"%>
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
                background-image: url("Icon/bgplaydictionary.svg")  ;
                background-size: cover;
                background-position: center;
                background-attachment: fixed;
                background-repeat: no-repeat;
                font-family: "Montserrat";
            }

            .btn{
                width: 15rem;
                height: 4rem;
                border-width: 0.3ch;
            }
            .card-body{
                margin: 0 auto;
            }
            .example-1 {
                position: relative;
                overflow-y: scroll;
                height: 350px;
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
            <div class="row justify-content-center" style="margin-top: 5%; color: white;">
                <div class="col-md-12 ">
                    <a href="${pageContext.request.contextPath}/Menu.jsp">
                        <button type="button" class="btn btn-outline-light rounded-circle border-0" style="width: 6rem; height: 6rem;border: 0; margin-right: 8rem; ">
                            <img src="Icon/bthome.svg" class="img-fluid" alt="Responsive image" >
                        </button>
                    </a>       
                    <span class="center" style="font-size:30pt; margin-left: 2%; margin-top: 2%;margin-right: 16rem;">Vocabulary</span>
                </div>
            </div>

            <div class="row justify-content-center" style="margin-top: 2%; color: white;">

                <form action="GetVocabServlet" method="post"  style="margin-right: 1%;">
                    <input type="hidden" name="level" id="level" value="1">
                    <input type="submit" name="Level 1" class="btn btn-lg btn-success "  value="Level 1">
                </form>
                <form action="GetVocabServlet" method="post" style="margin-right: 1%;">
                    <input type="hidden" name="level" id="level" value="2">
                    <input type="submit" name="Level 2" class="btn btn-lg btn-primary " style="margin-right: 1%;" value="Level 2">
                </form>
                <form action="GetVocabServlet" method="post">
                    <input type="hidden" name="level" id="level" value="3">
                    <input type="submit" name="Level 3" class="btn btn-lg btn-danger " style="" value="Level 3">
                </form>
                <!--<div class="col-md-auto ">-->
<!--                        <a href="GetVocabServlet?userid=<%=request.getParameter("userid")%>&username=<%=request.getParameter("username")%>&level=1" class="btn btn-lg btn-success border-white" style="">Level 1</a>
                        <a href="GetVocabServlet?userid=<%=request.getParameter("userid")%>&username=<%=request.getParameter("username")%>&level=2" class="btn btn-lg btn-info border-white" style=" ">Level 2</a>
                        <a href="GetVocabServlet?userid=<%=request.getParameter("userid")%>&username=<%=request.getParameter("username")%>&level=3" class="btn btn-lg btn-danger border-white" style="">Level 3</a>-->
                <!--</div>-->
            </div>

            <%
                List<Vocab> vocabs = (List) request.getAttribute("vocabs");
                if (vocabs != null) {
            %>
            <div class="row justify-content-center" style="margin-top: 5%; color: white;">
                <div class="col-md-auto">
                    <div class="table-responsive example-1 scrollbar-ripe-malinka">
                        <table class="table table-striped table-sm ">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Vocab</th>
                                    <th>Part of Speech</th>
                                    <th>Meaning</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    int i = 0;
                                    for (Vocab a : vocabs) {
                                        i++;
                                %>
                                <tr>
                                    <td><div class="col"><h5><%=i%></h5></div></td>
                                    <td><div class="col"><h5><%=a.getVocab()%></h5></div></td>
                                    <td><div class="col"><h5><%=a.getPartofSpeech()%></h5></div></td>
                                    <td><div class="col"><h5><%=a.getMeaning()%></h5></div></td>
                                </tr>         
                                <%}
                                    }%>
                            </tbody>
                        </table>
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
        <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
        <script src="MenuScript.js"></script>
    </body>
</html>
