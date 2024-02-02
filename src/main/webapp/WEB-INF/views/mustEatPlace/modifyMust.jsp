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
		<label>식당이름</label><input type="text" name="restaurant_name" value="${mustEatPlace.restaurant_name}"><br>
		<label>주소</label><input type="text" name="place" value="${mustEatPlace.place}"><br>
		<label>리뷰</label><input type="text" name="review" value="${mustEatPlace.review}"><br>
		<label>별점(1~5)</label><input type="number" name="asterion" value="${mustEatPlace.asterion}"><br>
		<label>대표메뉴</label><input type="text" name="representative_menu" value="${mustEatPlace.representative_menu}"><br>
		<label>전화번호</label><input type="text" name="telephone_number" value="${mustEatPlace.telephone_number}"><br>
		<c:forEach var="mustEatPlaceMenuItem" items="${mustEatPlaceMenu}">
			<label>메뉴당 가격</label><input type="text" name="menu_name" value="${mustEatPlaceMenuItem.menu_name}">
			<input type="number" name="price" value="${mustEatPlaceMenuItem.price}"><br>
		</c:forEach>
		<button type="submit">수정하기</button>
	</form>
</body>
</html>