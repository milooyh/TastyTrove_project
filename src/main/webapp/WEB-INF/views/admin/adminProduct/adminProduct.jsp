<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/adminMember.css?after"
	type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<%@include file="../adminHeader.jsp"%>
<body>
	<h1>상품목록</h1>
	<div class="content">
		<div class="content-title">상품 내역 목록</div>
		<hr>
		<div class="content-nav">
			<span>상품관리</span><span> - </span><span><a
				href="/admin/product">상품내역목록</a></span><span> - </span><span><a
				href="/admin/product/search">상품내역검색</a></span>
				<span><a
				href="/admin/product/add">상품추가</a></span>
		</div>

		<div class="table-container">
			<table id="memberTable">
				<thead>
					<tr>
						<th>상품번호</th>
						<th>상품명</th>
						<th>가격</th>
						<th>재고수량</th>
						<th>상품정보수정</th>
						<th>상품삭제</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach var="product" items="${productList}">
						<tr>
							<td>${product.productId}</td>
							<td><a
								href="/admin/product/content?productId=${product.productId}">${product.productName}</a></td>
							<td>${product.productPrice}</td>
							<td>${product.productCount}</td>


							<td><button
									onclick="location.href='/admin/product/update?productId=${product.productId}'">
									수정하기</button></td>
							<td><button onclick="confirmDelete(${product.productId})">삭제하기</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<script>
		function confirmDelete(memberId) {
			var result = confirm("정말 삭제하시겠습니까?");

			if (result) {
				location.href = '/admin/product/remove?productId=' + productId;
			}
		}
	</script>
</body>
</html>