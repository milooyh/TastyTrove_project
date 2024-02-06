<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>${place.restaurantName} 가게의 엄청난 후기들</h1>
	<hr>
	${place.review}
	<br>
	<button>리뷰내용수정</button>
	<button onclick="location.href='/admin/musteatplace'">맛집 목록 보기</button>
</body>
</html>