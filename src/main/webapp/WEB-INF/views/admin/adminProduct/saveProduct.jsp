
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/saveMember.css?after"
	type="text/css" />
</head>
<body>
	<%@include file="../adminHeader.jsp"%>
	<h1>상품 추가</h1>
	<hr>
	<form action="" method="post" enctype="multipart/form-data">
		<label>상품명 : </label><input type="text" id="productName"
			name="productName"> <br> <label>가격 : </label><input
			type="text" id="productPrice" name="productPrice"> <br>
		<label>재고수량 : </label><input type="text" id="productCount"
			name="productCount"><br> <label>이미지 : </label><input
			type="file" id="productImage" name="productImage"> <br>
		<label>카테고리 : </label> <select name="productType">
			<option disabled selected>카테고리</option>
			<option value="UTN">UTN</option>
			<option value="FOOD">FOOd</option>
		</select><br>
		<button type="submit">상품등록하기</button>
	</form>
	<br>
	<button onclick="location.href='/admin/member'">뒤로 가기</button>
</body>
</html>
</body>
</html>