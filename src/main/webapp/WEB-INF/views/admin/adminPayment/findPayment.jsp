<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/findMember.css?after"
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
		<table id="searchTable">
			<form>
				<tr>
					<td class="title" colspan="3">검색기준</td>
				</tr>

				<tr>
					<td>선택</td>
					<td><lable> <input type="checkbox" name="paymentId">결제번호</lable></td>
					<td><lable> <input type="checkbox" name="orderId">전체주문번호</lable></td>
				</tr>

				<tr>
					<td>검색어</td>
					<td colspan="3"><input type="text" name="searchKeyword"
						placeholder="검색어를 입력해주세요."> <span id="errorMessage"
						class="error-message">검색어를 입력해주세요.</span></td>
				</tr>

				<tr>
					<td>가격</td>
					<td><label for="minPrice">최소 가격:</label> <input type="range"
						id="minPrice" name="minPrice" min="10000" max="100000"
						step="10000" value="10000" oninput="updateMinPrice(this.value)"> 
						
						<span id="minPriceValue">10000원</span></td>
					<td><label for="maxPrice">최대 가격:</label> <input type="range"
						id="maxPrice" name="maxPrice" min="10000" max="100000"
						step="10000" value="100000" oninput="updateMaxPrice(this.value)"> 
						
						<span id="maxPriceValue">100000원</span></td>
					<br>
				</tr>

				<tr>
					<td>결제일시</td>
					<td colspan="3"><input type="date" name="paymentDate"
						id="date"></td>
				</tr>

				<tr>
					<td><lable>결제방법</lable></td>
					<td><select name="paymentMethod">
							<option disabled selected>결제방법</option>
							<option value="C">카드</option>
							<option value="W">계좌이체</option>
					</select></td>
				</tr>

				<tr>
					<td colspan="3"
						style="background-color: transparent; text-align: center;">
						<button type="button" id="searchButton" onclick="history.back()">취소</button>
						<button type="submit" id="searchButton">검색하기</button>
					</td>
				</tr>
			</form>
		</table>
		<hr>
		<table id="memberTable">
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
		</table>
		<br>

		<script>
    // 최소 가격 변경 시 호출되는 함수
    function updateMinPrice(value) {
        document.getElementById("minPriceValue").textContent = value + "원";
    }

    // 최대 가격 변경 시 호출되는 함수
    function updateMaxPrice(value) {
        document.getElementById("maxPriceValue").textContent = value + "원";
    }
    
    
</script>
</body>
</html>