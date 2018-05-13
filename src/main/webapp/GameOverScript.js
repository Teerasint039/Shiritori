var timeleft = 3;
var Timer = setInterval(function () {
    timeleft--;
    if (timeleft <= 0) {
        window.location.replace("GameOver?gameId="+document.getElementById('hiddenGameId').value);
        clearInterval(Timer);
    }
}, 1000);