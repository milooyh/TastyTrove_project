<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous"> -->
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css"> -->
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	padding: 0px;
	box-sizing: border-box;
	margin: 0px;
}

body {
 	background-color: #F0F0F0;
}


.mustEatPlace-info-korean {
	display: inline-block;
}

.body {
	padding: 30px;
}

.listBox {
	width: 1200px;
	height: 330px;
	background-color: white;
	margin-bottom: 50px;
	display: flex;
	flex-direction: column;
	border-radius: 10px;
	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
	border: none;
	font-weight: 500;
	transition: 0.25s;
	text-decoration: none;
}

.listBoxHeader {
	height: 60px;
	display: flex;
	justify-content: space-between;
	padding: 10px 15px;
	background-color: #6aafe6;
	font-weight: bolder;
	color: white;
	border-radius: 10px;
}

.fontWhite {
	color: white;
	font-size: 1.2rem;
}

.listImg {
	width: 180px;
	height: 180px;
	border: 1px solid #6aafe6;
	background-color: white;
	border-radius: 3px;
	margin-bottom: 5px;
}

.listInfo {
	width: 199px;
	height: 250px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	padding: 10px;
}

.listText {
	height: 30px;
	display: flex;
	align-items: center;
	padding-top: 10px;
}

.listInfoBox {
	display: flex;
	justify-content: space-between;
}

.recipeLink {
	color: black;
	font-weight: bolder;
	text-align: center;
}

.recipeTitle {
	width: 180px;
	overflow: hidden;
	object-fit: cover;
	text-overflow: ellipsis;
	white-space: nowrap;
	font-size: 16px;
	color: #55555;
}

.fontCB{
	color: white;
}

.fontCB:hover {
	color: white;
}

</style>

</head>
<body>

	
    <%@include file="../main/header.jsp" %>
    <div class="body">
		<div class="recipe listBox">
			<div class="listBoxHeader">
				<div class="fontWhite">TasttyTrove Recipe</div>
				<a href="/recipe" class="fontCB">더보기</a>
			</div>

			<div class="listInfoBox">
				<c:forEach var="recipeItem" items="${recipeList}" begin="0" end="5">
					<div class="listInfo">
						<a href="/recipe/recipeInfo?id=${recipeItem.recipeId}" class="recipeLink"> <img
							src="${recipeItem.recipeFilePath}${recipeItem.recipeFileName}"
							class="listImg"> <br> <div class="recipeTitle"> ${recipeItem.recipeTitle} </div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>

		<div class="product listBox">
			<div class="listBoxHeader">
				<div class="fontWhite">TasttyTrove Product</div>
				<a href="/product" class="fontCB">더보기</a>
			</div>
			
			<div class="listInfoBox">
<%-- 				<c:forEach var="" items="" begin="0" end="5"> --%>
					<div class="listInfo">
						<a href="" class="recipeLink"> 
						<img
							src=""
							class="listImg"> 
							<br>텍스트 넣을 곳
						</a>
					</div>
