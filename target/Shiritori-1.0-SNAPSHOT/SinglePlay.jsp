<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Voice Controlled Notes App</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/shoelace-css/1.0.0-beta16/shoelace.css">
        <link rel="stylesheet" href="miniStyles.css">

    </head>
    <body>
    <center>
        <div id="center">

            <h1>Shiritori</h1>
            <hr>
            <%	
		String character = request.getParameter("char");
		if (character != null) {
                        out.println("Start with : " + character);
                    }
	%>
        <br>
            <div class="app"> 
                <b>Previous Word: </b>
                <p id="previous">None</p>
                
                <div class="input-single">
                    <textarea id="note-textarea" placeholder="Vocab"></textarea>
                </div>         
                <br>
                    <b>Meaning: </b>
                    <p id="meaning">none</p>
                <button id="start-record-btn" title="Start Recording"><img src="sound-recorder-icon.png" /></button>
                <p id="recording-instructions">Press the <strong>Start Recognition</strong> button and allow access.</p>
                
            </div>

        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="script.js"></script>
    </center>
    </body>
</html>



