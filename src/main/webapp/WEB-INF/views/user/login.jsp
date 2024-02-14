<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/login.css?after"
	type="text/css" />

</head>
<body>
	<jsp:include page="../main/header.jsp"></jsp:include>



	<div class="content">
		<div class="content-login">
			<div class="content-itme title">로그인</div>
			<form action="/login" method="post">
				<div class="content-item">
					<label>아이디 : </label><input type="text" id="userId" name="userId"
						required>
				</div>
				<div class="content-item">
					<label>비밀번호 : </label><input type="password" id="userPassword"
						name="userPassword" required>
				</div>


				<div id="alertMessage" style="display: none;"
					th:text="${alertMessage}" class="content-item"></div>
				<c:if test="${not empty errorMessage}">
					<div style="color: red; text-align: center;" class="content-item">${errorMessage}</div>
				</c:if>

				<div class="content-item" style="text-align: center;">
					<button type="submit" onclick="isNull()" id="searchButton"
						class="content-item">로그인하기</button>
				</div>
			</form>
		</div>
		<div class="content-login content-signup">
			<div class="title-sub content-item">아직 회원이 아니신가요?</div>
			<div class="content-item">회원가입을 하고 TastyTrove의 다양한 혜택을 받아보세요!</div>
			<button type="button" onclick="location.href='/signup'"
				id="searchButton" class="content-item">회원가입하기</button>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"></jsp:include>


	<script>
		const inputUserId = document.querySelector("#userId");
		const inputUserPw = document.querySelector("#userPw");

		function isNull() {
			if (inputUserId == null || inputUsePw == null) {
				alert("아이디와 비밀번호를 모두 입력해주세요.");
				location.reload();
			}
		}
	</script>
</body>
</html>