<%-- 				</c:forEach> --%>
			</div>
		</div>

		<div class="mustEatPlace listBox">
			<div class="listBoxHeader">
				<div class="fontWhite">한식</div>
				<a class="fontCB">더보기</a>
			</div>

			<div class="listInfoBox" style="height:100%;">
				<div class="mustEatPlace-gallery" style="overflow-x: auto; white-space: nowrap; width:100%; height:100%;">
				    <c:forEach var="mustEatPlaceItem" items="${mainMustEatPlace}">
				    <c:if test="${mustEatPlaceItem.type.equals('한식')}">
						<div class="mustEatPlace-info-korean" style="margin-left:5%;">
							
							<p class="restaurant-name" onclick="moveToLocation('${mustEatPlaceItem.place}')" style="font-weight:bold; font-size:1.2rem; cursor:pointer; margin-top:10px; margin-bottom:10px;">${mustEatPlaceItem.restaurantName}</p>
				            <c:if test="${mustEatPlaceItem.representativeMenuImage == null}">
				            	<img src="<c:url value="/image/noPhoto.PNG"/>" onclick="location.href='/main/mustEatPlaceInfo?id=${mustEatPlaceItem.id}'" style="width:200px; height:200px; cursor:pointer; object-fit:cover;"><br>
				            </c:if>
				            <c:if test="${mustEatPlaceItem.representativeMenuImage != null}">
				            	<img src="data:image/jpg;base64,${mustEatPlaceItem.representativeMenuImage}" onclick="location.href='/main/mustEatPlaceInfo?id=${mustEatPlaceItem.id}'" style="width:200px; height:200px; cursor:pointer; border-radius:13px; object-fit:cover;">
				            </c:if>
				            
						</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</div>
		
		<div class="mustEatPlace listBox">
			<div class="listBoxHeader">
				<div class="fontWhite">TasttyTrove MustEatPlace</div>
				<a class="fontCB">더보기</a>
			</div>

			<div class="listInfoBox">
				<div class="mustEatPlace-gallery" style="overflow-x: auto; white-space: nowrap; width:100%; height:100%;">
				<c:forEach var="mustEatPlaceItem" items="${mainMustEatPlace}">
				<c:if test="${mustEatPlaceItem.type.equals('일식')}">
					<div class="mustEatPlace-info-Japanese" style="margin-left:5%;">
						<p class="restaurant-name" onclick="moveToLocation('${mustEatPlaceItem.place}')" style="font-weight:bold; font-size:1.2rem; cursor:pointer; margin-top:10px; margin-bottom:10px;">${mustEatPlaceItem.restaurantName}</p>
			            <c:if test="${mustEatPlaceItem.representativeMenuImage == null}">
			            	<img src="<c:url value="/image/noPhoto.PNG"/>" onclick="location.href='/main/mustEatPlaceInfo?id=${mustEatPlaceItem.id}'" style="width:200px; height:200px; cursor:pointer; object-fit:cover;"><br>
			            </c:if>
			            <c:if test="${mustEatPlaceItem.representativeMenuImage != null}">
			            	<img src="data:image/jpg;base64,${mustEatPlaceItem.representativeMenuImage}" onclick="location.href='/main/mustEatPlaceInfo?id=${mustEatPlaceItem.id}'" style="width:200px; height:200px; cursor:pointer; border-radius:13px; object-fit:cover;"><br>
			            </c:if>
			      
					</div>
					</c:if>
				</c:forEach>
				</div>
			</div>
		</div>
	</div>
		
		<%-- <div class="mustEatPlace listBox">
			<div class="listBoxHeader">
				<div class="fontWhite">TasttyTrove MustEatPlace</div>
				<a>더보기</a>
			</div>

			<div class="listInfoBox">
				<div class="mustEatPlace-gallery" style="overflow-x: auto; white-space: nowrap; ">
			    	<h2># 한식</h2>
				    <c:forEach var="mustEatPlaceItem" items="${mainMustEatPlace}">
						<div class="mustEatPlace-info-korean" style="margin-left:10%;">
							<c:if test="${mustEatPlaceItem.type.equals('한식')}">
							<p class="restaurant-name" onclick="moveToLocation('${mustEatPlaceItem.place}')" style="font-weight:bold; font-size:1.2rem; cursor:pointer; margin-top:10px; margin-bottom:10px;">${mustEatPlaceItem.restaurantName}</p>
				            <c:if test="${mustEatPlaceItem.representativeMenuImage == null}">
				            	<img src="<c:url value="/image/noPhoto.PNG"/>" onclick="location.href='/main/mustEatPlaceInfo?id=${mustEatPlaceItem.id}'" style="width:200px; height:200px; cursor:pointer; object-fit:cover;"><br>
				            </c:if>
				            <c:if test="${mustEatPlaceItem.representativeMenuImage != null}">
				            	<img src="data:image/jpg;base64,${mustEatPlaceItem.representativeMenuImage}" onclick="location.href='/main/mustEatPlaceInfo?id=${mustEatPlaceItem.id}'" style="width:200px; height:200px; cursor:pointer; border-radius:13px; object-fit:cover;">
				            </c:if>
				            </c:if>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		
	</div>
    
    <div class="mustEatPlace-gallery" style="overflow-x: auto; white-space: nowrap; ">
    	<h2># 한식</h2>
	    <c:forEach var="mustEatPlaceItem" items="${mainMustEatPlace}">
			<div class="mustEatPlace-info-korean" style="margin-left:10%;">
				<c:if test="${mustEatPlaceItem.type.equals('한식')}">
				<p class="restaurant-name" onclick="moveToLocation('${mustEatPlaceItem.place}')" style="font-weight:bold; font-size:1.2rem; cursor:pointer; margin-top:10px; margin-bottom:10px;">${mustEatPlaceItem.restaurantName}</p>
	            <c:if test="${mustEatPlaceItem.representativeMenuImage == null}">
	            	<img src="<c:url value="/image/noPhoto.PNG"/>" onclick="location.href='/main/mustEatPlaceInfo?id=${mustEatPlaceItem.id}'" style="width:200px; height:200px; cursor:pointer; object-fit:cover;"><br>
	            </c:if>
	            <c:if test="${mustEatPlaceItem.representativeMenuImage != null}">
	            	<img src="data:image/jpg;base64,${mustEatPlaceItem.representativeMenuImage}" onclick="location.href='/main/mustEatPlaceInfo?id=${mustEatPlaceItem.id}'" style="width:200px; height:200px; cursor:pointer; border-radius:13px; object-fit:cover;">
	            </c:if>
	            </c:if>
			</div>
		</c:forEach>
	</div>


	<c:forEach var="mustEatPlaceItem" items="${mainMustEatPlace}">
		<div class="mustEatPlace-info-Japanese">
			<c:if test="${mustEatPlaceItem.type.equals('일식')}">
			<p class="restaurant-name" onclick="moveToLocation('${mustEatPlaceItem.place}')" style="font-weight:bold; font-size:1.2rem; cursor:pointer; margin-top:10px; margin-bottom:10px;">${mustEatPlaceItem.restaurantName}</p>
            <c:if test="${mustEatPlaceItem.representativeMenuImage == null}">
            	<img src="<c:url value="/image/noPhoto.PNG"/>" onclick="location.href='/main/mustEatPlaceInfo?id=${mustEatPlaceItem.id}'" style="width:200px; height:200px; cursor:pointer; object-fit:cover;"><br>
            </c:if>
            <c:if test="${mustEatPlaceItem.representativeMenuImage != null}">
            	<img src="data:image/jpg;base64,${mustEatPlaceItem.representativeMenuImage}" onclick="location.href='/main/mustEatPlaceInfo?id=${mustEatPlaceItem.id}'" style="width:200px; height:200px; cursor:pointer; border-radius:13px; object-fit:cover;"><br>
            </c:if>
            </c:if>
		</div>
	</c:forEach> --%>

	
	<%@include file="../main/footer.jsp" %>
	
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

</body>
</html>