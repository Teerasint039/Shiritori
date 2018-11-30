var timeleft = 2;
var Timer = setInterval(function () {
    timeleft--;
    if (timeleft <= 0) {
            $('body').loading({
            stoppable: true
        });
        document.getElementById("myForm").submit();
        clearInterval(Timer);
    }
}, 2000);