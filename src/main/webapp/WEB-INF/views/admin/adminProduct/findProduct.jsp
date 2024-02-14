<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/adminMustEatPlace.css?after"
	type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
<%@include file="../adminHeader.jsp"%>
	<h1>상품 검색</h1>
	<hr>
	<form>
		<p>검색기준</p>
		<lable><input type="checkbox" name="productId">상품번호</lable>
		<lable><input type="checkbox" name="productName">상품명</lable>
		<lable><input type="checkbox" name="product">가격</lable>
		<lable><input type="checkbox" name="productCount">재고수량</lable>
		<label><input type="text" name="searchKeyword" placeholder="검색어를 입력하세요."></label><br>
		
		<label>카테고리</label> <select name="productType">
        	<option value="UTN">UTN</option>
        	<option value="FOOD">FOOD</option>
      </select>
		
		<button type="submit">검색하기</button>
	</form>
	<hr>
	<table>
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
			<c:forEach var="user" items="${userList}">
				<tr>
					<td>${product.productId}</td>
					<td>${product.productName}</td>
					<td>${product.productPrice}</td>
					<td>${product.productCount}</td>
					<td>${product.productType}</td>
					<td><button>상품정보수정</button>
					<td><button>상품삭제</button>
				</tr>
			</c:forEach>
		</tbody>
	</table><br>
	<button onclick="location.href='/admin/product'">전체상품목록</button>
	
</body>
</html>