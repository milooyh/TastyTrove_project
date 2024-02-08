<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/adminMember.css?after"
	type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
	<%@include file="../adminHeader.jsp"%>

	<div class="content">
		<div class="content-title">${orderItemList[0].memberId}회원의주문목록</div>
		<hr>
		<div class="content-nav">
			<span>주문관리</span><span> - </span><span><a href="/admin/order">전체주문목록</a></span><span>
				- </span><span><a href="/admin/order/search">주문내역검색</a></span><span>
		</div>

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
								onclick="location.href='/admin/order/orderitem/update?orderItemId=${order.orderItemId}'">주문개수수정</button></td>

					</tr>
				</c:forEach>
			</tbody>
			<br>
			<button onclick="location.href='/admin/order'">전체주문목록</button>
		</table>
	</div>
</body>
</html>