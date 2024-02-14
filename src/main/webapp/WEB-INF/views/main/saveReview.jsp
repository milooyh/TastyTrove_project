<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="" method="post">
		<input type="hidden" name="id" value="${id}">
		리뷰를 작성하세요<input type="text" name="review">
		별점(1~5)<input type="number" name="rating">
		<input type="hidden" name="userId" value="${userId}">
		<button type="submit">리뷰 추가하기</button>
	</form>
</body>
</html>