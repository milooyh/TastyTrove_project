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
<style>
 .table-container {
    display: flex;
    justify-content: center; /* 수평 중앙 정렬 */
    align-items: start; /* 상단 정렬 */
    height: 100%; /* 부모 컨테이너의 높이를 전체 화면으로 설정 */
   
    }
table {
	margin:auto;
	border-collapse: collapse;
	text-align: center;
	margin-top: -800px; /* 상단 여백 설정 */
	margin-left: 340px;
    width: 70%; /* 테이블의 너비를 80%로 설정 */
    
}

th, td {
	border: 1px solid black;
}
</style>
</head>
<%@include file="../adminHeader.jsp"%>
<body>
<h1>상품목록</h1>
<div class="content">
		<div class="content-title">상품 내역 목록</div>
		<hr>
		<div class="content-nav">
			<span>상품관리</span><span> - </span><span><a
				href="/admin/findproduct">상품내역목록</a></span><span> - </span><span><a
				href="/admin/Content/search">상품내역검색</a></span>
		</div>
	</div>
	<div class="table-container">
	<table>
		<thead>
			<tr>
				<th>상품번호</th>
				<th>상품명</th>
				<th>가격</th>
				<th>재고수량</th>
				<th>수정</th>
				<th>삭제</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="product" items="${productList}">
				<tr>
					<td>${product.productId}</td>
					<td><a href="/admin/product/content?productId=${product.productId}">${product.productName}</a></td>
					<td>${product.productPrice}</td>
					<td>${product.productCount}</td>
				
					
					<td><button
							onclick="location.href='/admin/member/update?memberId=${user.memberId}'"> 상품정보수정</button></td>
					<td><button
							onclick="confirmDelete(${user.memberId})">상품삭제</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
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