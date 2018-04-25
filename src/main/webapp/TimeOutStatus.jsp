<%-- 
    Document   : Status
    Created on : Apr 8, 2018, 12:29:18 AM
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
        <input type="hidden" id="hiddenChar" value="<%=request.getParameter("char")%>" />
        <input type="hidden" id="hiddenHeart" value="<%=request.getParameter("heart")%>" />
        <input type="hidden" id="hiddenScore" value="<%=request.getParameter("score")%>" />
        <img src="Icon/TimeOut.jpg" width="100%" height="100%">

        <script>
            function myFunction() {
                setTimeout(function () {
                    var heart = document.getElementById('hiddenHeart').value - 1;
                    if (heart <= 0) {
                        window.location.href = "GameOver.jsp";
                    } else
                        window.location.href = "SinglePlay.jsp?char=" + document.getElementById('hiddenChar').value + "&heart=" + heart + "&score=" + document.getElementById("hiddenScore").value;
                }, 3000);
            }
        </script>

    </body>
</html>
