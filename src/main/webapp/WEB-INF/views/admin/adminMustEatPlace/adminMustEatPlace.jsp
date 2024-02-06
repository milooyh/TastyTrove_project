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
	<h1>맛집 목록</h1>
	<a href="/admin/recipeboard">레시피게시판관리</a>
	<br>
	<a href="/admin/musteatplace">맛집관리</a>
	<br>
	<a href="/admin/product">상품관리</a>
	<br>
	<a href="/admin/order">주문관리</a>
	<br>
	<a href="/admin/payment">결제관리</a>
	<br>
	<a href="/admin/delivery">배송관리</a>
	<br>
	<hr>
	<table>
		<thead>
			<tr>
				<th>맛집번호</th>
				<th>맛집명</th>
				<th>주소</th>
				<th>평균별점</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="place" items="${placeList}">
				<tr>
					<td>${place.placeId}</td>
					<td><a href="/admin/musteatplace/content?placeId=${place.placeId}">${place.restaurantName}</a></td>
					<td>${place.place}</td>
					<td>${place.rating}</td>					
					<td><button
							onclick="location.href='/admin/musteatplace/update?placeId=${place.placeId}'">맛집정보수정</button></td>
					<td><button
							onclick="confirmDelete(${place.placeId})">맛집삭제</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	<button onclick="location.href='/admin/musteatplace/add'">맛집추가</button>
	<button onclick="location.href='/admin/musteatplace/search'">맛집검색</button>

	<script>
		function confirmDelete(placeId) {
			var result = confirm("맛집 정보를 삭제하시겠습니까?");

			if (result) {
				location.href = '/admin/musteatplace/remove?placeId=' + placeId;
			}
		}
	</script>
</body>
</html>