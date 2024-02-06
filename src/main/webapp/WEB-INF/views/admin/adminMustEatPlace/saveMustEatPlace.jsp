	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>맛집 몰래 추가</h1>
	<hr>
	<form action="" method="post">
		<label>맛집명 : </label><input type="text" id="restaurantName" name="restaurantName">
		<button type="button" id="restaurantNameChk_btn" name="restaurantNameChk_btn">확인</button>
		<br> 
		
		<label>장소 : </label><input type="text"
			id="place" name="place">
		<br>
		<button type="submit">맛집등록하기</button>
	</form>
	<br>
    <button onclick="location.href='/admin/member'">뒤로 가기</button>
</body>
</html>
</body>
</html>