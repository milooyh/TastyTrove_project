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
	<h1>배송 목록</h1>
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
				<th>배송번호</th>
				<th>전체주문번호</th>
				<th>배송일시</th>
				<th>배송상태</th>
				<th>배송주소</th>
				<th>배송비</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="delivery" items="${deliveryList}">
				<tr>
					
					<td>${delivery.deliveryId}</td>
					<td><a href="/admin/order/orders?orderId=${delivery.orderId}">${delivery.orderId}</a></td>
					<td>${delivery.deliveryDate}</td>
					<td><select name="deliveryStatus">
							<option value="B"
								<c:if test="${delivery.deliveryStatus == 'B'}">selected</c:if>>
								배송 전</option>
							<option value="D"
								<c:if test="${delivery.deliveryStatus == 'D'}">selected</c:if>>
								배송 중</option>
							<option value="C"
								<c:if test="${delivery.deliveryStatus == 'C'}">selected</c:if>>
								배송 완</option>
					</select></td>
					<td>${delivery.deliveryAddress}</td>
					<td>${delivery.deliveryFee}</td>
					<td><button
							onclick="location.href='/admin/member/update?memberId=${user.memberId}'">주문정보수정</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	<button onclick="location.href='/admin/delivery/search'">배송검색</button>
</body>
</html>