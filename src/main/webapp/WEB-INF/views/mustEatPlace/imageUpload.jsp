<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

	<style>
		img {
			width:200px;
			height:200px;
			object-fit: cover;
		}
		
		.nav-nar2 {
			width:100%;
			height:150px;
			background-color:#074565;
			color:white;
			text-align:center;
			font-size:1.5rem;
			display:flex;
			align-items:center;
			justify-content:center;
		}
		
		.nav-nar2 p {
		    margin: 0; /* 기본 마진 제거 */
		}
		
		.ment2 {
			font-size:0.8rem;
			text-align:center;
		}
		
		.input {
			margin-top:15px;
			width:300px;
			height:50px;
			font-size:1.05rem;
			border-radius:10px;
			box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
			border:none;
			font-weight: 700;
			transition: 0.25s;
			text-decoration: none;	
			display:block;
			margin:0 auto;
			background-color:#6aafe6;
			cursor:pointer;
			margin-top:5%;
		}
		
		.restaurantName {
			margin-top:5%;
			text-align:center;
		}
		
		.form {
			display:flex;
			justify-content:center;
		}
		
		.image-upload {
			margin-top:5%;
		}
		
		#file {
			margin-top:5%;
			cursor:pointer;
			border-radius:3px;
			box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
			border:none;
			background-color:#6aafe6;
			text-decoration: none;	
		}
	</style>

<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../main/header.jsp"></jsp:include>
</head>
<body>
	<div class="nav-nar2">
		<p class="ment">당신만을 위한</p>
		<h3>맛집</h3>
	</div>
	<div class="ment2">자신만의 맛집을 등록하고, 오늘의 메뉴? 고민하지 마세요</div>
	
	<div class="image-upload">
		<h2 class="restaurantName">${mustEatPlace.restaurantName}</h2>
		<div class="form">
			<form action="/must/upload" method="post" enctype="multipart/form-data">
				<input type="hidden" name="id" value="${mustEatPlace.id}">
				<input type="file" name="representativeMenuImage" id="file" />
				<input type="submit" value="Upload"  class="input"/><br><br>
			</form>
		</div>
	</div>
</body>	
<jsp:include page="../main/footer.jsp"></jsp:include>
</html>