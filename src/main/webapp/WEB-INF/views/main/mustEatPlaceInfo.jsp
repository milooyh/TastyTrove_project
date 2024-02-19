<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<style>
	.container {
    display: flex;
    flex-direction: column;
    align-items: center;
	}
	
	.restaurant-info, .menu-info, .review, .business-status {
	    margin-bottom: 20px;
	    padding:30px;
	    background-color:#ffffff;
	    width:700px;
	    border-radius:10px;
        font-family: "paybooc-Light", sans-serif;
		box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
		text-decoration: none;
	}
	
	.reviews {
		border:0.5px solid #f0f0f3;
		padding:15px;
		margin-bottom:15px;
	}
	
	.restaurant-info {
		margin-top:4%;
	}
	
	p {
		margin-top:4%;
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
		    display: inline-block;
		    padding: 7px 15px;
		    border-radius: 15px;
		    font-family: "paybooc-Light", sans-serif;
		    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
		    text-decoration: none;
		    font-weight: 600;
		    transition: 0.25s;
		    cursor:pointer;
		    margin-top:2%;
		}
		
		.btn-blue {
		    background-color: #6aafe6;
		    color: #d4dfe6;
		}
	
		body {
			background-color:#f0f0f3;
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
	<div class="container">
		<div class="restaurant-info">
			<img src="<c:url value="/image/godeung.jpg"/>" style="width:300px; height:300px; margin-top:5px; ">
			<h1>${mainMustEatPlaceById.restaurantName}</h1>
			<input type="hidden" name="id" value="${mainMustEatPlaceById.id}">
			<p><img src="<c:url value="/image/map-marker.png"/>" style="width:15px; height:15px;"> ${mainMustEatPlaceById.place}</p>
			<p><img src="<c:url value="/image/telephone.png"/>" style="width:15px; height:15px; margin-top:5px;"> ${mainMustEatPlaceById.telephoneNumber}</p>
			<p><img src="<c:url value="/image/star.png"/>" style="width:15px; height:15px;"> ${mainMustEatPlaceById.rating}
			<p><img src="<c:url value="/image/menu.png"/>" style="width:15px; height:15px;"> ${mainMustEatPlaceById.type}</p>
			<button onclick="location.href='/main/mustEatPlaceInfo/review?id=${mainMustEatPlaceById.id}'" class="btn btn-blue">평가하기</button>
		</div>
		<div class="business-status">
			<h2>영업시간</h2>
			<p>영업시간: ${mainMustEatPlaceById.openingHours}-${mainMustEatPlaceById.closingHours}</p>
			<p>${mainMustEatPlaceById.businessStatus}</p>
		</div>
		
		<div class="menu-info">
		<h2>메뉴정보</h2>
		<c:forEach var="mainMustEatPlaceMenuInfoByIdItem" items="${mainMustEatPlaceMenuInfoById}">
			<p>${mainMustEatPlaceMenuInfoByIdItem.menuName} -- ${mainMustEatPlaceMenuInfoByIdItem.price}원</p>
		</c:forEach>
		</div>
		
		<div class="review">
		<c:forEach var="mainMustEatPlaceReviewByIdItem" items="${mainMustEatPlaceReviewById}">
			<div class="reviews">
			<h3>${mainMustEatPlaceReviewByIdItem.userId}</h3>
			<div class="rating">
		        <script>
		            var rating = ${mainMustEatPlaceReviewByIdItem.rating};
		            var stars = '⭐'.repeat(rating) + '☆'.repeat(5 - rating);
		            document.write('<p>' + stars + '</p>');
		        </script>
		    </div>
			<p>${mainMustEatPlaceReviewByIdItem.review}</p>
			<c:if test="${mainMustEatPlaceReviewByIdItem.userId eq userId}">
			<button onclick="removeReview('${mainMustEatPlaceReviewByIdItem.review}')" class="btn btn-blue">리뷰 삭제</button><br><br>
			</c:if>
			</div>
		</c:forEach>
		</div>
	</div>
	
	<script>
	
	function removeReview(review){
		if(confirm("정말 삭제하시겠습니까?")){
			//확인을 눌렀다
			console.log('삭제 확인 누름');
			console.log('넘어온 id 값 : ' + review);
			location.href='/main/mustEatPlaceInfo/removeReview?review=' + review;
		}	
		//취소 누르면 아무것도 안함
	}
	</script>
</body>
<jsp:include page="../main/footer.jsp"></jsp:include>
</html>