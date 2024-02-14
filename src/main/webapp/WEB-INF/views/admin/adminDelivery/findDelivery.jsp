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
		<div class="content-title">배송 내역 목록</div>
		<hr>
		<div class="content-nav">
			<span>배송관리</span><span> - </span><span><a
				href="/admin/delivery">배송내역목록</a></span><span> - </span><span><a
				href="/admin/delivery/search">배송내역검색</a></span><span>
		</div>
		<table id="searchTable">
			<form>
				<tr>
					<td class="title" colspan="3">검색기준</td>
				</tr>

				<tr>
					<td>선택</td>
					<td><lable> <input type="checkbox" name="deliverytId">배송번호</lable></td>
					<td><lable> <input type="checkbox" name="orderId">전체주문번호</lable></td>
				</tr>

				<tr>
					<td>검색어</td>
					<td colspan="3"><input type="text" name="searchKeyword"
						placeholder="검색어를 입력해주세요."> <span id="errorMessage"
						class="error-message">검색어를 입력해주세요.</span></td>
				</tr>

				<tr>
					<td>배송일시</td>
					<td colspan="3"><input type="date" name="deliveryDate"
						id="date"></td>
				</tr>



				<tr>
					<td><lable>주소</lable></td>
					<td><select name="addressSystem">
							<option disabled selected>행정도시</option>
							<option value="서울특별시">서울특별시</option>
							<option value="부산광역시">부산광역시</option>
							<option value="대구광역시">대구광역시</option>
							<option value="인천광역시">인천광역시</option>
							<option value="광주광역시">광주광역시</option>
							<option value="대전광역시">대전광역시</option>
							<option value="울산광역시">울산광역시</option>
							<option value="세종특별자치시">세종특별자치시</option>
							<option value="경기도">경기도</option>
							<option value="강원특별자치도">강원특별자치도</option>
							<option value="충청북도">충청북도</option>
							<option value="충청남도">충청남도</option>
							<option value="전북특별자치도">전북특별자치도</option>
							<option value="전라남도">전라남도</option>
							<option value="경상북도">경상북도</option>
							<option value="경상남도">경상남도</option>
							<option value="제주특별자치도">제주특별자치도</option>
					</select></td>
				</tr>

				<tr>
					<td><label>배송상태</label></td>
					<td><select name="deliveryStatus">
							<option disabled selected>배송상태</option>
							<option value="B">배송 전</option>
							<option value="D">배송 중</option>
							<option value="C">배송 완</option>
					</select></td>
				</tr>

				<tr>
					<td><label>배송비</label></td>
					<td><select name="deliveryFee">
							<option disabled selected>배송비</option>
							<option value="7500">7500</option>
							<option value="4500">4500</option>
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
					<th>배송번호</th>
					<th>전제주문번호</th>
					<th style="width:10%">배송일시</th>
					<th>배송상태</th>
					<th style="width:20%">배송지</th>
					<th>배송비</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="delivery" items="${deliveryList}">
					<tr>
						<td>${delivery.deliveryId}</td>
						<td>${delivery.orderId}</td>
						<td>${delivery.deliveryDate}</td>
						<td><c:choose>
								<c:when test="${delivery.deliveryStatus eq 'B'}">배송 전</c:when>
								<c:when test="${delivery.deliveryStatus eq 'D'}">배송 중</c:when>
								<c:when test="${delivery.deliveryStatus eq 'C'}">배송 완</c:when>
							</c:choose></td>
						<td>${delivery.deliveryAddress}</td>
						<td>${delivery.deliveryFee}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>
		<button onclick="location.href='/admin/delivery'">전체배송목록</button>
		<script>
			// 최소 가격 변경 시 호출되는 함수
			function updateMinPrice(value) {
				document.getElementById("minPriceValue").textContent = value
						+ "원";
			}

			// 최대 가격 변경 시 호출되는 함수
			function updateMaxPrice(value) {
				document.getElementById("maxPriceValue").textContent = value
						+ "원";
			}
		</script>
		a
</body>
</html>