<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>${product.productName} 상품 후기 목록</h1>
	<hr>
	${product.productContent} <br>
	<button>후기내용수정</button>
	<button onclick="location.href='/admin/product'">상품 목록 보기</button>
</body>
</html>