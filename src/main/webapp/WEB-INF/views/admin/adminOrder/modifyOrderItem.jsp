<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/saveMember.css?after"
	type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
	<%@include file="../adminHeader.jsp"%>

	<div class="content">
		<div class="content-title">주문 개수 수정</div>
		<hr>
		<div class="content-nav">
			<span>주문관리</span><span> - </span><span><a href="/admin/order">전체주문목록</a></span><span>
				- </span><span><a href="/admin/order/search">주문내역검색</a></span><span>
		</div>

		<form method="post" action="/admin/order/orderitem/update">
			<div class="form-item">
				<input type="hidden" name="orderItemId"
					value="${orderItem.orderItemId}" /> <input type="hidden"
					name="orderId" value="${orderItem.orderId}" /> <label
					for="orderItemCount">주문개수:</label> <input type="text"
					id="orderItemCount" name="orderItemCount"
					value="${orderItem.orderItemCount}" />
			</div>
			<div class="form-item">
				<button
					onclick="location.href='/admin/order/orderitem?memberId=${orderItem.memberId}'">뒤로
					가기</button>
				<button type="submit">수정하기</button>
			</div>
		</form>

		<br>
</body>
</html>
