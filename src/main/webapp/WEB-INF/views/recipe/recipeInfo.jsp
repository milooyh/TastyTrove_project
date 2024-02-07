<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 정보</title>

</head>
<body>
	<button type="button" onclick="back()">돌아가기</button> 
	<c:if test="${memberId == sessionId}">
	
		<button onclick="location.href='/recipe/modifyRecipe?id=${recipeId}'">수정</button>
	
		<button onclick="location.href='/recipe/removeRecipe?id=${recipeId}'" id="removeRecipeBtn">삭제</button>
		
	</c:if>
	<br><br>
	<img src="${fullRecipeFilePath}" width="300px" height="300px">
	<div> <h1> ${recipeTitle} </h1></div>
	<div> 작성자 : ${memberId}</div>
	<div> 작성일자 : ${boardDate}</div>
	<div> 카테고리 : 
	<c:choose>
		<c:when test="${recipeType == 'KOR'}">한식</c:when>
		<c:when test="${recipeType == 'CHI'}">중식</c:when>
		<c:when test="${recipeType == 'JPN'}">일식</c:when>
		<c:when test="${recipeType == 'WST'}">양식</c:when>
		<c:when test="${recipeType == 'DRT'}">디저트</c:when>
	</c:choose>	
	</div>
	<div> ${recipeContent}</div>
	
	<script>
		function back(){
			history.back();
		}
	</script>
</body>
</html>