var timeleft = 3;
var Timer = setInterval(function () {
    timeleft--;
    if (timeleft <= 0) {
        document.getElementById('myForm').submit();
        clearInterval(Timer);
    }
}, 1000);