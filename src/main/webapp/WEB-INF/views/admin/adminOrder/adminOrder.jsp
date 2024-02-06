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
	<h1>주문 목록</h1>
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
				<th>전체주문번호</th>
				<th>회원번호</th>
				<th>주문일시</th>
				<th>주문상태</th>
				<th>총계</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="order" items="${orderList}">
				<tr>
					
					<td><a href="/admin/order/orders?orderId=${order.orderId}">${order.orderId}</a></td>
					<td><a href="/admin/order/orderitem?memberId=${order.memberId}">${order.memberId}</a></td>
					<td>${order.orderDate}</td>
					<td><select name="orderStatus">
							<option value="O"
								<c:if test="${order.orderStatus == 'O'}">selected</c:if>>
								주문완료 / 결제 전</option>
							<option value="P"
								<c:if test="${order.orderStatus == 'P'}">selected</c:if>>
								주문완료 / 결제 완료</option>
							<option value="C"
								<c:if test="${order.orderStatus == 'C'}">selected</c:if>>
								주문취소</option>
					</select></td>
					<td>${order.totalPrice}</td>
					<td><button
							onclick="location.href='/admin/member/update?memberId=${user.memberId}'">주문정보수정</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	<button onclick="location.href='/admin/order/search'">주문검색</button>
</body>
</html>