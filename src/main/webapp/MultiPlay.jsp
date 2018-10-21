<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Shiritori Game</title>

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
              crossorigin="anonymous">

        <style>
            html, body{
                background-image: url("Icon/bgmulti.svg")  ;
                background-size: cover;
                background-position: center;
                background-attachment: fixed;
                background-repeat: no-repeat;
                font-family: "Montserrat";
            }

            #note-textarea {
                width: 100%;
                height: 80%;
                margin-top: 1%;
                padding-top: 4%;
                box-sizing: border-box;
                border-radius: 5px;
                font-size: 30px;
                resize: none;
                color: black;
                font-family: "Montserrat ExtraBold";
            }

            div.card {
                background: rgba(255, 255, 255, 0.1);
            }
        </style>
    </head>

    <body class="text-center">
        <!-- pc -->
        <div class="container">
            <div class="row mb-2"style="margin-top: 10%;">
                <!-- card1 -->
                <div class="col-md-6">
                    <div class="card shadow-sm h-md-250" >
                        <div class="row justify-content-md-center">
                            <div class="col-6 col-md-4">
                                <img src="Icon/score.png" class="img-fluid" alt="Responsive image" style="width: 7rem; margin-top: 10%; margin-right: 10%;">
                                <div class="card-img-overlay" style="color: black; margin-top: 3%; ">
                                    <h5><%=request.getParameter("score")%></h5>
                                </div>
                            </div>

                            <div class="col-6 col-md-4">
                                <img src="Icon/heart<%=request.getParameter("heart")%>.png" class="img-fluid" alt="Responsive image" style="width: 7rem; margin-top: 11%;">
                            </div>

                            <div class="col-6 col-md-4">
                                <img src="Icon/time.png" class="img-fluid" alt="Responsive image" style="width: 7rem; margin-top: 10%; margin-left: 20%;">
                                <div class="card-img-overlay" style="color: black; margin-top: 3%; margin-left: 30%;">
                                    <h5  id="countdowntimer">30</h5>
                                </div>
                            </div>
                        </div>

                        <div class="row justify-content-md-start">
                            <div class="col-6 ">
                                <img src="Icon/startwith & previous.png" class="img-fluid" alt="Responsive image" style="width: 20rem; margin-top: 2%">
                                <div class="card-img-overlay" style="margin-top: 9%; margin-left: 20%;">
                                    <h5><%=request.getParameter("previous")%></h5>
                                    <input type="hidden" id="hiddenGameId" value="<%=request.getParameter("gameId")%>" />
                                    <input type="hidden" id="level" value="<%=request.getParameter("level")%>" />
                                    <input type="hidden" id="userid" value="<%=request.getParameter("userid")%>" />
                                    <input type="hidden" id="username" value="<%=request.getParameter("username")%>" />
                                    <input type="hidden" id="hiddenChar" value="<%=request.getParameter("char")%>" />
                                    <input type="hidden" id="hiddenHeart" value="<%=request.getParameter("heart")%>" />
                                    <input type="hidden" id="hiddenScore" value="<%=request.getParameter("score")%>" />

                                    <h5><%=request.getParameter("char")%></h5>
                                </div>
                            </div>
                        </div>

                        <div class="row justify-content-md-center" style="margin-top: 2%; ">
                            <form>
                                <textarea  type="text" class="form-control text-center " id="note-textarea" aria-label="Large" aria-describedby="inputGroup-sizing-sm" placeholder="Vocab" readonly  ></textarea>
                            </form>
                        </div>

                        <div class="row justify-content-md-center" style=" color: #FFFFFF;">
                            <div class="col-md-auto "><h5 class="font-weight-normal">Meaning:</h5></div>
                            <div class="col-md-auto"><h5 class="font-weight-normal"id="meaning">None</h5></div>
                        </div>

                        <div class="row justify-content-md-center">
                            <div class="col col-md-12">
                                <button type="button" class="btn btn-outline-light rounded-circle border-0"  id="start-record-btn"  title="Start Recording" style="margin-top: 1%; width: 8rem; height: 8rem;" >
                                    <img src="Icon/microphone.png" class="img-fluid"  alt="Responsive image">
                                </button>
                            </div>
                        </div>

                        <div class="row justify-content-center">
                            <div class="col text-center" style="margin-top: 1%;color: white; font-size: 14px; margin-bottom: 1%;">
                                <p id="recording-instructions">Press the <strong>Start Recognition</strong> button and allow access.</p>                
                            </div>
                        </div> 
                    </div>
                </div>

                <!-- card2 -->
                <div class="col-md-6" >
                    <!-- card2.1 -->
                    <div class="card flex-md-row mb-4 shadow-sm h-md-250">
                        <div class="card-body d-flex flex-column align-items-start" >
                            <div class="row justify-content-center">
                                <div class="col-lg-4">
                                    <h4><strong class="d-inline-block mb-2 text-success">Player 1</strong> </h4>
                                </div>
                                <div class="col-lg-4">
                                    <img src="Icon/score.png" class="img-fluid" alt="Responsive image" style="width: 7rem;">
                                    <div class="card-img-overlay " style="color: black; margin-left: 15%;  ">
                                        <p class="text-center"><%=request.getParameter("score")%></p>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <img src="Icon/time.png" class="img-fluid" alt="Responsive image" style="width: 7rem; ">
                                    <div class="card-img-overlay" style="color: black; margin-left: 30%;">
                                        <h5  id="countdowntimer">30</h5>
                                    </div>
                                </div>
                            </div>                         

                            <input class="form-control text-center" type="text" placeholder="Vocab" readonly >
                        </div>
                    </div>

                    <!-- card2.2 -->
                    <div class="card flex-md-row mb-4 shadow-sm h-md-250">
                        <div class="card-body d-flex flex-column align-items-start" >
                            <h3 class="mb-0">
                                <strong class="d-inline-block mb-2 text-success">Player 2</strong>
                            </h3>
                            <input class="form-control text-center" type="text" placeholder="Vocab" readonly >
                        </div>
                    </div>

                    <!-- card2.3 -->
                    <div class="card flex-md-row mb-4 shadow-sm h-md-250">
                        <div class="card-body d-flex flex-column align-items-start" >
                            <h3 class="mb-0">
                                <strong class="d-inline-block mb-2 text-success">Player 3</strong>
                            </h3>
                            <input class="form-control text-center" type="text" placeholder="Vocab" readonly >
                        </div>
                    </div>

                    <!-- card2.4 -->
                    <div class="card flex-md-row mb-4 shadow-sm h-md-250">
                        <div class="card-body d-flex flex-column align-items-start" >
                            <h3 class="mb-0">
                                <strong class="d-inline-block mb-2 text-success">Player 4</strong>
                            </h3>
                            <input class="form-control text-center" type="text" placeholder="Vocab" readonly >
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

    </body>

</html>