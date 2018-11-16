var timeleft = 3;
var emptyString = "";
var alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
emptyString = alphabet[Math.floor(Math.random() * alphabet.length)];
var Timer = setInterval(function () {
    timeleft--;
    document.getElementById("countdowntimer").textContent = timeleft;



    if (timeleft <= 0) {
        document.getElementById("beginWord").textContent = "";
        document.getElementById("countdowntimer").textContent = "";
    }
    if (timeleft <= -1) {

        document.getElementById("beginWord").textContent = "Start character is: ";
        document.getElementById("countdowntimer").textContent = emptyString;
    }
    if (timeleft <= -2) {
        document.getElementById("char").value = emptyString;
        document.getElementById('myForm').submit();
//        window.location.href = "SinglePlay.jsp?char=" + emptyString + "&heart=3&score=0&previous=&gameId=" 
//                        + document.getElementById('hiddenGameId').value
//                        +"&level=" + document.getElementById('level').value
//                        +"&userid=" + document.getElementById('userid').value
//                        +"&roomcode=" + document.getElementById('roomcode').value;//send char, heart, score, gameId
        clearInterval(Timer);

    }
}, 1000);


    