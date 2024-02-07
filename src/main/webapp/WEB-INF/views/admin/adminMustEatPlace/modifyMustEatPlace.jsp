<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/adminMustEatPlace.css?after"
	type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
	<%@include file="../adminHeader.jsp"%>

	<div class="content">
		<div class="content-title">맛집 정보 수정</div>
		<hr>
		<div class="content-nav">
			<span>맛집관리</span><span> - </span><span><a href="/admin/musteatplace">맛집목록</a></span><span>
				- </span><span><a href="/admin/musteatplace/search">맛집검색</a></span><span>
				- </span><span><a href="/admin/musteatplace/add">맛집추가</a></span>
		</div>
    
    <form:form method="post" action="/admin/musteatplace/update">
        <input type="hidden" name="placeId" value="${mustEatPlace.placeId}" />
        
        <label for="restaurantName">맛집명:</label>
        <input type="text" id="restaurantName" name="restaurantName" value="${mustEatPlace.restaurantName}" /><br>
        
        <label for="place">주소:</label>
        <input type="place" id="place" name="place" value="${mustEatPlace.place}" /><br>
        <input type="submit" value="수정" />
    </form:form>
    
    <br>
    <button onclick="location.href='/admin/musteatplace'">뒤로 가기</button>
</body>
</html>
