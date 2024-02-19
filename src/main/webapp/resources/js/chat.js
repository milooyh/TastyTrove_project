console.log("연결됨 소켓");

var stompClient = null;

function connect() {
    var socket = new SockJS('/websocket');
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function (frame) {
        console.log('Connected: ' + frame);
        stompClient.subscribe('/topic/messages', function (message) {
            showMessage(JSON.parse(message.body).content);
        });
    });
}

function disconnect() {
    if (stompClient !== null) {
        stompClient.disconnect();
    }
    console.log("Disconnected");
}

function sendMessage() {
    var message = $("#message").val();
    stompClient.send("/app/chat", {}, JSON.stringify({'content': message}));
}

function showMessage(message) {
    $("#chat").append("<div>" + message + "</div>");
}
