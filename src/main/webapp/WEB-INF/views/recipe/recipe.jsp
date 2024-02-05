<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 목록</title>
</head>
<style>

.recipeList{
	display: flex;
}

.recipe{
	display: flex;
	width: 380px;
	height: 380px;
	margin: 5px;
	align-items: center;
	justify-content: center;
}

.recipe2{
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

.img{
	width: 300px;
	height: 300px;
}
</style>
<body>
<%
	session.setAttribute("memberId", "testUser");
%>

	<h1>레시피 목록</h1>
	
	<form action="/recipe" method="post">
		<button type="submit">레시피 등록하기</button>
	</form>
	<hr>
	
	<form action="" method="get">
		<span>검색</span> <br>
		카테고리 검색
		<button>전체</button>
		<button name = "recipeType" value="KOR">한식</button>
		<button name = "recipeType" value="CHI">중식</button>
		<button name = "recipeType" value="WST">양식</button>
		<button name = "recipeType" value="JPN">일식</button>
		<button name = "recipeType" value="DRT">디저트</button>
		<br>
		<label>키워드 검색 : </label><input type="text" name="searchKeyword"><button>검색</button>
	</form>
	
	<hr>

	<div class="recipeList">
		<c:forEach var="recipeItem" items="${recipeList}">
			<div class="recipe">
				<a href="/recipe/recipeInfo?id=${recipeItem.recipeId}" class="recipe2">
				<img src="${recipeItem.recipeFilePath}${recipeItem.recipeFileName}" class="img"> <br>		
				${recipeItem.recipeTitle} <br> 작성자 : ${recipeItem.memberId} </a>
			</div>
		</c:forEach>
	</div>
</body>
</html>