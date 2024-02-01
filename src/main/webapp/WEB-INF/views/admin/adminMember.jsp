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
	<a href="/admin/recipeboard">레시피게시판관리</a>
	<br>
	<a href="/admin/musteatplace">맛집관리</a>
	<br>
	<a href="/admin/product">상품관리</a>
	<br>
	<a href="/admin/order">주문관리</a>
	<br>
	<a href="/admin/payment">결제관리</a>
	<br>
	<a href="/admin/delivery">배송관리</a>
	<br>
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
				<th>유형</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="user" items="${userList}">
				<tr>
					<td>${user.memberId}</td>
					<td>${user.userId}</td>
					<td>${user.userPassword}</td>
					<td>${user.userName}</td>
					<td>${user.userNickname}</td>
					<td>${user.userBirthdate}</td>
					<td>${user.userTel}</td>
					<td>${user.userAddress}</td>
					<td>${user.userEmail}</td>
					<td>${user.userType}</td>
					<td><button
							onclick="location.href='/admin/member/update?memberId=${user.memberId}'">회원정보수정</button></td>
					<td><button
							onclick="confirmDelete(${user.memberId})">회원정보삭제</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	<button onclick="location.href='/admin/member/add'">회원추가</button>
	<button onclick="location.href='/admin/member/search'">회원검색</button>

	<script>
		function confirmDelete(memberId) {
			var result = confirm("정말 삭제하시겠습니까?");

			if (result) {
				location.href = '/admin/member/remove=' + memberId;
			}
		}
	</script>
</body>
</html>