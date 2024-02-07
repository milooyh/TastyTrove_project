<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/js/signup.js" type="text/javascript"></script>
</head>
<body>
	<h1>회원가입 페이지</h1>
	<hr>
	<form action="/signup" method="post">
		<label>아이디 : </label><input type="text" id="userId" name="userId">
		<button type="button" id="idChk_btn" name="idChk_btn">확인</button>
		<br> 
		<div id="idAvailabilityMessage"></div>
		<br>
		
		<label>비밀번호 : </label><input type="password"
			id="userPassword" name="userPassword">
		<button type="button" id="pwChk_btn" name="pwChk_btn">확인</button>
		<br> 
		
		
		<label>이름 : </label><input type="text" id="userName"
			name="userName"><br> 
			
			
			
			<label>별명 : </label><input
			type="text" id="userNickname" name="userNickname">
		<button type="button" id="nicknameChk_btn" name="nicknameChk_btn">확인</button>
		<br> 
		
		
		<label>출생연도 : </label><input type="text" name="birthYear">
		<label>출생월</label> <select name="birthMonth">
			<option disabled selected>월</option>
			<% 
            for (int i = 1; i <= 12; i++) {
                out.println("<option value='" + i + "'>" + i + "</option>");
            }
        %>
		</select><br> </select> <label>출생일</label> <select name="birthDate">
			<option disabled selected>일</option>
			<% 
            for (int i = 1; i <= 31; i++) {
                out.println("<option value='" + i + "'>" + i + "</option>");
            }
        %>
		</select><br> <label>전화번호 : </label><input type="text" id="tel1"
			name="tel1"> <input type="text" id="tel2" name="tel2">
		<input type="text" id="tel3" name="tel3">
		<button type="button" id="telChk_btn" name="telChk_btn">확인</button>
		<br> <label>주소 : </label><input type="text" id="userAddress"
			name="userAddress">
		<button type="button" id="addressChk_btn" name="addressChk_btn">확인</button>
		<br> <label>이메일 : </label><input type="text" id="userEmail"
			name="userEmail">
		<button type="button" id="emailChk_btn" name="emailChk_btn">확인</button>
		<br>

		<button type="submit">회원가입하기</button>
	</form>


</body>
</html>