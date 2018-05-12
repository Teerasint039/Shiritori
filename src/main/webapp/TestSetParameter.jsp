<%-- 
    Document   : TestSetParameter
    Created on : May 12, 2018, 2:49:00 PM
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
        <h1>Hello World!</h1>
        <%request.setAttribute("gameId","3");%>
        <%getServletContext().getRequestDispatcher("/TestSetAttribute.jsp").forward(request, response);%>

    </body>
</html>
