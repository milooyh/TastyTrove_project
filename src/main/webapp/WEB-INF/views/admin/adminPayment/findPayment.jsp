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
		<div class="content-title">결제 내역 목록</div>
		<hr>
		<div class="content-nav">
			<span>결제관리</span><span> - </span><span><a
				href="/admin/payment">결제내역목록</a></span><span> - </span><span><a
				href="/admin/payment/search">결제내역검색</a></span><span>
		</div>
		
	<form>
		<p>검색기준</p>
		<lable><input type="checkbox" name="paymentId">결제번호</lable>
		<lable><input type="checkbox" name="orderId">전체주문번호</lable>
		<lable><input type="text" name="searchKeyword" placeholder="검색어를 입력하세요."></lable><br>
		<lable>결제일시</lable><input type="date" name="paymentDate">
		<lable>결제방법</lable>
		<select name="paymentMethod">
			<option disabled selected>결제방법</option>
			<option value="C">카드</option>
			<option value="W">계좌이체</option>
		</select>
		<button type="submit">검색하기</button>
	</form>
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
					<td>${payment.orderId}</td>
					<td>${payment.paymentDate}</td>
						<td><c:choose>
							<c:when test="${payment.paymentMethod eq 'C'}">카드</c:when>
							<c:when test="${payment.paymentMethod eq 'W'}">계좌이체</c:when>
						</c:choose></td>
					<td>${payment.paymentAmount}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table><br>
	<button onclick="location.href='/admin/payment'">전체결제목룍</button>
	
</body>
</html>