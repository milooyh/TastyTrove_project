<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	border-collapse: collapse;
	text-align: center;
}

th, td {
	border: 1px solid black;
}
</style>
</head>
<body>
	<h1>회원 목록</h1>
	<hr>
	<table>
		<thead>
			<tr>
				<th>회원번호</th>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>별명</th>
				<th>생년월일</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>이메일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="user" items="${userList}">
				<tr>
					<td>${user.userId}</td>
					<td>${user.userPassword}</td>
					<td>${user.userName}</td>
					<td>${user.userNickname}</td>
					<td>${user.userBirthdate}</td>
					<td>${user.userTel}</td>
					<td>${user.userAddress}</td>
					<td>${user.userEmail}</td>
					<td><button>회원정보수정</button>
					<td><button>회원정보삭제</button>
				</tr>
			</c:forEach>
		</tbody>
	</table> <br>
	<button>회원추가</button>
	<button onclick="href='/admin/findMember.jsp'">회원검색</button>
</body>
</html>