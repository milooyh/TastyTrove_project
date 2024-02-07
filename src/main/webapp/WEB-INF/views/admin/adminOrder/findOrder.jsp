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
		<div class="content-title">주문 내역 검색</div>
		<hr>
		<div class="content-nav">
			<span>주문관리</span><span> - </span><span><a href="/admin/order">전체주문목록</a></span><span>
				- </span><span><a href="/admin/order/search">주문내역검색</a></span><span>
		</div>
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
			<option value="O">주문완료 / 결제 전</option>
			<option value="P">주문완료 / 결제 완료</option>
			<option value="C">주문취소</option>
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
					<td><c:choose>
							<c:when test="${order.orderStatus eq 'O'}">주문완료 / 결제 전</c:when>
							<c:when test="${order.orderStatus eq 'P'}">주문완료 / 결제 완료</c:when>
							<c:when test="${order.orderStatus eq 'C'}">주문취소</c:when>
					</c:choose></td>
					<td>${order.totalPrice}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table><br>
	<button onclick="location.href='/admin/order'">전체주문목록</button>
	
</body>
</html>