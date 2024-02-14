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
		height: 320px;
		margin: 10px;
		align-items: center;
		justify-content: center;
	}
	
	.recipe:hover{
		background-color: #BDD2E6;
		border-radius: 5px;
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
		width: 240px;
		height: 240px;
		object-fit: cover;
		border-radius: 5px;
		border: 2px solid #6aafe6;
	}
	
	.title {
		margin-bottom: 30px;
		color: #6aafe6;
	}
	
	.post {
		margin-bottom: 20px; display : flex;
		justify-content: end;
		display: flex;
	}
	
	.postBtn {
		width: 200px;
		height: 40px;
		background: #6aafe6;
		border: none;
		border-radius: 30px;
		color: white;
		font-weight: bolder;
		font-size: 15px;
		cursor: pointer;
	}
	
	.postBtn:hover{
		background-color: #6888e0;
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
		border: 1px solid #6aafe6;
	
	}
	
	.recipeListBox2{
		width: 100%;
		display: flex;
		flex-wrap: wrap;
	}
	
	
	.recipeSearchBtn{
		width: 100px;
		height: 40px;
		background-color: #6aafe6;
		border: 0px;
		border-radius: 30px;
		color: white;
		cursor: pointer;
		margin: 2px 0px;
	}
	
	.recipeSearchBtn:hover{
		background-color: #6888e0;
	}
	
	.recipeSearchTh{
		font-weight: bolder;
		margin: 10px 0px;
	}
	
	.searchKeyword{
		width: 522px;
		height: 40px;
		border-radius: 30px;
		border: 1px solid gray;
		padding-left: 20px;
	}
	
	a:hover, a:visited, a:link, a:active
	{
	    text-decoration: none;
	}
	
	.page{
		display: flex;
		justify-content: center;
	}
	
	.pageBtn{
		width: 35px;
		height: 35px;
		background: white;
		border: 2px solid #6aafe6;
		border-radius: 3px;
		font-size: 25px;
		font-weight: bolder;
		display: flex;
		justify-content: center;
		align-items: center;
		margin: 5px;
		color: black;
	}
	
	.pageBtnBox{
		width: 100%;
		display: flex;
		justify-content: center;
	}
	
	.fontSizeL{
		font-size: 30px;
		padding-bottom: 10px;
	}
	
	.black{
		color: black;
	}
	
	.recipeTitle{
		width: 240px;
		height: 25px;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
	}
	
	.userNick{
		width: 240px;
		height: 25px;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
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
				<form action="/recipe" method="post" id="postRecipeFrom">
					<button type="button" class="postBtn" onclick="isLogin()">레시피 등록하기</button>
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
								class="img"> <br> <div class="recipeTitle"> ${recipeItem.recipeTitle} </div>
								<div class="userNick">${recipeItem.userNickname}</div>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
			
			<!-- 페이지-->
			<div class="page">
				<div class="pageBtnBox">
					<div class="pageBtn fontSizeL"><a href="recipe?curPage=1" class="black"> &laquo; </a></div>
					<c:forEach begin="${recipeSearchCondition.firstPage }"  end="${recipeSearchCondition.lastPage }" var="i">
					  	<a href="recipe?curPage=${i }"  >  
					  		<c:if test="${i eq recipeSearchCondition.curPage }">  <div class="pageBtn"><span style="color: #6aafe6">  ${i } </span></div> </c:if>
					  		<c:if test="${i ne recipeSearchCondition.curPage }">  <div class="pageBtn">${i }</div> </c:if>
					  	</a>
					</c:forEach>
					<div class="pageBtn fontSizeL"><a href="recipe?curPage=${recipeSearchCondition.totalPageCount }" class="black">&raquo;</a></div>
				</div>
			</div>
			
		</div>
	</div>
	
	<script>
		function isLogin(){
			
			var sessionId = '<%=(String)session.getAttribute("userId")%>';
			if(sessionId == "null"){
				alert('로그인 후 이용 가능한 서비스입니다.');
				location.href = "/login";
			}else{
				postRecipeFrom.submit();
			}
			
		}
	</script>
</body>
</html>