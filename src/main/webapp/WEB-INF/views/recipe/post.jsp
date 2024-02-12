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
<style>
	* {
	margin: 0px;
	padding: 0px;
	box-sizing: border-box;
	}
	
	html, body {
		height: 100%;
		background-color: #EDEDED;
	}
	
	.container {

		display: flex;
		justify-content: center;
		width: 100%;
		height: 100%;
		padding: 30px;
	}
	
	.title {
		height: 70px;
	}
	
	.postBox{
		width: 1200px;
		height: 100%;
		padding: 30px;
		background-color: white;
		border-radius: 10px;
		border: 1px solid gray;
	}
	
	.infoBox1{
		width: 100%;
		height: 115px;
	}
	
	.infoBox2{
		width: 100%;
		height: 100px;
		border: 2px solid gray;
		border-radius: 5px;
		padding: 10px;
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	
	.infoBox3{
		width: 650px;
	}
	
	.infoBox4{
		height: 100%;
		width: 350px;
		padding: 10px 0px;
		display: flex;
		flex-direction: column;
		justify-content: space-between;
	}
	
	.category{
		margin-bottom: 10px;
	}
	
	.titleInput{
		width: 100%;
		height: 40px;
		padding-left: 10px;
		border-radius: 5px;
		border: 1px solid gray;
		font-size: 16px;
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
	
	.bold{
		font-weight: bold;
	}
	
	.categorySelect{
		width: 100px;
		height: 25px;
	}
		

</style>
</head>
<body>
<%
	String member = (String)session.getAttribute("userId");
	System.out.println(member);
%>
	<div class="container">
		<div class="postBox">
			<h1 class="title">나만의 레시피를 등록하세요!</h1>
			<form method="post" enctype="multipart/form-data" id="recipeForm">
				<input type="hidden" name="memberId" value="<%=member %>">
				<div class="infoBox1">
					<div class="infoBox2">
						<div class="infoBox3">
							<div class="category">
								<span class="bold">카테고리</span> 
								<select id="category" name="recipeType" class="categorySelect">
									<option name="category" value="KOR">한식</option>
									<option name="category" value="CHI">중식</option>
									<option name="category" value="WST">양식</option>
									<option name="category" value="JPN">일식</option>
									<option name="category" value="DRT">디저트</option>
								</select>
							</div>
							<input type="text"name="recipeTitle" id="title" placeholder="제목을 입력해주세요" class="titleInput"> 
						</div>
						<div class="infoBox4">
							
							<div class="bold">대표 이미지로 등록할 사진을 선택하세요</div>
							<div><input type="file" name="recipeImage" id="fileCheck"></div>
							
						</div>
					</div>
				</div>
		
				<textarea id="summernote" name="recipeContent"></textarea>
				
				<button onclick="submitProc()" type="button" id="submitBtn" class="Btn">등록</button>
				<button type="button" onclick='postCancle()' class="Btn">취소</button>
			</form>
		</div>
	</div>

	<script>
		
		var file = document.getElementById("fileCheck");
		var recipeFrom = document.getElementById("recipeForm");
		var title = document.getElementById("title");
		var summernote = document.getElementById("summernote");

		
		function submitProc() {
			if(title.value.trim() == null || title.value.trim() == ""){
				console.log('제목입력 요청')
				alert('제목을 입력해주세요!')
				title.focus();
			}else if (summernote.value.trim() == null || summernote.value.trim() == ""){
				console.log('본문입력 요청')
				alert('내용을 입력해주세요!')
				summernote.focus();
			}else{
				
				if(file.value == null || file.value == ''){
					console.log('첨부파일 존재하지 않음');
					alert('사진을 첨부해주세요!');
				}else{
					console.log('submit 실행');
					console.log(file.value);
					recipeFrom.submit();
					alert('레시피 등록이 완료되었습니다!');
				}	
			}
		}
	
	
		$('#summernote').summernote(
				{
					height : 500, // 에디터 높이
					minHeight : 500, // 최소 높이
					maxHeight : 500, // 최대 높이
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