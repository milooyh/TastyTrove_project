console.log("js연결됨");
const patternNum = /[0-9]/;
const patternKor = /^[ㄱ-ㅎ|가-힣]+$/;
const patternEng = /[a-zA-Z]/;
const patternSym = /[~!@#$%^&*()_+|<>?:{}]/;

// 아아디 확인
$(document).ready(function() {
	$('#idChk_btn').click(function() {
		console.log("아이디 확인 버튼누림");
		
		var userId = $('#userId').val();
		
		if(userId.trim() === ''){ // input에 아무것도 입력하지 않으면
			var messageDiv = $('#idAvailabilityMessage');
            messageDiv.text('아이디를 입력해주세요.');
            messageDiv.css('color', 'red');
            return;
		}
		
		console.log(userId);
		$.ajax({
			url: '/signup/checkId',
			type: 'POST',
			data: { userId: userId },
			success: function(data) {
				console.log(data);
				var messageDiv = $('#idAvailabilityMessage');
				if (data == 0) {
					messageDiv.text('사용 가능한 아이디입니다!');
					messageDiv.css('color', 'green');
				} else {
					messageDiv.text('이미 사용 중인 아이디입니다. 다른 아이디를 입력해주세요.');
					messageDiv.css('color', 'red');
				}
			}
		});
	});
});

/*// 아이디 입력 안 하고 확인 버튼 눌렀을 때
function checkIdPattern(userId) {
	const idInput = document.getElementById('userId').value;
	const idChkBtn = document.getElementById('IdChk_btn');
	const idMessage = document.getElementById('idAvailabilityMessage');

	console.log("아이디 확인 버튼 눌림");
	if (patternKor.test(idInput) == true) {
		console.log("아이디에 한글 입력됨");
		idMassage.text('아이디는 영어, 숫자, 특수기호만 입력이 가능합니다.');
	
	}
	*/


// 비밀번호 확인
$(document).ready(function() {
	$('#pwChk_btn').click(function() {
		console.log("비밀번호 확인 버튼누림");
		var userPassword = $('#userPassword').val();
		var userPasswordChk = $('#userPasswordChk').val();

		console.log("userPassword : " + userPassword);
		console.log("userPasswordChk : " + userPasswordChk);

		$.ajax({
			url: '/signup/checkPw',
			type: 'POST',
			data: { userPassword: userPassword, userPasswordChk: userPasswordChk },
			success: function(data) {
				console.log("data : " + data);
				var messageDiv = $('#pwAvailabilityMessage');
				if (data == "0") {
					messageDiv.text('비밀번호가 일치합니다');
					messageDiv.css('color', 'green');
				} else {
					messageDiv.text('비밀번호가 일치하지 않습니다');
					messageDiv.css('color', 'red');
				}
			}
		});
	});
});


// 비밀번호 유호성 검사
function checkPasswordPattern(pw) {
	const pwInput = document.getElementById('pw').value; // 비번 입력값
	const pwBtn = document.getElementById('pwChkBtn'); // 확인 버튼
	let message = ""; // 출력 메세지

	const pattern1 = /[0-9]/;  // 숫자
	const pattern2 = /[a-zA-Z]/; // 영어
	const pattern4 = /[~!@#$%^&*()_+|<>?:{}]/;  // 특문

	console.log("버튼");
	// 숫자 존재하냐
	if (pattern1.test(pwInput) == false) {
		console.log("숫자없삼");
		message = "비밀번호에 숫자가 입력되지 않았습니다.\n숫자를 입력하여 주시기 바랍니다.";
	}

	// 영문 존재하냐
	if (pattern2.test(pwInput) == false) {
		console.log("영어없삼");
		message = "비밀번호에 영문 소문자가 입력되지 않았습니다.\n영문을 입력하여 주시기 바랍니다.";
	}

	// 특문 존재 하냐
	if (pattern4.test(pwInput) == false) {
		console.log("특문없삼");
		message = "비밀번호에 특수문자가 입력되지 않았습니다.\n특수문자를 입력하여 주시기 바랍니다.";
	}

	// 길이 검사
	if (pwInput.length < 3 || pwInput.length > 10) {
		console.log("길이오류");
		message = "비밀번호는 3자리 이상 10자리 이하만 가능합니다.\n비밀번호를 다시 입력하여 주시기 바랍니다.";
	}

	// 결과 출력
	if (message) {
		alert(message);
	} else {
		alert("사용 가능한 비밀번호입니다!");
	}
}

