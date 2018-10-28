var timeleft = 3;
var Timer = setInterval(function () {
    timeleft--;
    if (timeleft <= 0) {
        window.location.replace("GameOver?gameId="+document.getElementById('hiddenGameId').value
                    + "&score="+ document.getElementById('hiddenScore').value 
                    + "&userid="+ document.getElementById('userid').value 
                    + "&roomcode="+ document.getElementById('roomcode').value 
                    + "&username="+ document.getElementById('username').value );
        clearInterval(Timer);
    }
}, 1000);