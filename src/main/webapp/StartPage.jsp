<%-- 
    Document   : StartPAge
    Created on : Mar 31, 2018, 12:12:46 AM
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
        <p id="beginWord"> The Game will start in </p>
        <span id="countdowntimer">3 </span>
        <p id="hidden"></p>

    </body>
    <script type="text/javascript">
    var timeleft = 3;
    var emptyString = "";
    var alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    emptyString = alphabet[Math.floor(Math.random() * alphabet.length)];
    var Timer = setInterval(function(){
    timeleft--;
    document.getElementById("countdowntimer").textContent = timeleft;
    
    
    
        if(timeleft <= 0){
            document.getElementById("beginWord").textContent = "";
            document.getElementById("countdowntimer").textContent = "";
        }
        if (timeleft <= -1) {
    
            document.getElementById("beginWord").textContent = "Start character is: ";
             document.getElementById("countdowntimer").textContent = emptyString;
//            window.alert("char: "+emptyString+"timeLife: "+timeleft);
        }
        if (timeleft <= -2) {
             window.location.href = "SinglePlay.jsp?char="+emptyString;
             clearInterval(Timer);

        }

//                window.location.href = "SinglePlay.jsp";
            
            
        
    },1000);
            
    
    
</script>
</html>
