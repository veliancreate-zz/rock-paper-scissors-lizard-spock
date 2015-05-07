$(document).ready(function(){
  function addMessage(msg){
    $('#chat-log').append('' + msg + '');
  }

  var socket, host;
  host = 'ws://localhost:3001'
  function connect(){
    try{
      socket = new WebSocket(host);
      addMessage("Socket State: " + socket.readyState + "(open)");
      socket.onopen = function(){
        addMessage("Socket Status: " + socket.readyState + "(closed)");
      }
      socket.onmessage = function(msg){
        addMessage("Received: " + msg.data);
      }
    } catch(exception){
      addMessage("Error: " + exception);
    }
  }

  $(function(){
    connect();
  });

  function send() {
    var text = $("#message").val();
    if (text == '') {
      addMessage("Please Enter a Message");
      return;
    }

    try {
      socket.send(text);
      addMessage("Sent: " + text)
    } catch(exception) {
      addMessage("Failed To Send")
    }

    $("#message").val('');
  }

  $('#message').keypress(function(event) {
    if (event.keyCode == '13') { send(); }
  });

  $("#disconnect").click(function() {
    socket.close()
  });  
});