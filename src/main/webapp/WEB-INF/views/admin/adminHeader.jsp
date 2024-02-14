<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/adminNav.css?after"
	type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
	<div class="header">
		<div class="header-logo">
			<img class="logo" src="${path}/image/logo2.png">
			<div class="header-title">
				<a href="/admin">ADMIN PAGE</a>
			</div>
		</div>

		<div class="header-nav">
			<div class="session">
				<i class="fa-solid fa-circle-user"></i> <span>관리자
					"${userId}"님</span>
			</div>
			<button id="logoutbtn" onclick="logout()">로그아웃</button>
		</div>
	</div>

	<div class="nav">
		<div class="nav-item-menu">menu</div>
		
		<div class="nav-item member-nav-item">회원 관리
			<div class="nav-item-submenu member-nav-item-submenu">
				<div class=submenu-title><a href="/admin/member">회원목록</a></div>
				<div class=submenu-title><a href="/admin/member/search">회원검색</a></div>
				<div class=submenu-title><a href="/admin/member/add">관리자추가</a></div>
			</div>
		</div>



		<div class="nav-item recipe-nav-item">레시피게시판 관리
			<div class="nav-item-submenu recipe-nav-item-submenu">
				<div class=submenu-title><a href="/admin/recipeboard">게시판목록</a></div>
				<div class=submenu-title><a href="/admin/recipeboard/search">게시판검색</a></div>
			</div>
		</div>
		
		
		<div class="nav-item must-nav-item">맛집 관리
			<div class="nav-item-submenu must-nav-item-submenu">
				<div class=submenu-title><a href="/admin/musteatplace">맛집목록</a></div>
				<div class=submenu-title><a href="/admin/musteatplace/search">맛집검색</a></div>
			</div>
		</div>
		
		<div class="nav-item product-nav-item">상품 관리
			<div class="nav-item-submenu product-nav-item-submenu">
				<div class=submenu-title><a href="#">상품목록</a></div>
				<div class=submenu-title><a href="#">상품검색</a></div>
				<div class=submenu-title><a href="#">상품추가</a></div>
			</div>
		</div>
		
		<div class="nav-item order-nav-item">주문 관리
			<div class="nav-item-submenu order-nav-item-submenu">
				<div class=submenu-title><a href="/admin/order">전체주문목록</a></div>
				<div class=submenu-title><a href="/admin/order/search">주문내역검색</a></div>
			</div>
		</div>
		
		<div class="nav-item payment-nav-item">결제 관리
			<div class="nav-item-submenu payment-nav-item-submenu">
				<div class=submenu-title><a href="/admin/payment">결제내역목록</a></div>
				<div class=submenu-title><a href="/admin/payment/search">결제내역검색</a></div>
			</div>
		</div>
		
		<div class="nav-item delivery-nav-item">배송 관리
			<div class="nav-item-submenu delivery-nav-item-submenu">
				<div class=submenu-title><a href="/admin/delivery">배송내역목록</a></div>
				<div class=submenu-title><a href="/admin/delivery/search">배송내역검색</a></div>
			</div>
		</div>
	</div>


	<script>
	function logout() {
	    if (confirm("로그아웃하시겠습니까?")) {
	        location.href = '/logout';
	    }
	}
	
	document.addEventListener("DOMContentLoaded", function() {
	    const navItems = document.querySelectorAll('.nav-item');
	    const subMenus = document.querySelectorAll('.nav-item-submenu');

	    navItems.forEach(function(navItem) {
	        navItem.addEventListener('click', function() {
	            // 현재 클릭된 nav-item을 제외한 모든 nav-item 초기화
	            navItems.forEach(function(item) {
	                if (item !== navItem) {
	                    item.style.height = '50px';
	                    item.querySelector('.nav-item-submenu').style.display = 'none';
	                }
	            });

	            // 클릭된 nav-item의 상태 변경
	            const currentHeight = parseInt(getComputedStyle(navItem).height);
	            if (currentHeight === 50) {
	                navItem.style.height = '150px';
	                navItem.querySelector('.nav-item-submenu').style.display = 'inline-block';
	            } else {
	                navItem.style.height = '50px';
	                navItem.querySelector('.nav-item-submenu').style.display = 'none';
	            }
	        });
	    });
	});


	</script>
</body>
</html>