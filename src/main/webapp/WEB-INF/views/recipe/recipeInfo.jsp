<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 정보</title>

</head>
<body>
	<button type="button" onclick="back()">돌아가기</button> <br><br>
	<img src="${fullRecipeFilePath}" width="300px" height="300px">
	<div> <h1> ${recipeTitle} </h1></div>
	<div> 작성자 : ${memberId}</div>
	<div> 작성일자 : ${boardDate}</div>
	<div> 카테고리 : ${recipeType}</div>
	<div> ${recipeContent}</div>
	
	<script>
		function back(){
			history.back();
		}
	</script>
</body>
</html>