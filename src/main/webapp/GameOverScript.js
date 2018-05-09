var timeleft = 3;
var Timer = setInterval(function () {
    timeleft--;
    if (timeleft <= 0) {
        window.location.replace("GameOverServlet?gameId=1");
        clearInterval(Timer);
    }
}, 1000);