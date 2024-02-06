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
	<h1>결제 목록</h1>
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
				<th>결제번호</th>
				<th>전체주문번호</th>
				<th>결제일시</th>
				<th>결제방법</th>
				<th>총계</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="payment" items="${paymentList}">
				<tr>
					
					<td>${payment.paymentId}</td>
					<td><a href="/admin/order/orders?orderId=${payment.orderId}">${payment.orderId}</a></td>
					<td>${payment.paymentDate}</td>
					<td><select name="paymentMethod">
							<option value="C"
								<c:if test="${payment.paymentMethod == 'C'}">selected</c:if>>
								카드</option>
							<option value="W"
								<c:if test="${payment.paymentMethod == 'W'}">selected</c:if>>
								계좌이체</option>
					</select></td>
					<td>${payment.paymentAmount}</td>
					<td><button
							onclick="location.href='/admin/payment/update?paymentId=${payment.paymentId}'">결제정보수정</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	<button onclick="location.href='/admin/payment/search'">결제내역검색</button>
</body>
</html>