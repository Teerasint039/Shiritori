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
            
    
    