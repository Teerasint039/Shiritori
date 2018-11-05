<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" import="java.io.*"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Practice Mode Game</title>

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
              crossorigin="anonymous">

        <style>
            html, body{
                background-image: url("Icon/bgplaypractice.svg")  ;
                background-size: cover;
                background-position: center;
                background-attachment: fixed;
                background-repeat: no-repeat;
                font-family: "Montserrat";
            }
        </style>
    </head>

    <body class="text-center">
        <!-- main -->
        <input type="hidden" id="gameId" value="<%=request.getAttribute("gameId")%>" />
        <input type="hidden" id="userid" value="<%=request.getParameter("userid")%>" />
        <input type="hidden" id="username" value="<%=request.getParameter("username")%>" />
        <input type="hidden" id="hiddenScore" value="<%=request.getAttribute("score")%>" />
        <input type="hidden" id="time" value="<%=request.getAttribute("time")%>" />
        <input type="hidden" id="hiddenVocab" value="<%=request.getAttribute("vocab")%>" />
        <input type="hidden" id="categoryId" value="<%=request.getAttribute("categoryId")%>" />
        <div class="background">
            <!-- pc -->

            <div class="container d-none d-md-block">
                <div class="row justify-content-md-center">
                    <div class="col-md-6">
                        <img src="Icon/score.svg" class="img-fluid" alt="Responsive image" style="width: 9rem; margin-top: 11%; margin-right: 10%;">
                        <div class="card-img-overlay" style="color: black; margin-top: 9%; margin-right: 50%;">
                            <h2><%=request.getAttribute("score")%></h2>
                        </div>

                        <img src="Icon/time.svg" class="img-fluid" alt="Responsive image" style="width: 9rem; margin-top: 11%; margin-left: 20%;">
                        <div class="card-img-overlay" style="color: black; margin-top: 9%; margin-left: 60%;">
                            <h2 id="countdowntimer"><%=request.getAttribute("time")%></h2>
                        </div>
                    </div>                
                </div>

                <div class="row justify-content-md-center ">
                    <div class="col-md-6 ">
                        <img src="Icon/Card<%=request.getAttribute("category")%>/card <%=request.getAttribute("vocab")%>.svg" class="img-fluid" alt="Responsive image" style="width: 30rem; margin-top: 5%;">
                    </div>
                </div>

                <div class="row justify-content-md-center">
                    <div class="col-md-auto" style="color: white; margin-top: 2%;" >            
                        <button type="button" class="btn btn-outline-light rounded-circle border-0" onclick="responsiveVoice.speak('<%=request.getAttribute("vocab")%>');" value="Listen" style="width: 6rem; height: 6rem;border: 0;  ">
                            <img src="Icon/sound.svg" class="img-fluid" alt="Responsive image" >
                        </button>               
                    </div>

                    <div class="col-md-auto" style=" margin-top: 4%;width: 20rem"> 
                        <div class="boxtext" >        
                            <input type="text" class="form-control text-center " id="note-textarea"   aria-label="Large" aria-describedby="inputGroup-sizing-sm" placeholder="Vocab" readonly>
                        </div>
                    </div> 

                    <div class="col-md-auto" style="color: white; margin-top: 2%;"  hidden>            
                        <p class="text-center">
                        <h2><%=request.getAttribute("vocab")%>:</h2>
                        </p>
                    </div>
                </div>

                <div class="row justify-content-md-center">
                    <div class="col col-md-12">
                        <button type="button" class="btn btn-outline-light rounded-circle border-0"  id="start-record-btn" style="margin-top: 5%; width: 8rem; height: 8rem;" >
                            <img src="Icon/microphone.svg" class="img-fluid"  alt="Responsive image">
                        </button>
                    </div>
                </div>

                <div class="row justify-content-center">
                    <div class="col text-center" style="color: white; font-size: 14px; margin-bottom: 1%;">
                        <p id="recording-instructions">คลิกท่ปุ่ม <strong>Microphone</strong>เพื่อพูด</p>                
                    </div>
                </div> 
                <div class="row justify-content-center" >
                    <div class="col text-center">
                        <!-- Button trigger modal -->
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter" id="status" hidden>
                            Launch demo modal
                        </button>

                        <!-- Modal -->
                        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">                        
                                    <div class="modal-body">
                                        <img src="Icon/popupcorrect.png" id="popupimg" class="img-fluid"  alt="Responsive image" style="width: 30rem;">
                                    </div>                               
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>


        <!-- Bootstrap core JavaScript -->

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
        <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
        <script src='https://code.responsivevoice.org/responsivevoice.js'></script>
        <script src="PracticeScript.js"></script> 

        <!--        <script language="javascript">
                    document.getElementById('note-textarea')=="";
                    console.log(document.getElementById('popupimg'))
                    if (document.getElementById('popupimg').src) {
                        console.log("SRCNAJA :");
                        let attribute = document.getElementById('popupimg').getAttribute("src");
                        console.log("Arr", attribute);
                    }
        //            window.alert(document.getElementById('note-textarea'));
                    if (document.getElementById('note-textarea') !== "") {
                        if (document.getElementById('popupimg').src !== "") {
                            $(document).ready(function () {
                                setTimeout(fnShowPopup, 500);            //code to show popup
                            });
                            function fnShowPopup() {
                                document.getElementById('status').click();
                            }
                        }
                    }
        
                </script>-->

    </body>

</html>

