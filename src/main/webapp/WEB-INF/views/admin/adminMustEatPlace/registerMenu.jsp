<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/admin/musteatplace/registerMenu" method="post" modelAttribute="mustEatPlaceMenu">
		<input type="hidden" id="id" name="id" value="${id}">
		
        <label for="menuName">Menu Name:</label>
        <input type="text" id="menuName" name="menuName" required>
        <br>
        <label for="price">Price:</label>
        <input type="number" id="price" name="price" required>
        <br>
        <input type="submit" value="추가하기">
    </form>
</body>
</html>