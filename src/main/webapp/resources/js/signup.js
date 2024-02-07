console.log("js연결됨");

$(document).ready(function() {
    $('#idChk_btn').click(function() {
        console.log("아이디 확인 버튼누림");
        var userId = $('#userId').val();
        console.log(userId);
        $.ajax({
            url: '/signup/checkId',
            type: 'POST',
            data: { userId: userId },
            success: function(data) {
                console.log(data);
                var messageDiv = $('#idAvailabilityMessage');
                if (data == null) {
                    messageDiv.text('사용 가능한 아이디입니다!');
                    messageDiv.css('color', 'green'); // 사용 가능한 경우에는 초록색으로 표시
                } else {
                    messageDiv.text('이미 사용 중인 아이디입니다. 다른 아이디를 입력해주세요.');
                    messageDiv.css('color', 'red'); // 사용 불가능한 경우에는 빨간색으로 표시
                }
            }
        });
    });
});
