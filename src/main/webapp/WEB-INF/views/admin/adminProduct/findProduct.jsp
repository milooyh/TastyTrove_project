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
		<div class="content-title">상품 검색</div>
		<hr>
		<div class="content-nav">
			<span>상품관리</span><span> - </span><span><a
				href="/admin/product">상품목록</a></span><span> - </span><span><a
				href="/admin/product/search">상품검색</a></span><span> - </span><span><a
				href="/product">상품수정및삭제</a></span>
		</div>

		<table id="searchTable">
			<form>
				<tr>
					<td colspan="4">검색기준</td>
				</tr>

				<tr>
					<td>선택</td>
					<td><lable> <input type="checkbox" name="productId">상품번호</lable></td>
					<td><lable> <input type="checkbox" name="productName">상품명</lable></td>
					<td><lable> <input type="checkbox" name="productCount">재고수량</lable></td>
				</tr>
				<tr>
					<td><label>검색어</label></td>
					<td colspan="8"><input type="text" name="searchKeyword"
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
					<td><label>카테고리</label>
					<td>
					<td colspan="8"><select name="viewType">
							<option value="OCN">밀키트</option>
							<option value="CTY">제품</option>
							<option value="MOT">재료</option>
					</select></td>
				</tr>

				<tr>
					<td colspan="5"
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
					<th>상품번호</th>
					<th>상품명</th>
					<th>가격</th>
					<th>재고수량</th>
					<th>카테고리</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="product" items="${productList}">
					<tr>
						<td>${product.productId}</td>
						<td>${product.productName}</td>
						<td>${product.productPrice}</td>
						<td>${product.productCount}</td>
						<<td><c:choose>
								<c:when test="${product.viewType eq 'OCN'}">밀키트</c:when>
								<c:when test="${product.viewType eq 'CTY'}">제품</c:when>
								<c:when test="${product.viewType eq 'MOT'}">재료</c:when>
							</c:choose></td>
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
	</script>
</body>
</html>