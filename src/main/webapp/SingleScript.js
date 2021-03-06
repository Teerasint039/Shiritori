//Mission
//Change firstchar to UpperCase!
//check determine word

try {
    var SpeechRecognition = window.webkitSpeechRecognition;
    var recognition = new SpeechRecognition();
    recognition.lang = "en";
} catch (e) {
    console.error(e);
    $('.no-browser-support').show();
    $('.app').hide();
}


var noteTextarea = $('#note-textarea');
var instructions = $('#recording-instructions');
var notesList = $('ul#notes');
var firstchar = '';
var lastchar = '';
var determine = '';
var bigCase = '';
var noteContent = '';
var before = '';
var timeleft = 30;
var time = '';
// Get all notes from previous sessions and display them.
var notes = getAllNotes();
renderNotes(notes);
/*-----------------------------
 Voice Recognition 
 ------------------------------*/

// If false, the recording will stop after a few seconds of silence.
// When true, the silence period is longer (about 15 seconds),
// allowing us to keep recording even when the user pauses. 
//recognition.continuous = true;
recognition.continuous = false;
// This block is called every time the Speech APi captures a line. 
recognition.onresult = function (event) {
    document.getElementById('start-record-btn').disabled = true;
    // event is a SpeechRecognitionEvent object.
    // It holds all the lines we have captured so far. 
    // We only need the current one.
    var current = event.resultIndex;
    // Get a transcript of what was said.
    var transcript = event.results[current][0].transcript;

    // Add the current transcript to the contents of our Note.
    // There is a weird bug on mobile, where everything is repeated twice.
    // There is no official solution so far so we have to handle an edge case.
    var mobileRepeatBug = (current == 1 && transcript == event.results[0][0].transcript);
    if (!mobileRepeatBug) {
        before = noteContent;
        noteContent = transcript;
        noteTextarea.val(noteContent);
    }
    $('body').loading({
        stoppable: true
    });

    /*-----------------------------
     Determine Check
     ------------------------------*/

    bigCase = noteContent.toLocaleUpperCase();
    firstchar = bigCase.substring(0, 1);
    lastchar = bigCase.slice(-1);

    clearInterval(Timer);
    time = timeleft;
    setTimeout(function () {
        if (firstchar === document.getElementById('pchar').value) {
            determine = true;
            document.getElementById("char").value = lastchar;
            document.getElementById("vocab").value = noteContent;
            document.getElementById("previous").value = before;
            document.getElementById("status").value = "Correct";
            document.getElementById("time").value = time;
            document.getElementById('myForm').action = "CheckAnswerServlet";
            document.getElementById('myForm').submit();
        } else {
            determine = false;
            document.getElementById("char").value = lastchar;
            document.getElementById("vocab").value = noteContent;
            document.getElementById("previous").value = before;
            document.getElementById("status").value = "Incorrect";
            document.getElementById("time").value = time;
            document.getElementById('myForm').action = "CheckAnswerServlet";
            document.getElementById('myForm').submit();
        }

    }, 2500);
};
recognition.onstart = function () {
    instructions.text('พูดเลย');
}

recognition.onspeechend = function () {
    instructions.text('กดปุ่มอีกครั้งนะ');
}


recognition.onerror = function (event) {
    if (event.error == 'no-speech') {
        instructions.text('No speech was detected. Try again.');
    }
    ;
}



/*-----------------------------
 App buttons and input 
 ------------------------------*/

$('#start-record-btn').on('click', function (e) {
    if (noteContent.length) {
        noteContent += ' ';
    }
    recognition.start();
});
// Sync the text inside the text area with the noteContent variable.
noteTextarea.on('input', function () {
    noteContent = $(this).val();
})

notesList.on('click', function (e) {
    e.preventDefault();
    var target = $(e.target);
    // Listen to the selected note.
    if (target.hasClass('listen-note')) {
        var content = target.closest('.note').find('.content').text();
        readOutLoud(content);
    }

    // Delete note.
    if (target.hasClass('delete-note')) {
        var dateTime = target.siblings('.date').text();
        deleteNote(dateTime);
        target.closest('.note').remove();
    }
});
/*-----------------------------
 Helper Functions 
 ------------------------------*/

function renderNotes(notes) {
    var html = '';
    if (notes.length) {
        notes.forEach(function (note) {
            html += `<li class="note">
        <p class="header">
          <span class="date"><%=request.getParameter("heart")%></span>
          <a href="#" class="delete-note" title="Delete">Delete</a>
        </p>
          <a href="#" class="listen-note" title="Listen to Note">Listen to Note</a>
        <p class="content">${note.content}</p>
      </li>`;
        });
    } else {
        html = '<li><p class="content">You don\'t have any notes yet.</p></li>';
    }
    notesList.html(html);
}

function getAllNotes() {
    var notes = [];
    var key;
    for (var i = 0; i < localStorage.length; i++) {
        key = localStorage.key(i);
        if (key.substring(0, 5) == 'note-') {
            notes.push({
                date: key.replace('note-', ''),
                content: localStorage.getItem(localStorage.key(i))
            });
        }
    }
    return notes;
}


/*-----------------------------
 Time Check
 ------------------------------*/


var Timer = setInterval(function () {
    timeleft--;
    document.getElementById("countdowntimer").textContent = timeleft;
    if (timeleft <= 0) {
//        window.alert(lastchar);
        document.getElementById("countdowntimer").textContent = "";
        document.getElementById("char").value = document.getElementById("pchar").value;
        document.getElementById("vocab").value = noteContent;
        document.getElementById("previous").value = before;
        document.getElementById("time").value = time;
        clearInterval(Timer);
        document.getElementById('myForm').action = "TimeOut.jsp";
        document.getElementById('myForm').submit();
    }

}, 1000);

