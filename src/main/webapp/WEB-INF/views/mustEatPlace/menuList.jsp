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
	
	 * {
		margin:0;
		padding:0;
		box-sizing:border-box;
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
	
	input {
            border-radius: 15px;
            border: 0;
            margin: 17px;
            padding: 10px;
            outline: none;
            background-color: rgb(233, 233, 233);
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
		
	.deleteMenu {
		display:block;
		margin:0 auto;
	}
		
	body {
		background-color:#f0f0f0;
	}
	
	
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../main/header.jsp"></jsp:include>
</head>
<body>

	<div class="container">
	<div class="nav-nar2">
		<p class="ment">당신만을 위한</p>
		<h3>맛집</h3>
	</div>
	<div class="ment2">자신만의 맛집을 등록하고, 오늘의 메뉴? 고민하지 마세요</div>
    <c:forEach var="mustEatPlaceMenuItem" items="${mustEatPlaceMenu}">
        <div class="deleteMenu">
            <input type="hidden" name="menuId" value="${mustEatPlaceMenuItem.menuId}">
            메뉴 : <input type="text" name="menuName" value="${mustEatPlaceMenuItem.menuName}" readonly>
            가격 : <input type="number" name="price" value="${mustEatPlaceMenuItem.price}" readonly>
            <button class="btn btn-sm" onclick="removeMenu('${mustEatPlaceMenuItem.menuName}')">삭제하기</button><br>
        </div>
    </c:forEach>
</div>

	<script>
	
	function removeMenu(menuName){
		if(confirm("정말 삭제하시겠습니까?")){
			//확인을 눌렀다
			console.log('삭제 확인 누름');
			console.log('넘어온 id 값 : ' + menuName);
			location.href='/must/removeMenu?menuName=' + menuName;
		}	
		//취소 누르면 아무것도 안함
	}
	</script>
</body>
<jsp:include page="../main/footer.jsp"></jsp:include>
</html>