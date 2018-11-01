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
        <form action="updateItem">

  <input id="qta_field" name="quantita" value="${item.value}">
  <input type="hidden" name="codice" value="${item.key.codice}">

  <button>update</button>

</form>
<!--        <h1>userid=<%=request.getAttribute("userid")%>
            username=<%=request.getAttribute("username")%></h1>-->
    </body>
</html>
