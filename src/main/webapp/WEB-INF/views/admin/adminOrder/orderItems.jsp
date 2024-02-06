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
	<h1>${orderItemList[0].memberId}회원의주문 목록</h1>
	<hr>
	<table>
		<thead>
			<tr>
				<th>개별주문번호</th>
				<th>상품번호</th>
				<th>주문개수</th>
				<th>상픔가격</th>
				<th>총계</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="order" items="${orderItemList}">
				<tr>
					<td>${order.orderItemId}</td>
					<td>${order.productId}</td>
					<td>${order.orderItemCount}</td>
					<td>${order.productPrice}</td>
					<td>${order.totalPrice}</td>
					<td><button
							onclick="location.href='/admin/order/orderitem/update?orderItemId=${order.orderItemId}'">주문정보수정</button></td>
					 
				</tr>
			</c:forEach>
		</tbody>
		<br>
		<button onclick="location.href='/admin/order'">전체주문목록</button>
</body>
</html>