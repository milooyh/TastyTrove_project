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
		<div class="content-title">주문 내역 검색</div>
		<hr>
		<div class="content-nav">
			<span>주문관리</span><span> - </span><span><a href="/admin/order">전체주문목록</a></span><span>
				- </span><span><a href="/admin/order/search">주문내역검색</a></span><span>
		</div>

		<table id="searchTable">
			<form>
				<tr>
					<td class="title" colspan="3">검색기준</td>
				</tr>
				<tr>
					<td>선택</td>
					<td><lable> <input type="checkbox" name="orderId">주문번호</lable></td>
					<td><lable> <input type="checkbox" name="memberId">회원번호</lable></td>
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
						step="10000" value="10000" oninput="updateMinPrice(this.value)"> <span id="minPriceValue">10000원</span></td>
					<td><label for="maxPrice">최대 가격:</label> <input type="range"
						id="maxPrice" name="maxPrice" min="10000" max="100000"
						step="10000" value="100000" oninput="updateMaxPrice(this.value)"> <span id="maxPriceValue">100000원</span></td>
					<br>
				</tr>

				<tr>
					<td>주문일시</td>
					<td colspan="3"><input type="date" name="orderDate" id="date"></td>
				</tr>

				<tr>
					<td>주문상태</td>
					<td><select name="orderStatus">
							<option disabled selected>주문상태</option>
							<option value="O">주문완료 / 결제 전</option>
							<option value="P">주문완료 / 결제 완료</option>
							<option value="C">주문취소</option>
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
		</table>
		<br>

		<script>
		document.addEventListener('DOMContentLoaded', function() {
			// 각 체크박스 요소를 가져옴
			var checkboxes = document
					.querySelectorAll('#searchTable input[type="checkbox"]');

			// 각 체크박스에 이벤트 리스너 추가
			checkboxes.forEach(function(checkbox) {
				checkbox.addEventListener('change', function() {
					// 모든 체크박스의 checked 속성을 false로 설정
					checkboxes.forEach(function(cb) {
						cb.checked = false;
					});
					// 현재 체크된 체크박스의 checked 속성을 true로 설정
					this.checked = true;
				});
			});
		});
		
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