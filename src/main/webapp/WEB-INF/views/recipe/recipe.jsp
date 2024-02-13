<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 목록</title>
</head>
<style>
	* {
		margin: 0px;
		padding: 0px;
		box-sizing: border-box;
	}
	
	html, body {
		height: 100%;
		background-color: #F2F2F2;
	}
	
	.container {

		display: flex;
		justify-content: center;
	}
	
	.recipeList {
		display: flex;
		margin-top: 30px;
		margin-bottom: 30px;
		justify-content: center;
	}
	
	.recipe {
		display: flex;
		width: 264px;
		height: 270px;
		margin: 10px;
		align-items: center;
		justify-content: center;
	}
	
	.recipe2 {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		color: #151B1B;
		font-weight: bolder;
		align-items: flex-start;
	}
	
	.img {
		width: 200px;
		height: 200px;
		object-fit: cover;
		border-radius: 5px;
		border: 1px solid gray;
	}
	
	.title {
		margin-bottom: 30px;
	}
	
	.post {
		margin-bottom: 20px; display : flex;
		justify-content: end;
		display: flex;
	}
	
	.postBtn {
		width: 200px;
		height: 40px;
		background: #151B1B;
		border: none;
		border-radius: 30px;
		color: white;
		font-weight: bolder;
		font-size: 15px;
		cursor: pointer;
	}
	
	.searchRecipe {
		margin: 20px 0px;
	}
	
	.recipeListBox{
		width: 1200px;
		margin: 30px;
		padding: 30px;
		background-color: white;
		border-radius: 10px;
		border: 1px solid gray;
	
	}
	
	.recipeListBox2{
		width: 100%;
		display: flex;
		flex-wrap: wrap;
	}
	
	
	.recipeSearchBtn{
		width: 100px;
		height: 30px;
		background-color: #151B1B;
		border: 0px;
		border-radius: 30px;
		color: white;
		cursor: pointer;
		margin: 2px 0px;
	}
	
	.recipeSearchTh{
		font-weight: bolder;
		margin: 10px 0px;
	}
	
	.searchKeyword{
		width: 522px;
		height: 30px;
		border-radius: 30px;
		border: 1px solid gray;
		padding-left: 10px;
	}
	
	a:hover, a:visited, a:link, a:active
	{
	    text-decoration: none;
	}


</style>


<body>
	<%
	session.getAttribute("userId");
	%>
	<div class="container">
		<div class="recipeListBox">
			<h1 class="title">TasttyTrove Recipe</h1>

			<div class="post">
				<form action="/recipe" method="post">
					<button type="submit" class="postBtn">레시피 등록하기</button>
				</form>
			</div>

			<hr>

			<div class="searchRecipe">
				
				<form action="" method="get">
					<div class="recipeSearchTh"> 카테고리 검색</div>
					<button class="recipeSearchBtn">전체</button>
					<button name="recipeType" value="KOR" class="recipeSearchBtn">한식</button>
					<button name="recipeType" value="CHI" class="recipeSearchBtn">중식</button>
					<button name="recipeType" value="WST" class="recipeSearchBtn">양식</button>
					<button name="recipeType" value="JPN" class="recipeSearchBtn">일식</button>
					<button name="recipeType" value="DRT" class="recipeSearchBtn">디저트</button>
					<br> 
					<div class="recipeSearchTh"> 키워드 검색</div><input type="text"
						name="searchKeyword" class="searchKeyword">
					<button class="recipeSearchBtn">검색</button>
				</form>
			</div>

			<hr>

			<div class="recipeList">
				<div class="recipeListBox2">
					<c:forEach var="recipeItem" items="${recipeList}">
						<div class="recipe">
							<a href="/recipe/recipeInfo?id=${recipeItem.recipeId}"
								class="recipe2"> <img
								src="${recipeItem.recipeFilePath}${recipeItem.recipeFileName}"
								class="img"> <br> ${recipeItem.recipeTitle} <br>
								${recipeItem.userNickname}
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
</html>