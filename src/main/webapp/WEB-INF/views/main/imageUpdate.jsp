<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
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
</head>
<body>
	<h1>파일 업로드 페이지</h1>
	
	<form action="/main/mustEatPlaceInfo/reviewUpload" method="post" enctype="multipart/form-data">
		<input type="hidden" name="id" value="${mustEatPlace.id}">
		<input type="file" name="representativeMenuImage" id="file" />
		<input type="submit" value="Upload" class="input"/><br><br>
	</form>
</body>
</html>