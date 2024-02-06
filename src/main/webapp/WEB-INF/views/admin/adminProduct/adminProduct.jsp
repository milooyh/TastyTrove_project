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
	<h1>상품 목록</h1>
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
				<th>상품번호</th>
				<th>상품명</th>
				<th>가격</th>
				<th>재고수량</th>
				<th>이미지</th>
				<th>카테고리</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="product" items="${productList}">
				<tr>
					<td>${product.productId}</td>
					<td><a href="/admin/product/content?productId=${product.productId}">${product.productName}</a></td>
					<td>${product.productPrice}</td>
					<td>${product.productCount}</td>
					<td>${product.productImage}</td>
					<td>${product.productType}</td>
					
					<td><button
							onclick="location.href='/admin/member/update?memberId=${user.memberId}'"> 상품정보수정</button></td>
					<td><button
							onclick="confirmDelete(${user.memberId})">상품삭제</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	<button onclick="location.href='/admin/product/add'">상품추가</button>
	<button onclick="location.href='/admin/product/search'">상품검색</button>

	<script>
		function confirmDelete(memberId) {
			var result = confirm("정말 삭제하시겠습니까?");

			if (result) {
				location.href = '/admin/member/remove?memberId=' + memberId;
			}
		}
	</script>
</body>
</html>