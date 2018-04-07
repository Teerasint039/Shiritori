<%-- 
    Document   : index
    Created on : Apr 8, 2018, 2:28:45 AM
    Author     : Teerasint
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body onload="myFunction()">
        <H1>Hello Shiritori Game!</H1>
        <script>
                function myFunction() {
                    setTimeout(function(){
                        window.location.href = "StartPage.jsp";
                    },2000);
                }
        </script>
    </body>
</html>
