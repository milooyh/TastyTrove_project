<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>관리자 메인 페이지</h1>
	관리자 ${userId}님 로그인 중
	<hr>
	<a href="/admin/adminMember/member">회원관리</a><br>
	<a href="/admin/recipeboard">레시피게시판관리</a><br>
	<a href="/admin/musteatplace">맛집관리</a><br>
	<a href="/admin/product">상품관리</a><br>
	<a href="/admin/order">주문관리</a><br>
	<a href="/admin/payment">결제관리</a><br>
	<a href="/admin/delivery">배송관리</a><br>
	
</body>
</html>