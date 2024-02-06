<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>맛집 수정 페이지</h1>
	
	<form action="/must/modify" method="post">
		<input type="hidden" name="id" value="${mustEatPlace.id}">
		<label>식당이름</label><input type="text" name="restaurantName" value="${mustEatPlace.restaurantName}"><br>
		<label>주소</label><input type="text" name="place" value="${mustEatPlace.place}"><br>
		<label>리뷰</label><input type="text" name="review" value="${mustEatPlace.review}"><br>
		<label>별점(1~5)</label><input type="number" name="asterion" value="${mustEatPlace.asterion}"><br>
		<label>대표메뉴</label><input type="text" name="representativeMenu" value="${mustEatPlace.representativeMenu}"><br>
		<label>전화번호</label><input type="text" name="telephoneNumber" value="${mustEatPlace.telephoneNumber}"><br>
		<button type="submit">수정하기</button>
	</form>
</body>
</html>