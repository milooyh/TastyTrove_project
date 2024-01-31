<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script src="/summernote/summernote-lite.js"></script>
<script src="/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/summernote/summernote-lite.css">
</head>
<body>
	<h1>레시피 등록 화면</h1>
	<!-- 임시작성 -->
	<form action="" method="post">
	작성자 <input type="text" name="user_id">
	제목 <input type="text" name="recipe_title">
	작성일자 <input type="text" name="created_at">
	카테고리
	<select id="category">
		<option name="category" value="1">한식</option>
		<option name="category" value="2">중식</option>
		<option name="category" value="2">양식</option>
		<option name="category" value="2">일식</option>
		<option name="category" value="2">디저트</option>
	</select>
	<textarea class="summernote" name="recipe_content"></textarea>
		
	<button>등록</button><button>취소</button>
	</form>

	<script>

		$('.summernote').summernote(
				{
					height : 500, // 에디터 높이
					lang : "ko-KR", // 한글 설정
					focus: true
					
// 					callbacks: {
// 		                onImageUpload: function (files, editor, welEditable) {
// 		                    // 파일 업로드 (다중 업로드를 위해 반복문 사용)
// 		                    for (var i = files.length - 1; i >= 0; i--) {
// 		                        var fileName = files[i].name

// 		                        // 이미지 alt 속성 삽일을 위한 설정
// 		                        var caption = prompt('이미지 설명 :', fileName)
// 		                        if (caption == '') {
// 		                            caption = '이미지'
// 		                        }
// 		                        uploadSummernoteImageFile(files[i], this, caption)
// 		                    }
// 		                },
// 		            },
// 		        })
// 		    })

// 		    // 이미지 업로드 함수 ajax 활용
// 		    function uploadSummernoteImageFile(file, el, caption) {
// 		        data = new FormData()
// 		        data.append('file', file)
// 		        $.ajax({
// 		            data: data,
// 		            type: 'POST',
// 		            url: 'uploadSummernoteImageFile',
// 		            contentType: false,
// 		            enctype: 'multipart/form-data',
// 		            processData: false,
// 		            success: function (data) {
// 		                $(el).summernote(
// 		                    'editor.insertImage',
// 		                    data.url,
// 		                    function ($image) {
// 		                        $image.attr('alt', caption) // 캡션 정보를 이미지의 alt 속성에 설정
// 		                    }
// 		                )
// 		            },
// 		        })
// 		    }
		});
		

		
	</script>
</body>
</html>