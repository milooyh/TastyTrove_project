<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>파일 업로드 페이지</h1>
	
	<form action="/admin/musteatplace/upload" method="post" enctype="multipart/form-data">
		<input type="hidden" name="id" value="${mustEatPlace.id}">
		<input type="file" name="representativeMenuImage" id="file" />
		<input type="submit" value="Upload" /><br><br>
		<img src="data:image/jpg;base64,${mustEatPlace.representativeMenuImage}">
	</form>
</body>
</html>