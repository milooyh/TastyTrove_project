console.log("js연결됨");
const patternNum = /[0-9]/;
const patternKor = /^[ㄱ-ㅎ|가-힣]+$/;
const patternEng = /[a-zA-Z]/;
const patternSym = /[~!@#$%^&*()_+|<>?:{}]/;
const patternEmail = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

// 아아디 확인
$(document).ready(function() {
	$('#idChk_btn').click(function() {
		console.log("아이디 확인 버튼누림");

		var userId = $('#userId').val();
		var messageDiv = $('#idAvailabilityMessage');

		// input에 아무것도 입력하지 않으면
		if (userId.trim() === '') {
			messageDiv.text('아이디를 입력해주세요.');
			messageDiv.css('color', 'red');
			return;
		}

		// 아이디에 한글 입력하면
		if (patternKor.test(userId) == true) {
			messageDiv.text('아이디에는 영어, 숫자, 특수기호만 입력 가능합니다.');
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


// 비밀번호 확인
$(document).ready(function() {
	$('#pwChk_btn').click(function() {
		console.log("비밀번호 확인 버튼누림");
		var userPassword = $('#userPassword').val();
		var userPasswordChk = $('#userPasswordChk').val();
		var messageDiv = $('#pwAvailabilityMessage');

		// input에 아무것도 입력하지 않으면
		if (userPassword.trim() === '' || userPasswordChk.trim() === '') {
			messageDiv.text('비밀번호를 입력해주세요.');
			messageDiv.css('color', 'red');
			return;
		}

		// 비밀번호에 한글 입력하면
		if (patternKor.test(userPassword) == true) {
			messageDiv.text('비밀번호에는 영어, 숫자, 특수기호만 입력 가능합니다.');
			messageDiv.css('color', 'red');
			return;
		}

		// 영어, 숫자, 특수기호 조합으로 10글자 이내로 비밀번호를 입력해주세요
		if (patternEng.test(userPassword) == false) {
			messageDiv.text('영어, 숫자, 특수기호 조합으로 10글자 이내로 비밀번호를 입력해주세요.');
			messageDiv.css('color', 'red');
			return;
		}

		if (patternNum.test(userPassword) == false) {
			messageDiv.text('영어, 숫자, 특수기호 조합으로 10글자 이내로 비밀번호를 입력해주세요.');
			messageDiv.css('color', 'red');
			return;
		}

		if (patternSym.test(userPassword) == false) {
			messageDiv.text('영어, 숫자, 특수기호 조합으로 10글자 이내로 비밀번호를 입력해주세요.');
			messageDiv.css('color', 'red');
			return;
		}

		$.ajax({
			url: '/signup/checkPw',
			type: 'POST',
			data: { userPassword: userPassword, userPasswordChk: userPasswordChk },
			success: function(data) {
				console.log("data : " + data);

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

// 별명 확인
$(document).ready(function() {
	$('#nicknameChk_btn').click(function() {
		console.log("별명 확인 버튼누림");

		var userNickname = $('#userNickname').val();
		var messageDiv = $('#nickNameAvailabilityMessage');

		// input에 아무것도 입력하지 않으면
		if (userNickname.trim() === '') {
			messageDiv.text('별명을 입력해주세요.');
			messageDiv.css('color', 'red');
			return;
		}
		console.log(userNickname);

		$.ajax({
			url: '/signup/checknickname',
			type: 'POST',
			data: { userNickname: userNickname },
			success: function(data) {
				console.log(data);
				if (data == 0) {
					messageDiv.text('사용 가능한 별명입니다!');
					messageDiv.css('color', 'green');
				} else {
					console.log("실패");
					messageDiv.text('이미 사용 중인 별명입니다. 다른 별명을 입력해주세요.');
					messageDiv.css('color', 'red');
				}
			}
		});
	});
});


// 전번 확인
$(document).ready(function() {
	$('#telChk_btn').click(function() {
		console.log("전번 확인 버튼누림");

		var tel1 = $('#tel1').val();
		var tel2 = $('#tel2').val();
		var tel3 = $('#tel3').val();
		var messageDiv = $('#telAvailabilityMessage');

		// input에 아무것도 입력하지 않으면
		if (tel1.trim() === '' || tel2.trim() === '' || tel3.trim() === '') {
			messageDiv.text('전화번호를 입력해주세요.');
			messageDiv.css('color', 'red');
			return;
		}

		// 숫자 말고 입력을 하면
		if (patternKor.test(tel1) == true || patternKor.test(tel2) == true || patternKor.test(tel3) == true
			|| patternEng.test(tel1) == true || patternEng.test(tel2) == true || patternEng.test(tel3) == true
			|| patternSym.test(tel1) == true || patternSym.test(tel2) == true || patternSym.test(tel3) == true) {
			messageDiv.text('숫자만 입력 가능합니다.');
			messageDiv.css('color', 'red');
			return;
		}

		if (tel1.length > 4 || tel2.length > 5 || tel3.length > 5) {
			messageDiv.text('전화번호를 올바르게 입력하세요.');
			messageDiv.css('color', 'red');
			return;
		}

		$.ajax({
			url: '/signup/checktel',
			type: 'POST',
			data: { tel1: tel1, tel2: tel2, tel3: tel3 },
			success: function(data) {
				console.log(data);
				if (data == 0) {
					messageDiv.text('사용 가능한 전화번호입니다!');
					messageDiv.css('color', 'green');
				} else {
					console.log("실패");
					messageDiv.text('이미 가입된 전화번호입니다.');
					messageDiv.css('color', 'red');
				}
			}
		});
	});
});

// 이메일 확인
$(document).ready(function() {
	$('#emailChk_btn').click(function() {
		console.log("이메일 확인 버튼누림");

		var userEmail = $('#userEmail').val();
		var messageDiv = $('#emailAvailabilityMessage');
		console.log("#userEmail : " + userEmail);

		// input에 아무것도 입력하지 않으면
		if (userEmail.trim() === '') {
			messageDiv.text('이메일을 입력해주세요.');
			messageDiv.css('color', 'red');
			return;
		}

		//	이메일 형식에 맞지 않으면
		if (!patternEmail.test(userEmail)) {
			messageDiv.text('올바른 이메일을 입력하세요.');
			messageDiv.css('color', 'red');
			return;
		}

		console.log(userEmail);

		$.ajax({
			url: '/signup/checkemail',
			type: 'POST',
			data: { userEmail: userEmail },
			success: function(data) {
				console.log(data);

				if (data == 0) {
					messageDiv.text('사용 가능한 이메일입니다!');
					messageDiv.css('color', 'green');
				} else {

					messageDiv.text('이미 가입된 이메일입니다.');
					messageDiv.css('color', 'red');
				}
			}
		});
	});
});


$(document).ready(function() {
	$('form').submit(function(event) {
		var userId = $('#userId').val();
		var userPassword = $('#userPassword').val();
		var userPasswordChk = $('#userPasswordChk').val();
		var userName = $('#userName').val();
		var userNickname = $('#userNickname').val();
		var birthYear = $('#birthYear').val();
		var birthMonth = $('#birthMonth').val();
		var birthDate = $('#birthDate').val();
		var tel1 = $('#tel1').val();
		var tel2 = $('#tel2').val();
		var tel3 = $('#tel3').val();
		var userAddress = $('#userAddress').val();
		var userEmail = $('#userEmail').val();

		if (userId.trim() === '' || userPassword.trim() === '' || userPasswordChk.trim() === '' ||
			userName.trim() === '' || userNickname.trim() === '' || birthYear.trim() === '' || birthMonth.trim() === '' || birthDate.trim() === '' ||
			tel1.trim() === '' || tel2.trim() === '' || tel3.trim() === '' || userAddress.trim() === '' ||
			userEmail.trim() === '') {

			alert('모든 정보를 입력해주세요.');
			event.preventDefault();
		}
	});
});


