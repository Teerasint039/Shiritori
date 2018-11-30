<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" import="java.io.*"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="loading.css" rel="stylesheet">
        <title>Shiritori Game</title>

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
              crossorigin="anonymous">

        <style>
            body{
                background-image: url("Icon/bgSingleplayer.svg");
                overflow: hidden;
                background-size: cover;
                background-repeat: no-repeat;
                font-family: "Montserrat";
            }

            html, body{
                height: 100%;
                margin: 0;
                padding: 0;
            }
            #note-textarea {
                width: 76%;
                margin-top: 1%;
                padding-top: 4%;
                box-sizing: border-box;
                border-radius: 5px;
                font-size: 40px;
                resize: none;
                color: black;
                font-family: "Montserrat ExtraBold";
            }

        </style>
    </head>

    <body class="text-center">
        <div class="container d-none d-md-block">
            <div class="row justify-content-md-center">
                <div class="col-6 col-md-4">
                    <img src="Icon/score.svg" class="img-fluid" alt="Responsive image" style="width: 9rem; margin-top: 10%; margin-right: 10%;">
                    <div class="card-img-overlay" style="color: black; margin-top: 6%; ">
                        <h2><%=request.getParameter("score")%></h2>
                    </div>
                </div>

                <div class="col-6 col-md-4">
                    <img src="Icon/heart<%=request.getParameter("heart")%>.png" class="img-fluid" alt="Responsive image" style="width: 9rem; margin-top: 11%;">
                </div>

                <div class="col-6 col-md-4">
                    <img src="Icon/time.svg" class="img-fluid" alt="Responsive image" style="width: 9rem; margin-top: 10%; margin-left: 20%;">
                    <div class="card-img-overlay" style="color: black; margin-top: 6%; margin-left: 30%;">
                        <h2  id="countdowntimer">30</h2>
                    </div>
                </div>
            </div>

            <div class="row justify-content-md-start">
                <div class="col-6 ">
                    <img src="Icon/startwith & previou.svg" class="img-fluid" alt="Responsive image" style="width: 20rem; margin-top: 4%">
                    <div class="card-img-overlay" style="margin-top: 3%; margin-left: 20%;">
                        <h5 class="mt-4"><%=request.getParameter("char")%></h5>

                        <form action="/" method="post" id="myForm" name="myForm">
                            <input type="hidden" name="gameId" id="gameId" value="<%=request.getParameter("gameId")%>" />
                            <input type="hidden" name="level" id="level" value="<%=request.getParameter("level")%>" />
                            <input type="hidden" name="userid" id="userid" value="<%=request.getParameter("userid")%>" />
                            <input type="hidden" name="pchar" id="pchar" value="<%=request.getParameter("char")%>" />
                            <input type="hidden" name="heart" id="heart" value="<%=request.getParameter("heart")%>" />
                            <input type="hidden" name="score" id="score" value="<%=request.getParameter("score")%>" />
                            <input type="hidden" name="roomcode" id="roomcode" value="<%=request.getParameter("roomcode")%>" />
                            <input type="hidden" name="char" id="char" value="" />
                            <input type="hidden" name="vocab" id="vocab" value="" />
                            <input type="hidden" name="previous" id="previous" value="" />
                            <input type="hidden" name="status" id="status" value="" />
                            <input type="hidden" name="time" id="time" value="" />
                        </form>


                        <h5 class="mt-4 font-weight-normal"><%=request.getParameter("previous")%></h5>
                    </div>
                </div>
            </div>

            <div class="row justify-content-md-center">
                <div class="col ">
                    <img src="Icon/boxtext.svg" class="img-fluid" alt="Responsive image" style="width: 50rem; margin-top: 2%">
                    <div class="card-img-overlay" style="margin-top: 3%; margin-left: 20%;">
                        <form>
                            <textarea  type="text" class="form-control text-center " id="note-textarea" aria-label="Large" aria-describedby="inputGroup-sizing-sm" placeholder="Vocab" readonly  ></textarea>
                        </form>
                    </div>
                </div>
            </div>

            <div class="row justify-content-md-center" style=" color: #FFFFFF;">
                <div class="col-md-auto "><h5 class="font-weight-normal">Meaning:</h5></div>
            </div>

            <div class="row justify-content-md-center">
                <div class="col col-md-12">
                    <button type="button" class="btn btn-outline-light rounded-circle border-0"  id="start-record-btn"  title="Start Recording" style="margin-top: 1%; width: 8rem; height: 8rem;" >
                        <img src="Icon/microphone.svg" class="img-fluid"  alt="Responsive image">
                    </button>
                </div>
            </div>

            <div class="row justify-content-center">
                <div class="col text-center" style="margin-top: 1%;color: white; font-size: 14px; margin-bottom: 1%;">
                    <p id="recording-instructions">คลิกที่ปุ่ม <strong>Microphone</strong> เพื่อพูด</p>                
                </div>
            </div> 
        </div>

        <!-- sm -->
        <div class="container md-5 d-md-sm-none ">
            <div class="row justify-content-center ">
                <div class="card" style="margin-top: 50%; font-family: serif;">
                    <div class="card-body">
                        <h3>ไม่รองรับหน้าจอขนาดเล็กนะครับ</h3>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap core JavaScript -->

        <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
        <script src="Loading.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
        <script src="SingleScript.js"></script>

    </body>
</html>



