<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
	integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script src="/summernote/summernote-lite.js"></script>
<script src="/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/summernote/summernote-lite.css">
</head>
<body>
	<h1>레시피 등록 화면</h1>
	<!-- 임시작성 -->
	<form method="post">
		작성자 <input type="text" name="memberId"> 제목 <input type="text"
			name="recipeTitle"> 카테고리 <select id="category"
			name="recipeType">
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
		<button>취소</button>
	</form>

	<script>

		$('#summernote').summernote(
				{
					height : 300, // 에디터 높이
					minHeight : null, // 최소 높이
					maxHeight : null, // 최대 높이
					focus : true, // 에디터 로딩후 포커스를 맞출지 여부
					lang : "ko-KR", // 한글 설정
					placeholder : '레시피를 작성하고 공유해보세요!', //placeholder 설정
// 					callbacks : { //여기 부분이 이미지를 첨부하는 부분
// 						onImageUpload : function(files) {
// 							uploadSummernoteImageFile(files[0], this);
// 						},
// 						onPaste : function(e) {
// 							var clipboardData = e.originalEvent.clipboardData;
// 							if (clipboardData && clipboardData.items
// 									&& clipboardData.items.length) {
// 								var item = clipboardData.items[0];
// 								if (item.kind === 'file'
// 										&& item.type.indexOf('image/') !== -1) {
// 									e.preventDefault();
// 								}
// 							}
// 						}
// 					}
				});
		
// 		$("div.note-editable").on('drop',function(e){
// 	         for(i=0; i< e.originalEvent.dataTransfer.files.length; i++){
// 	         	uploadSummernoteImageFile(e.originalEvent.dataTransfer.files[i],$("#summernote")[0]);
// 	         }
// 	        e.preventDefault();
// 	   })

// 		/*
// 		 * 이미지 파일 업로드
// 		 */
// 		function uploadSummernoteImageFile(file, editor) {
// 			data = new FormData();
// 			data.append("file", file);
// 			$.ajax({
// 				data : data,
// 				type : "POST",
// 				//url : "/uploadSummernoteImageFile",
// 				url : "/fileStorage",
// 				contentType : false,
// 				processData : false,
// 				enctype : 'multipart/form-data',///
// 				success : function(data) {
// 					//항상 업로드된 파일의 url이 있어야 한다.
// 					$(editor).summernote('insertImage', data.url);
// 					alert(data.url);
// 				}
// 			});
// 		}
	</script>
</body>
</html>