<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/findMember.css?after"
	type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
	<%@include file="../adminHeader.jsp"%>

	<div class="content">
		<div class="content-title">맛집 검색</div>
		<hr>
		<div class="content-nav">
			<span>맛집관리</span><span> - </span><span><a
				href="/admin/musteatplace">맛집목록</a></span><span> - </span><span><a
				href="/admin/musteatplace/search">맛집검색</a></span><span> - </span><span><a
				href="/admin/musteatplace/add">맛집추가</a></span>
		</div>
		<table id="searchTable">
			<form>
				<tr>
					<td colspan="5">검색기준</td>
				</tr>
				<tr>
					<td>선택</td>
					<td><lable> <input type="checkbox" name="id">맛집번호</lable></td>
					<td><lable> <input type="checkbox"
							name="restaurantName">맛집명</lable></td>
					<td>
				</tr>

				<tr>
					<td></td>
					<td colspan="5"><input type="checkbox" name="place">주소 <lable>
						<input type="text" name="searchKeyword" placeholder="검색어를 입력하세요." required></lable></td>
				</tr>

				<tr>
					<td colspan="9"
						style="background-color: transparent; text-align: center;">
						<button type="button" id="searchButton" onclick="history.back()">취소</button>
						<button type="submit" id="searchButton">검색하기</button>
					</td>
				</tr>
			</form>
		</table>
		<hr>
		<table id="memberTable">
			<thead>
				<tr>
					<th>맛집번호</th>
					<th style="width:10%">맛집명</th>
					<th style="width:20%">주소</th>
					<th>별점</th>
					<th style="width:20%">전화번호</th>
					<th>오픈시간</th>
					<th>마감시간</th>
					<th style="width:3%">유형</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="place" items="${placeList}">
					<tr>
						<td>${place.id}</td>
						<td>${place.restaurantName}</td>
						<td>${place.place}</td>
						<td>${place.rating}</td>
						<td>${place.telephoneNumber}</td>
						<td>${place.openingHours}</td>
						<td>${place.closingHours}</td>
						<td>${place.type}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>
</body>
</html>