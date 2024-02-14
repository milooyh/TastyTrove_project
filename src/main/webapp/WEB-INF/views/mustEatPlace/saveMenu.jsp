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
		width: 60%;
        heigt: 100%;
        display:block;
        border-radius: 10px;
        margin-top:5%;
        margin-left: auto;
    	margin-right: auto;
        box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
		text-decoration: none;
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
		
		.btn {
		    position: relative;
		    border: none;
		    padding: 7px 15px;
		    border-radius: 15px;
		    font-family: "paybooc-Light", sans-serif;
		    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
		    text-decoration: none;
		    font-weight: 600;
		    transition: 0.25s;
		    background-color: #6aafe6;
		    color: #d4dfe6;
		}
		
		input {
            border-radius: 15px;
            border: 0;
            margin: 17px;
            padding: 10px;
            outline: none;
            background-color: rgb(233, 233, 233);
        }
        
        .add-menu {
        	display:block;
        	margin:0 auto;
        }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:include page="../main/header.jsp"></jsp:include>
<body>

	<div class="container">
		<div class="nav-nar2">
			<p class="ment">당신만을 위한</p>
			<h3>맛집</h3>
		</div>
		<div class="ment2">자신만의 맛집을 등록하고, 오늘의 메뉴? 고민하지 마세요</div>
		<div class="add-menu">
			<form action="/must/registerMenu" method="post" modelAttribute="mustEatPlaceMenu">
				<input type="hidden" id="id" name="id" value="${id}">
				
		        <label for="menuName">Menu Name:</label>
		        <input type="text" id="menuName" name="menuName" required>
		        <br>
		        <label for="price">Price:</label>
		        <input type="number" id="price" name="price" required>
		        <br>
		        <input type="submit" value="추가하기" class="btn btn-sm">
		    </form>
	    </div>
    </div>
</body>
<jsp:include page="../main/footer.jsp"></jsp:include>
</html>