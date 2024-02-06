<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	border-collapse: collapse;
	text-align: center;
}

th, td {
	border: 1px solid black;
}
</style>
</head>
<body>
	<h1>맛집 검색</h1> 
	<hr>
	<form>
		<p>검색기준</p>
		<lable><input type="checkbox" name="placeId">맛집번호</lable>
		<lable><input type="checkbox" name="restaurantName">맛집명</lable>
		<lable><input type="checkbox" name="place">주소</lable>
		<lable><input type="text" name="searchKeyword" placeholder="검색어를 입력하세요."></lable>
		<button type="submit">검색하기</button>
	</form>
	<hr>
	<table>
		<thead>
			<tr>
				<th>맛집번호</th>
				<th>맛집명</th>
				<th>주소</th>
				<th>별점</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="place" items="${placeList}">
				<tr>
					<td>${place.placeId}</td>
					<td>${place.restaurantName}</td>
					<td>${place.place}</td>
					<td>${place.rating}</td>
					<td><button>맛집정보수정</button>
					<td><button>맛집삭제</button>
				</tr>
			</c:forEach>
		</tbody>
	</table><br>
	<button onclick="location.href='/admin/musteatplace'">전체맛집목록</button>
	
</body>
</html>