<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 등록</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
	integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script src="/summernote/summernote-lite.js"></script>
<script src="/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/summernote/summernote-lite.css">
</head>
<body>
<%
	String member = (String)session.getAttribute("memberId");
	System.out.println(member);
%>

	<h1>레시피 등록 화면</h1>
	<!-- 임시작성 -->
	<form action="" method="post" enctype="multipart/form-data">
		작성자 <input type="text" name="memberId"  value="<%=member %>"> 
		제목 <input type="text"name="recipeTitle"> 
		카테고리 <select id="category" name="recipeType">
			<option name="category" value="KOR">한식</option>
			<option name="category" value="CHI">중식</option>
			<option name="category" value="WST">양식</option>
			<option name="category" value="JPN">일식</option>
			<option name="category" value="DRT">디저트</option>
		</select>

		<textarea id="summernote" name="recipeContent"></textarea>
		대표 이미지로 등록할 사진을 선택하세요 <br>
		<input type="file" name="recipeImage"> <br><br>
		

		<button>등록</button>
		<button type="button" onclick='postCancle()'>취소</button>
	</form>

	<script>

		$('#summernote').summernote(
				{
					height : 500, // 에디터 높이
					minHeight : null, // 최소 높이
					maxHeight : null, // 최대 높이
					focus : true, // 에디터 로딩후 포커스를 맞출지 여부
					lang : "ko-KR", // 한글 설정
					placeholder : '자신의 레시피를 작성하고 공유해보세요!', //placeholder 설정
				});
		function postCancle(){
			location.href = "/recipe"
		}

	</script>
</body>
</html>