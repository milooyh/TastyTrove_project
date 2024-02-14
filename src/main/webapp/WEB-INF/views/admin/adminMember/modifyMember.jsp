<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modify Member</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/saveMember.css?after"
	type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
	<%@include file="../adminHeader.jsp"%>
	<div class="content">
		<div class="content-title">회원 정보 수정</div>
		<hr>
		<div class="content-nav">
			<span>회원관리</span><span> - </span><span><a href="/admin/member">회원목록</a></span><span>
				- </span><span><a href="/admin/member/search">회원검색</a></span><span>
				- </span><span><a href="/admin/member/add">관리자추가</a></span>
		</div>
		<hr>

		<form:form modelAttribute="user" method="post"
			action="/admin/member/update">
			<input type="hidden" name="memberId" value="${user.memberId}" />
			<div class="form-item">
				<label for="userId">아이디:</label> <input type="text" id="userId"
					name="userId" value="${user.userId}" /><br>
			</div>

			<div class="form-item">
				<label for="userPassword">비밀번호:</label> <input type="password"
					id="userPassword" name="userPassword" value="${user.userPassword}" /><br>
			</div>

			<div class="form-item">
				<label for="userName">이름:</label> <input type="text" id="userName"
					name="userName" value="${user.userName}" /><br>
			</div>

			<div class="form-item">
				<label for="userNickname">별명:</label> <input type="text"
					id="userNickname" name="userNickname" value="${user.userNickname}" /><br>
			</div>

			<div class="form-item">
				<label for="userBirthdate">생년월일:</label> <input type="text"
					id="userBirthdate" name="userBirthdate"
					value="${user.userBirthdate}" /><br>
			</div>

			<div class="form-item">
				<label for="userAddress">주소:</label> <input type="text"
					id="userAddress" name="userAddress" value="${user.userAddress}" /><br>
			</div>

			<div class="form-item">
				<label for="userEmail">이메일:</label> <input type="text"
					id="userEmail" name="userEmail" value="${user.userEmail}" /><br>
			</div>

			<div class="form-item">
				<button onclick="location.href='/admin/member'">회원 목록</button>
				<button type="submit" onclick="confirmModify(${memberId})">수정하기</button>
			</div>
		</form:form>

		<br>
		<script>
			function confirmModify(memberId) {
				var result = confirm("회원 정보를 수정할까요?");
				if (result) {
					location.href = '/admin/member/update?memberId=' + memberId;
				}
				return result;
			}
		</script>
</body>
</html>
