<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 수정</title>
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
	 	background-color: #F0F0F0;
	}
	
	.container {
		display: flex;
		justify-content: center;
		width: 100%;
		padding: 30px;
	}
	
	.title {
		height: 70px;
		color: #6aafe6;
	}
	
	.modifBox{
		width: 1200px;
		height: 100%;
		background-color: white;
		border-radius: 10px;
		padding: 30px;
		background-color: white;
		border: 1px solid #6aafe6;
	}
	
	.infoBox1{
		width: 100%;
		height: 115px;
	}
	
	.infoBox2{
		width: 100%;
		height: 100px;
		border: 2px solid #6aafe6;
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
		background: #6aafe6;
		border: none;
		border-radius: 30px;
		color: white;
		font-weight: bolder;
		font-size: 15px;
		cursor: pointer;
		margin-top: 15px;
		box-shadow: 0 2px 4px rgba(0,0,0,0.1);
		transition: all 0.2s;
	}
	
	.Btn:hover{
		background-color: #0056b3;
	}
	
	.bold{
		font-weight: bold;
	}
	
	.categorySelect{
		width: 100px;
		height: 25px;
	}
	
	.cate{
		margin: 0px 5px; 
	}
	
	.fileCuide{
		width: 314px;
	}
	
	
	@media (max-width: 1180px){
		.titleInput{
			width: 500px;
		}

	}
	
	@media (max-width: 1130px){		
		.modifBox{
			width: 100%;
		}

	}
	
	
	@media (max-width: 1010px){
		.titleInput{
			width: 400px;
		}

	}
	
	@media (max-width: 900px){

		.infoBox1{
			height: 180px;
			margin-bottom: 10px;
		}

		.infoBox2{
			width: 100%;
			height: 100%;
			flex-direction: column;
			align-items: flex-start;
		}
		
		.infoBox3, .infoBox4{
			
		}
		
		.modifBox{
			width: 100%;
		}
		
		
		.titleInput{
			width: 100%;
		}

	}
	
	@media (max-width: 815px){
		.infoBox1{
			width: 675px;
		}
		
		.modifBox{
			width: 763px;
			
		}
	}
		

</style>



</head>
<body>
<%
	String member = (String)session.getAttribute("userId");
	System.out.println(member);
%>
	<%@include file="../main/header.jsp" %>
	<div class="container">
		<div class="modifBox">
			<h1 class="title">레시피 수정</h1>
			<!--  -->
			<form action="" method="post" enctype="multipart/form-data" id="recipeForm">
				<div class="infoBox1">
					<div class="infoBox2">
						<div class="infoBox3">
							<div class="category">
								<span class="bold cate">카테고리</span> 
								<select id="category" name="recipeType" class="categorySelect">
									<option name="category" value="KOR">한식</option>
									<option name="category" value="CHI">중식</option>
									<option name="category" value="WST">양식</option>
									<option name="category" value="JPN">일식</option>
									<option name="category" value="DRT">디저트</option>
									<option name="category" value="ETC">기타</option>
								</select>
							</div>
							<input type="text"name="recipeTitle" id="title" value="${recipeTitle}" class="titleInput" placeholder="제목을 입력해주세요"> 
						</div>
						<div class="infoBox4">
							
							<div class="bold fileCuide">대표 이미지로 등록할 사진을 선택하세요</div>
							<div><input type="file" name="recipeImage" id="fileCheck"></div>
							
						</div>
					</div>
				</div>
		
				<textarea id="summernote" name="recipeContent">${recipeContent}</textarea>
				
				
				<button class="Btn" onclick="modifyProc()" type="button" id="modifyBtn">수정완료</button>
				<button type="button" onclick='postCancle()' class="Btn">취소</button>

			</form>
		</div>
	
	</div>
	<%@include file="../main/footer.jsp" %>

	<script>
	
		var sessionId = '<%=(String)session.getAttribute("userId")%>';
		var recipeFrom = document.getElementById("recipeForm");
		var title = document.getElementById("title");
		var summernote = document.getElementById("summernote");
		
		
		function modifyProc() {
			console.log(sessionId);
			if(sessionId == null || sessionId == "null"){
				alert('로그인 후 이용 가능한 서비스입니다.')
				location.href = "/login"
			}else if(title.value.trim() == null || title.value.trim() == ""){
				console.log('제목입력 요청')
				alert('제목을 입력해주세요!')
				title.focus();
			}else if (summernote.value.trim() == null || summernote.value.trim() == ""){
				console.log('본문입력 요청')
				alert('내용을 입력해주세요!')
				summernote.focus();
			}else{
					console.log('submit 실행');
					recipeFrom.submit();
					alert('레시피 수정이 완료되었습니다!');
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
			history.back();
		}

	</script>

</body>
</html>