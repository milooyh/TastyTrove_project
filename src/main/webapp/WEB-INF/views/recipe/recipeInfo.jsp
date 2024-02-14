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
		background-color: #F0F0F0;
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
		border: 2px solid #6aafe6;
	}
	
	.imgBox {
		width: 350px;
		height: 350px;
	}
	
	
	.recipeInfoBox{
		width: 1200px;
		background-color: white;
		border-radius: 10px;
 		margin: 30px;
		padding: 30px;
		background-color: white;
		border: 1px solid #6aafe6;
	
	}
	
	.Btn {
		width: 200px;
		height: 40px;
		background: #6aafe6;
		border: none;
		border-radius: 30px;
		color: white;
		font-weight: bolder;
		font-size: 15px;
		cursor: pointer;
		margin-top: 15px;
		box-shadow: 0 2px 4px rgba(0,0,0,0.1);
	}
	
	.Btn:hover{
		background-color: #0056b3;
	}
	
	.Btn2:hover{
		background-color: #0056b3;
	}
	
	.Btn2 {
		width: 100px;
		height: 40px;
		background: #6aafe6;
		border: none;
		border-radius: 30px;
		color: white;
		font-weight: bolder;
		font-size: 15px;
		cursor: pointer;
		margin-top: 15px;
		box-shadow: 0 2px 4px rgba(0,0,0,0.1);
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
	
	.recipeTitle{
 		width: 750px; 
 		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
	}
	
	.recipeInfo2{
		width: 750px;
	}
	
	hr{
		background: #6aafe6;
		height:1px;
  	  	border:0;
  	  	margin-bottom: 50px;
	}
	
</style>

</head>
<body>
	<%@include file="../main/header.jsp" %>
	<div class="container">
		<div class="recipeInfoBox">
		
			<div class="btnBox">
				<button type="button" onclick="back()" class="Btn">돌아가기</button> 
				<div class="sessionUserBox">
					<c:if test="${memberId == sessionId}">
					
						<button onclick="modifyProc()" class="Btn2">수정</button>
					
						<button onclick="removeProc()" id="removeRecipeBtn" class="Btn2">삭제</button>
						
					</c:if>
				</div>
			</div>
			
			<hr>
			
			<div class="recipeHeader">
					<div class="imgBox"> <img src="${fullRecipeFilePath}" class="img"> </div>
					<div class="recipeInfo">
					<div class="recipeTitle"> <h1 class="recipeTitle"> ${recipeTitle} </h1></div>
					<div class="recipeInfo2">
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
									<c:when test="${recipeType == 'ETC'}"> <td>기타</td> </c:when>
								</c:choose>	
							</tr>
	
						</table>
					</div>
				</div>
			</div>
			<div class="recipeContent"> ${recipeContent} </div>
		</div>
	</div>
	<%@include file="../main/footer.jsp" %>
	
	<script>
		
		var sessionId = '<%=(String)session.getAttribute("userId")%>';
			
		function modifyProc(){
			
			if(sessionId == "null"){
				alert('로그인 후 이용가능한 서비스입니다.');
				location.href = "/login"
			}else{
				location.href='/recipe/modifyRecipe?id=${recipeId}'
			}
		}
		
		function removeProc(){
			
			if(sessionId == "null"){
				alert('로그인 후 이용가능한 서비스입니다.');
				location.href = "/login"
			}else{
				location.href='/recipe/removeRecipe?id=${recipeId}'
			}
		}
		
		function back(){
			history.back();
		}
		
	</script>
</body>
</html>