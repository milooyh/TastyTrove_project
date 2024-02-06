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
	<h1>주문 검색</h1>
	<hr>
	<form>
		<p>검색기준</p>
		<lable><input type="checkbox" name="orderId">주문번호</lable>
		<lable><input type="checkbox" name="memberId">회원번호</lable>
		<lable><input type="checkbox" name="totalPrice">총계</lable>
		<lable><input type="text" name="searchKeyword" placeholder="검색어를 입력하세요."></lable><br>
		<lable>주문일시</lable><input type="date" name="orderDate">
		<lable>주문상태</lable>
		<select name="orderStatus">
			<option disabled selected>주문상태</option>
			<option value="O">O</option>
			<option value="P">P</option>
			<option value="C">C</option>
		</select>
		<button type="submit">검색하기</button>
	</form>
	<hr>
	<table>
		<thead>
			<tr>
				<th>주문번호</th>
				<th>회원번호</th>
				<th>주문일시</th>
				<th>주문상태</th>
				<th>총계</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="order" items="${orderList}">
				<tr>
					<td>${order.orderId}</td>
					<td>${order.memberId}</td>
					<td>${order.orderDate}</td>
					<td>${order.orderStatus}</td>
					<td>${order.totalPrice}</td>
					<td><button>주문정보수정</button>
					<td><button>주문정보삭제</button>
				</tr>
			</c:forEach>
		</tbody>
	</table><br>
	<button onclick="location.href='/admin/order'">전체주문목록</button>
	
</body>
</html>