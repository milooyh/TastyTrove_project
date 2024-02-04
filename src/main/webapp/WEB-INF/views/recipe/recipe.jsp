<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 목록</title>
</head>
<body>
	<h1>레시피 목록</h1>
	<form action="/recipe" method="post">
		<button type="submit">레시피 등록하기</button>
	</form>
	<div>
		<c:forEach var="recipeItem" items="${recipeList}">
			<div>
				<a href="/recipe/recipeInfo?id=${recipeItem.recipeId}">
				<img src="${recipeItem.recipeFilePath}${recipeItem.recipeFileName}" width="300px" height="300px"> <br>		
				${recipeItem.recipeTitle}</a>
			</div>
		</c:forEach>
	</div>
</body>
</html>