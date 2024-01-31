<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입 페이지</h1>
	<hr>
	<form action="" method="post">
		<label>아이디 : </label><input type="text" id="userId" name="userId">
		<button type="button" id="idChk_btn" name="idChk_btn">확인</button>
		<br> <label>비밀번호 : </label><input type="password"
			id="userPassword" name="userPassword">
		<button type="button" id="pwChk_btn" name="pwChk_btn">확인</button>
		<br> <label>이름 : </label><input type="text" id="userName"
			name="userName"><br> <label>별명 : </label><input
			type="text" id="userNickname" name="userNickname">
		<button type="button" id="nicknameChk_btn" name="nicknameChk_btn">확인</button>
		<br> 
		
		<label>출생연도 : </label><input type="text" name="birthYear">
		<label>출생월 : </label> <select name="birthMonth">
			<option disabled selected>월</option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
			<option value="8">8</option>
			<option value="9">9</option>
			<option value="10">10</option>
			<option value="11">11</option>
			<option value="12">12</option>
		</select> 
		
		<label>출생일 : </label> <select name="birthDate">
			<option disabled selected>일</option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
			<option value="8">8</option>
			<option value="9">9</option>
			<option value="10">10</option>
			<option value="11">11</option>
			<option value="12">12</option>
			<option value="13">13</option>
			<option value="14">14</option>
			<option value="15">15</option>
			<option value="16">16</option>
			<option value="17">17</option>
			<option value="18">18</option>
			<option value="19">19</option>
			<option value="20">20</option>
			<option value="21">21</option>
			<option value="22">22</option>
			<option value="23">23</option>
			<option value="24">24</option>
			<option value="25">25</option>
			<option value="26">26</option>
			<option value="27">27</option>
			<option value="28">28</option>
			<option value="29">29</option>
			<option value="30">30</option>
			<option value="31">31</option>
		</select><br> 
		<label>전화번호 : </label><input type="text" id="tel1" name="tel1">
		<input type="text" id="tel2" name="tel2">
		<input type="text" id="tel3" name="tel3">
		<button type="button" id="telChk_btn" name="telChk_btn">확인</button>
		<br> 
		
		<label>주소 : </label><input type="text" id="userAddress" name="userAddress">
		<button type="button" id="addressChk_btn" name="addressChk_btn">확인</button>
		<br> 
		
		<label>이메일 : </label><input type="text" id="userEmail" name="userEmail">
		<button type="button" id="emailChk_btn" name="emailChk_btn">확인</button>
		<br>
		
		<button type="submit">회원가입하기</button>
	</form>
</body>
</html>