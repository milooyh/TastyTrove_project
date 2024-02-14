<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/saveMember.css?
	after"
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
			<span>맛집관리</span><span> - </span><span><a
				href="/admin/musteatplace">맛집목록</a></span><span> - </span><span><a
				href="/admin/musteatplace/search">맛집검색</a></span><span> - </span><span><a
				href="/admin/musteatplace/add">맛집추가</a></span>
		</div>

		<form method="post" action="/admin/musteatplace/update">
			<input type="hidden" name="id" value="${mustEatPlace.id}" />

			<div class="form-item">
				<label for="restaurantName">맛집명:</label> <input type="text"
					id="restaurantName" name="restaurantName"
					value="${mustEatPlace.restaurantName}" />
			</div>

			<div class="form-item">
				<label for="place">주소:</label> <input type="text" id="place"
					name="place" value="${mustEatPlace.place}" />
			</div>
			<div class="form-item">
				<label for="place">전화번호:</label> <input type="text" id="place"
					name=telephoneNumber value="${mustEatPlace.telephoneNumber}" />
			</div>
			<div class="form-item">
				<label for="place">오픈시간:</label> <input type="text" id="place"
					name="openingHours" value="${mustEatPlace.openingHours}" />
			</div>
			<div class="form-item">
				<label for="place">마감시간:</label> <input type="text" id="place"
					name="closingHours" value="${mustEatPlace.closingHours}" />
			</div>
			<div class="form-item">
				<label for="place">타입:</label> <input type="text" id="place"
					name="type" value="${mustEatPlace.type}" />
			</div>
			<div class="form-item">
				<button type="submit">수정하기</button>
				<button onclick="location.href='/admin/musteatplace'">맛집 목록</button>
			</div>
		</form>

</body>
</html>
