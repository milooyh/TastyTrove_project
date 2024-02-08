<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인 페이지</h1>
	<hr>
	<form action="/login" method="post">
		<label>아이디 : </label><input type="text" id="userId" name="userId" required><br>
		<label>비밀번호 : </label><input type="password" id="userPassword" name="userPassword" required><br>
		<button type="submit" onclick="isNull()">로그인하기</button>
	</form>
	<c:if test="${not empty errorMessage}">
        <div style="color: red;">${errorMessage}</div>
    </c:if>
	
	<script>
		const inputUserId = document.querySelector("#userId");
		const inputUserPw = document.querySelector("#userPw");
		
		function isNull(){
			if(inputUserId == null || inputUsePw == null){
				alert("아이디와 비밀번호를 모두 입력해주세요.");
				location.reload();
			}
		}
	</script>
</body>
</html>