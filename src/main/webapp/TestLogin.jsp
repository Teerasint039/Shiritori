<%-- 
    Document   : TestLogin
    Created on : Sep 28, 2018, 5:44:20 PM
    Author     : Teerasint
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>userid=<%=request.getAttribute("userid")%>
            username=<%=request.getAttribute("username")%></h1>
    </body>
</html>
