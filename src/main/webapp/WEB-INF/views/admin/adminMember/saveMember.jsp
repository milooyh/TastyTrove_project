
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/adminMember.css?after"
	type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
	<%@include file="../adminHeader.jsp"%>
	<div class="content">
		<div class="content-title">관리자 추가</div>
		<hr>
		<div class="content-nav">
			<span>회원관리</span><span> - </span><span><a
				href="/admin/member">회원목록</a></span><span> - </span><span><a
				href="/admin/member/search">회원검색</a></span><span> - </span><span><a
				href="/admin/member/add">관리자추가</a></span>
		</div>
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
		<br> <label>출생연도 : </label><input type="text" name="birthYear">
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

		<button type="submit">관리자등록하기</button>
	</form>

	<br>
    <button onclick="location.href='/admin/member'">뒤로 가기</button>
</body>
</html>
</body>
</html>