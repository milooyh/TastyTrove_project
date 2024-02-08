<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>

	body {
		background-color:#e2e6e9;
	}

	.container {
		display:block;
		margin:0 auto;
		width:80%;
		height:800px;
	}
	
	.input {
		display:block;
		margin:auto;
		width:40%;
		height:10%;
	}
	
	input {
		width:400px;
		height:50px;
		font-size:1.2rem;
		border-radius:20px;
		box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
		border:none;
		font-weight: 500;
		transition: 0.25s;
		text-decoration: none;
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
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>맛집 수정 페이지</h1>
	
	<div class="container">
	<form action="/must/modify" method="post">
		<input type="hidden" name="id" value="${mustEatPlace.id}">
		<div class="input">식당이름<input type="text" name="restaurantName" value="${mustEatPlace.restaurantName}"> <input type="button" onclick="search_address()" value="주소 검색"></div><br>
		<div class="input">주소<input type="text" name="place" value="${mustEatPlace.place}"></div><br>
		<div class="input">리뷰<input type="text" name="review" value="${mustEatPlace.review}"></div><br>
		<div class="input">별점(1~5)<input type="number" name="asterion" value="${mustEatPlace.asterion}"></div><br>
		<div class="input">대표메뉴<input type="text" name="representativeMenu" value="${mustEatPlace.representativeMenu}"></div><br>
		<div class="input">전화번호<input type="text" name="telephoneNumber" value="${mustEatPlace.telephoneNumber}"></div><br>
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
</html>