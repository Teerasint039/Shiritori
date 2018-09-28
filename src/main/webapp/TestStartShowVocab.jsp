<%-- 
    Document   : TestStartShowVocab
    Created on : Sep 29, 2018, 1:13:07 AM
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
                        window.location.href = "GetVocabServlet?level=1&userid=1&username=new";
                    },2000);
                }
        </script> 
        
    </body>
</html>
