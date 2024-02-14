<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
* {
	padding: 0px;
	box-sizing: border-box;
	margin: 0px;
}

/* 반응형을 위한 스타일: 화면 크기에 따라 레이아웃을 조정 */
@media ( max-width : 768px) {
	.footer-bottom {
		flex-direction: column;
		align-items: flex-start; /* 화면이 작을 때 항목들을 세로로 정렬 */
	}
	.footer-logo, .footer-contact {
		margin-bottom: 20px; /* 로고 및 연락처 영역에 하단 마진 추가 */
	}
	.footer-contact {
		padding-left: 0; /* 모바일 뷰에서는 좌측 패딩 제거 */
	}
}

@import url('https://fonts.googleapis.com/icon?family=Material+Icons');

@import "bootstrap/scss/bootstrap";

.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 10px 20px;
	background-color: #fff;
	color: #333;
	font-family: 'Arial', sans-serif;
}

.logo {
	font-size: 24px;
	font-weight: bold;
}

.nav-menu {
	list-style-type: none;
	padding: 0;
	margin: 0;
	display: flex;
	gap: 20px;
	font-size: 16px;
}

.nav-menu li {
	padding: 5px 10px;
	cursor: pointer;
}

.nav-menu li:hover {
	text-decoration: underline;
}

.header-icons {
	font-size: 24px;
}

.material-icons {
	cursor: pointer;
	margin-left: 20px;
}

.material-icons:hover {
	color: #555;
}

img {
	object-fit: cover;
	width: 200px;
	height: 100px;
}

a {
	text-decoration: none;
	color: black;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header class="header">
		<div class="logo">
			<a href="/main"><img src="../image/mainlogo.png"></a>
		</div>
		<ul class="nav-menu">
			<li><a href="/recipe">레시피</a></li>
			<li><a href="/must/register">맛집</a></li>
			<li><a href="/product">스토어</a></li>
		</ul>
		<div class="header-icons">
			<span class="material-icons">검색</span> <a href="/cart"><span class="material-icons">장바구니</span></a>
			<c:choose>
				<c:when test="${not empty userId}">
					<!-- 사용자가 로그인한 경우 -->
					<p>${userId}님</p>
				</c:when>
				<c:otherwise>
					<!-- 사용자가 로그인하지 않은 경우 -->
					<a href="/login"><span class="material-icons">로그인</span></a>
				</c:otherwise>
			</c:choose>

			<a href="/logout"><span class="material-icons">로그아웃</span></a>
		</div>
	</header>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>