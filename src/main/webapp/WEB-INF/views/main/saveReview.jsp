<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style>
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
</style>

<jsp:include page="../main/header.jsp"></jsp:include>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="nav-nar2">
		<p class="ment">먹기위해 사는 사람들</p>
	</div>
	<div class="ment2">오늘도 배불리 먹기위해 달려보자</div>
	<form action="" method="post">
		<input type="hidden" name="id" value="${id}">
		<textarea name="review">리뷰를 작성하세요</textarea>
		별점(1~5)<input type="number" name="rating">
		<input type="hidden" name="userId" value="${userId}">
		<button type="submit">리뷰 추가하기</button>
	</form>
</body>
<jsp:include page="../main/footer.jsp"></jsp:include>
</html>