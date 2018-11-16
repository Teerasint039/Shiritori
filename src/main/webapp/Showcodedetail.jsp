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
            <div class="row  justify-content-center"style="margin-top: 5%; ">
                <div class="col-md-7" style="margin-top: 15%;" >
                    <div class="card flex-md-row mb-5 shadow-sm h-md-250">
                        <div class="card-body align-items-start" >
                            <h3 class="mb-0" style="margin-bottom: 3%;">
                                <strong class="d-inline-block mb-2 text-success">Room Detail</strong>
                            </h3>
                            <h6 class="text-black text-left">Code: <%=request.getAttribute("roomcode")%></h6>
                            <h6 class="text-black text-left">Level: <%=request.getAttribute("level")%></h6>
                            <h6 class="text-black text-left">Comment: <%=request.getAttribute("comment")%></h6>

                            <form action="${pageContext.request.contextPath}/StartSingleModeGameServlet" method="post">
                                <input type="hidden" id="level" name="level" value="<%=request.getAttribute("level")%>">
                                <input type="hidden" id="roomcode" name="roomcode" value="<%=request.getAttribute("roomcode")%>">
                                <button class="btn btn-primary" style="margin-top: 5%;" type="submit" style="margin-top: 10%; ">OK</button>
                            </form>

                            <form action="Menusingle.jsp" method="post">
                                <input type="hidden" id="alert" name="alert" value="">    
                                <button class="btn btn-primary" style="margin-top: 5%;" type="submit" style="margin-top: 10%; ">Back</button>
                            </form>
<!--                                <a href="${pageContext.request.contextPath}/StartSingleModeGameServlet?
                            userid=<%=request.getParameter("userid")%>&
                            username=<%=request.getParameter("username")%>
                            &level=<%=request.getAttribute("level")%>&
                            roomcode=<%=request.getAttribute("roomcode")%>"><button type="button" class="btn btn-primary" style="margin-top: 5%;">Ok</button></a>
                            
                         <a href="Menusingle.jsp?userid=<%=request.getParameter("userid")%>&
                            username=<%=request.getParameter("username")%>&
                            alert= "><button type="button" class="btn btn-secondary" data-dismiss="modal" style="margin-top: 5%;">Back</button></a>-->
                        </div>
                        <img class="card-img-right flex-auto d-none d-lg-block" style="width: 200px; height: 250px; " src="Icon/bgjoin.svg" data-holder-rendered="true" >
                    </div>              
                </div>
            </div>

            <!--            <form>
                            <main role="main" class="container" style="margin-top: 10%;">
                                <div class=" align-items-center p-3 my-3 text-white-50 bg-purple rounded shadow-sm">
                                    <div class="lh-100" >
                                        <div class="row">
                                            <div class="col-md-8" style="margin-top: 1%;">
                                                <h4 class="text-white text-left">Code:<%=request.getAttribute("roomcode")%></h4>
                                                <h4 class="text-white text-left">Level:<%=request.getAttribute("level")%></h4>
                                                <h4 class="text-white text-left">Comment:<%=request.getAttribute("comment")%></h4>
                                            </div>                        
                                        </div>                     
                                    </div>
                                </div>
                            </main>
                            <div class="modal-footer">
                                <a href="Menusingle.jsp?userid=<%=request.getParameter("userid")%>&username=<%=request.getParameter("username")%>&alert= "><button type="button" class="btn btn-secondary" data-dismiss="modal">Back</button></a>
                                <a href="${pageContext.request.contextPath}/StartSingleModeGameServlet?userid=<%=request.getParameter("userid")%>&username=<%=request.getParameter("username")%>&level=<%=request.getAttribute("level")%>&roomcode=<%=request.getAttribute("roomcode")%>"><button type="button" class="btn btn-primary">Ok</button></a>
                            </div>
                        </form>
            -->
        </div>

        <!-- sm phone -->

        <!-- Bootstrap core JavaScript -->

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
        <script>
            function goBack() {
                window.history.back();
            }
        </script>

    </body>

</html>