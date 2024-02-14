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
	</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="form">
		<form action="/admin/musteatplace/upload" method="post" enctype="multipart/form-data">
			<input type="hidden" name="id" value="${mustEatPlace.id}">
			<input type="file" name="representativeMenuImage" id="file" />
			<input type="submit" value="Upload" class="input"/><br><br>
		</form>
	</div>
</body>
</html>