<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 정보</title>
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
		width: 100%;
	}


	.img {
		width: 350px;
		height: 350px;
		object-fit: cover;
		border-radius: 5px;
		border: 1px solid gray;
	}
	
	.imgBox {
		width: 350px;
		height: 350px;
	}
	
	
	.recipeInfoBox{
		width: 1200px;
		padding: 30px;
		background-color: white;
		border-radius: 10px;
		border: 1px solid gray;
		margin: 30px;
	
	}
	
	.Btn {
		width: 200px;
		height: 40px;
		background: #151B1B;
		border: none;
		border-radius: 30px;
		color: white;
		font-weight: bolder;
		font-size: 15px;
		cursor: pointer;
		margin-top: 15px;
	}
	
	.Btn2 {
		width: 100px;
		height: 40px;
		background: #151B1B;
		border: none;
		border-radius: 30px;
		color: white;
		font-weight: bolder;
		font-size: 15px;
		cursor: pointer;
		margin-top: 15px;
	}
	
	.btnBox{
		width: 100%;
		height: 80px;
		display: flex;
		justify-content: space-between;
	}
	
	.recipeHeader{
		width: 100%;
		display: flex;
		height: 370px;
	}
	
	.recipeInfo{
		width: 100%;
		padding-left: 30px;
	}
	
	table{
		width: 100%;
		height: 200px;
		border: 1px solid gray;
		border-collapse: collapse;
		text-align: center;
	}
	
	th, td{
		border: 1px solid gray;		
	}
	
	.recipeTitle{
		height: 150px;
	}
	
	.recipeContent{
		width: 100%;

	}
	
</style>

</head>
<body>

	<div class="container">
		<div class="recipeInfoBox">
		
			<div class="btnBox">
				<button type="button" onclick="back()" class="Btn">돌아가기</button> 
				<div class="sessionUserBox">
					<c:if test="${memberId == sessionId}">
					
						<button onclick="location.href='/recipe/modifyRecipe?id=${recipeId}'" class="Btn2">수정</button>
					
						<button onclick="location.href='/recipe/removeRecipe?id=${recipeId}'" id="removeRecipeBtn" class="Btn2">삭제</button>
						
					</c:if>
				</div>
			</div>
			<div class="recipeHeader">
					<div class="imgBox"> <img src="${fullRecipeFilePath}" class="img"> </div>
					<div class="recipeInfo">
					<div class="recipeTitle"> <h1> ${recipeTitle} </h1></div>
					<table>
						
						<tr>
							<th>작성자</th>
							<td>${userNickname}</td>
						</tr>

						<tr>
							<th>작성일자</th>
							<td>${boardDate}</td>
						</tr>
						
						<tr>
							<th>작성일자</th>
							<c:choose>
								<c:when test="${recipeType == 'KOR'}"> <td>한식</td> </c:when>
								<c:when test="${recipeType == 'CHI'}"> <td>중식</td> </c:when>
								<c:when test="${recipeType == 'JPN'}"> <td>일식</td> </c:when>
								<c:when test="${recipeType == 'WST'}"> <td>양식</td> </c:when>
								<c:when test="${recipeType == 'DRT'}"> <td>디저트</td> </c:when>
							</c:choose>	
						</tr>

					</table>
<%-- 					<div> 작성자 : ${userNickname}</div> --%>
<%-- 					<div> 작성일자 : ${boardDate}</div> --%>
<!-- 					<div> 카테고리 :  -->
<%-- 						<c:choose> --%>
<%-- 							<c:when test="${recipeType == 'KOR'}">한식</c:when> --%>
<%-- 							<c:when test="${recipeType == 'CHI'}">중식</c:when> --%>
<%-- 							<c:when test="${recipeType == 'JPN'}">일식</c:when> --%>
<%-- 							<c:when test="${recipeType == 'WST'}">양식</c:when> --%>
<%-- 							<c:when test="${recipeType == 'DRT'}">디저트</c:when> --%>
<%-- 						</c:choose>	 --%>
<!-- 					</div> -->
				</div>
			</div>
			<div class="recipeContent"> ${recipeContent} </div>
		</div>
	</div>
	
	<script>
		function back(){
			history.back();
		}
	</script>
</body>
</html>