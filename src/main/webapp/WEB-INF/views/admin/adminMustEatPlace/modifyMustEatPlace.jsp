<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modify Member</title>
</head>
<body>
    <h1>맛집 정보 수정</h1>
    
    <form:form method="post" action="/admin/musteatplace/update">
        <input type="hidden" name="placeId" value="${mustEatPlace.placeId}" />
        
        <label for="restaurantName">맛집명:</label>
        <input type="text" id="restaurantName" name="restaurantName" value="${mustEatPlace.restaurantName}" /><br>
        
        <label for="place">주소:</label>
        <input type="place" id="place" name="place" value="${mustEatPlace.place}" /><br>
        <input type="submit" value="수정" />
    </form:form>
    
    <br>
    <button onclick="location.href='/admin/musteatplace'">뒤로 가기</button>
</body>
</html>
