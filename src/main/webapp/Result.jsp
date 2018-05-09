<%@page import="java.util.List"%>
<%@page import="Model.Answer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="MenuStyles.css">

        <style>
            .logomenu{
                color: #FFFFFF;
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
        <title>Result</title>
    </head>
    <body>
        <header>
            <div class="container">
                <a href="Menu.jsp"><h1 class="logo logomenu">Shiritori<span>Logo</span></h1></a>

                <nav class="site-nav">
                    <ul>
                        <li><a href=""><i class="site-nav--icon"><img src="Icon/user.png" class="iconmenu"></i>Sign Up</a></li> 
                        <li><a href=""><i class="site-nav--icon"><img src="Icon/login.png" class="iconmenu"></i>Log In</a></li>
                    </ul> 
                </nav>

                <div class="menu-toggle">
                    <div class="hamburger"></div>
                </div>
            </div>
        </header>

        <div class="card">
            <h2 class="card-header" style="text-align: center;">Result</h2>
            <div class="card-body">
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <h5 class="card-title" style="text-align: center;">Soure: ..</h5>
                        </div>
                    </div>
                    <%
                        //List<Customer> customers = Customer.findByName("");
                        List<Answer> answers = (List) request.getAttribute("answers");
                        if (answers != null) {
                    %>
                    <div class="row text-center">                  
                        <div class="col">
                            <div class="card example-1 scrollbar-ripe-malinka">
                                <div class="card-body">
                                    <div class="row justify-content-between">
                                        <%
                                            for (Answer a : answers) {
                                                if (a.getStatus().equalsIgnoreCase("correct")) {
                                        %>
                                        <div class="col"><h5><%=a.getVocab()%></h5></div>
                                        <div class="col"><h5><%=a.getUsedTime()%></h5></div>
                                                <%  } else {
                                                %>
                                        <div class="col"><h5><%=a.getVocab()%></h5></div>
                                        <div class="col"><h5><%=a.getStatus()%></h5></div>
                                                <%}
                                                }
                                            } else {
                                            }%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row text-center">
                        <div class="col-6">
                            <a href="#" class="btn btn-primary">Play Again</a>
                        </div>
                        <div class="col-6">
                            <a href="#" class="btn btn-primary">Menu</a>
                        </div>
                    </div>
                </div>
            </div>

        </div>



        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="MenuScript.js"></script>
    </body>
</html>
