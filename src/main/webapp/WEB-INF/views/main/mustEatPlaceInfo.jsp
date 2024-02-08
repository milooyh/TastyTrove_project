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
	<div class="container">
		<input type="hidden" name="id" value="${mainMustEatPlaceById.id}">
		<p>식당이름:${mainMustEatPlaceById.restaurantName}</p>
		<p>주소:${mainMustEatPlaceById.place}</p>
		<p>전화번호:${mainMustEatPlaceById.telephoneNumber}</p>
		<p>${mainMustEatPlaceById.openingHours}</p>
		<p>${mainMustEatPlaceById.closingHours}</p>
		<p>${mainMustEatPlaceById.businessStatus}</p>
		<p>${mainMustEatPlaceById.type}</p>
	</div>
</body>
</html>