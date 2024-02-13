<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
	*{
		margin:0;
		padding:0;
	}

	body {
		background-color:#e2e6e9;
	}

	.container {
		display:block;
		margin:0 auto;
		width:100%;
		height:700px;
		margin-top:20px;
	}
	
	.input {
		display:block;
		margin:0 auto;
		width:40%;
		height:10%;
	}
	
	input {
		margin-top:15px;
		width:300px;
		height:50px;
		font-size:1.05rem;
		border-radius:10px;
		box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
		border:none;
		font-weight: 500;
		transition: 0.25s;
		text-decoration: none;	
		display:block;
		margin:0 auto;
	}
	
	p {
		text-align:center;
	}
	
	.submit {
		display:block;
		margin:0 auto;
		margin-top:30px;
		width:400px;
		height:50px;
		border-radius:20px;
		box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
		border:none;
		background-color: #6aafe6;
		color: #d4dfe6;
		font-family: "paybooc-Light", sans-serif;
		padding: 7px 15px;
		font-weight: 400;
		cursor:pointer;
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
	<div class="container">
	<form action="/must/modify" method="post">
		<input type="hidden" name="id" value="${mustEatPlace.id}">
		<p>식당이름</p><input type="text" name="restaurantName" value="${mustEatPlace.restaurantName}"> <button type="button" onclick="search_address()" value="주소 검색"></button><br>
		<p>주소</p><input type="text" name="place" value="${mustEatPlace.place}" readonly><br>
		<p>리뷰</p><input type="text" name="review" value="${mustEatPlace.review}"><br>
		<p>별점(1~5)</p><input type="number" name="asterion" value="${mustEatPlace.asterion}"><br>
		<p>대표메뉴</p><input type="text" name="representativeMenu" value="${mustEatPlace.representativeMenu}"><br>
		<p>전화번호</p><input type="text" name="telephoneNumber" value="${mustEatPlace.telephoneNumber}"><br>
		<button type="submit" class="submit" >수정하기</button>
	</form>
	</div>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<script>
	document.addEventListener("DOMContentLoaded", function() {
	    const asterionInput = document.querySelector('input[name="asterion"]');
	    const submitButton = document.querySelector('.submit');
	    
	    submitButton.addEventListener('click', function(event) {
	        const asterionValue = parseInt(asterionInput.value);

	        if (asterionValue < 1 || asterionValue > 5) {
	            event.preventDefault(); // 폼 제출 방지
	            alert('별점은 1부터 5까지의 값만 입력할 수 있습니다.');
	        } else {
	            submitButton.removeAttribute('disabled');
	        }
	    });
	});
	</script>
</body>
<jsp:include page="../main/footer.jsp"></jsp:include>
</html>