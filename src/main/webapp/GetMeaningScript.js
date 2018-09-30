var timeleft = 2;
var Timer = setInterval(function () {
    timeleft--;
    if (timeleft <= 0) {
//        window.location.replace("AddAnswerServlet?char=A") ;
//        window.location.replace("AddAnswerServlet?char=A&heart=3&score=4&gameId=1&time=10&vocab=ache&status=Correct") ;
        window.location.replace("AddAnswerServlet?char=" + document.getElementById('hiddenChar').value 
                + "&heart="+document.getElementById('hiddenHeart').value 
                +"&level="+document.getElementById('level').value 
                +"&score="+document.getElementById('hiddenScore').value 
                + "&gameId="+document.getElementById('hiddenGameId').value 
                + "&time="+document.getElementById('hiddenTime').value  
                + "&vocab="+document.getElementById('hiddenVocab').value  
                + "&status="+document.getElementById('hiddenStatus').value 
                    + "&userid="+ document.getElementById('userid').value 
                    + "&username="+ document.getElementById('username').value) ;
        clearInterval(Timer);
    }
}, 2000);