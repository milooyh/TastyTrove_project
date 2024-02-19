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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/adminHome.css?after"
	type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=56cd7f45575f03b0823b5bb3bfe20b15"></script>
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.10/index.global.min.js'></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
			<button id="logoutbtn" onclick="location.href='/main'">메인</button>
		</div>
	</div>

	<div class="nav">
		<div class="nav-item-menu">menu</div>

		<div class="nav-item member-nav-item">
			회원 관리
			<div class="nav-item-submenu member-nav-item-submenu">
				<div class=submenu-title>
					<a href="/admin/member">회원목록</a>
				</div>
				<div class=submenu-title>
					<a href="/admin/member/search">회원검색</a>
				</div>
				<div class=submenu-title>
					<a href="/admin/member/add">관리자추가</a>
				</div>
			</div>
		</div>



		<div class="nav-item recipe-nav-item">
			레시피게시판 관리
			<div class="nav-item-submenu recipe-nav-item-submenu">
				<div class=submenu-title>
					<a href="/admin/recipeboard">게시판목록</a>
				</div>
				<div class=submenu-title>
					<a href="/admin/recipeboard/search">게시판검색</a>
				</div>
			</div>
		</div>


		<div class="nav-item must-nav-item">
			맛집 관리
			<div class="nav-item-submenu must-nav-item-submenu">
				<div class=submenu-title>
					<a href="/admin/musteatplace">맛집목록</a>
				</div>
				<div class=submenu-title>
					<a href="/admin/musteatplace/search">맛집검색</a>
				</div>
				<div class=submenu-title>
					<a href="/admin/musteatplace/add">맛집추가</a>
				</div>
				
			</div>
		</div>

		<div class="nav-item product-nav-item">
			상품 관리
			<div class="nav-item-submenu product-nav-item-submenu">
				<div class=submenu-title>
					<a href="/admin/product">상품목록</a>
				</div>
				<div class=submenu-title>
					<a href="/admin/product/search">상품검색</a>
				</div>
				<div class=submenu-title>
					<a href="/product">상품수정및삭제</a>
				</div>
			</div>
		</div>

		<div class="nav-item order-nav-item">
			주문 관리
			<div class="nav-item-submenu order-nav-item-submenu">
				<div class=submenu-title>
					<a href="/admin/order">전체주문목록</a>
				</div>
				<div class=submenu-title>
					<a href="/admin/order/search">주문내역검색</a>
				</div>
			</div>
		</div>

		<div class="nav-item payment-nav-item">
			결제 관리
			<div class="nav-item-submenu payment-nav-item-submenu">
				<div class=submenu-title>
					<a href="/admin/payment">결제내역목록</a>
				</div>
				<div class=submenu-title>
					<a href="/admin/payment/search">결제내역검색</a>
				</div>
			</div>
		</div>

		<div class="nav-item delivery-nav-item">
			배송 관리
			<div class="nav-item-submenu delivery-nav-item-submenu">
				<div class=submenu-title>
					<a href="/admin/delivery">배송내역목록</a>
				</div>
				<div class=submenu-title>
					<a href="/admin/delivery/search">배송내역검색</a>
				</div>
			</div>
		</div>
	</div>

	<div class="content">
		<div class="content-nav">
			<div class="content-nav-item">
				<div class="visit-count">
					😉 총 방문자 수
					<div>${visitCount}</div>
				</div>
				<div class=visit-count>
					🧑 회원 수
					<div>${userCount}</div>
				</div>
				<div class=visit-count>
					📃 게시물 수
					<div>${recipeCount}</div>
				</div>
				<div class=visit-count>
					🍕 맛집 수
					<div>${placeCount}</div>
				</div>
				<div class=visit-count>
					🎁 상품 수
					<div>${productCount}</div>
				</div>
				<div class=visit-count>
					💰 총 매출
					<div>${totalAmount}</div>
				</div>
			</div>
			<div class="content-nav-clock">
				<div class="content-clock">
					<span id="clock" />
				</div>

				<div class="saleTable">
					<div class="saleTable-title">월별 매출액</div>
					<table>
						<thead>
							<tr>
								<th>월</th>
								<th>매출액</th>
							</tr>
						</thead>
						
						<tbody id="salesTableBody">
						
						</tbody>
					</table>
				</div>
				
			</div>
		</div>
		<div></div>
		<hr>
		<div class=content-chart>
			<div class=content-chart-item>
				<div class=saleTable-title>유저 타입 별</div>
				<canvas class="userDonutChart" id="userDonutChart" width="200"
					height="200"></canvas>
			</div>
			<div class=content-chart-item>
				<div class=saleTable-title>레시피 게시판 타입 별</div>
				<canvas class="recipeDonutChart" id="recipeDonutChart" width="200"
					height="200"></canvas>
			</div>
			<div class="content-chart-item content-chart-bar">
				<div class=saleTable-title>레시피 작성 순위</div>
				<canvas class="recipeBarChart" id="recipeBarChart" width="200"
					height="200"></canvas>
			</div>
		</div>
		<hr>
		<div class="calendar">
			<div id="calendar"></div>
			<form id="scheduleForm">
				<div class="saleTable-title">일정 등록</div>
				<div class="calendar-content"></div>
				<label for="subject">일정 제목:</label><br> <input type="text"
					id="subject" name="subject"><br> <label
					for="startDate">시작일:</label><br> <input type="date"
					id="startDate" name="startDate"><br> <label
					for="endDate">종료일:</label><br> <input type="date" id="endDate"
					name="endDate"><br> <label for="memo">메모:</label> <br>
				<textarea id="memo" name="memo"></textarea>
				<br> <input type="submit" value="일정 추가">
			</form>
		</div>
		<hr>
		<div class="saleTable-title">맛집 현황</div>
		<div id="map" style="width: 100%; height: 350px;"></div>
	</div>

	<script src="/js/adminHome.js" type="text/javascript"></script>
	<script>
	function logout() {
	    if (confirm("로그아웃하시겠습니까?")) {
	        location.href = '/logout';
	    }
	}
		document.addEventListener(
						"DOMContentLoaded",
						function() {
							const navItems = document
									.querySelectorAll('.nav-item');
							const subMenus = document
									.querySelectorAll('.nav-item-submenu');

							navItems
									.forEach(function(navItem) {
										navItem
												.addEventListener(
														'click',
														function() {
															// 현재 클릭된 nav-item을 제외한 모든 nav-item 초기화
															navItems
																	.forEach(function(
																			item) {
																		if (item !== navItem) {
																			item.style.height = '50px';
																			item
																					.querySelector('.nav-item-submenu').style.display = 'none';
																		}
																	});

															// 클릭된 nav-item의 상태 변경
															const currentHeight = parseInt(getComputedStyle(navItem).height);
															if (currentHeight === 50) {
																navItem.style.height = '150px';
																navItem
																		.querySelector('.nav-item-submenu').style.display = 'inline-block';
															} else {
																navItem.style.height = '50px';
																navItem
																		.querySelector('.nav-item-submenu').style.display = 'none';
															}
														});
									});
						});
		function updateTime() {
			var now = new Date();
			var hours = now.getHours();
			var minutes = now.getMinutes();
			var seconds = now.getSeconds();

			// 시, 분, 초가 한 자리 수일 경우 앞에 0을 붙여 두 자리로 만듭니다.
			hours = ('0' + hours).slice(-2);
			minutes = ('0' + minutes).slice(-2);
			seconds = ('0' + seconds).slice(-2);

			var currentTime = hours + ':' + minutes + ':' + seconds;
			document.getElementById('clock').innerHTML = currentTime;
		}

		// 페이지가 로드될 때마다 시간을 업데이트합니다.
		window.onload = function() {
			updateTime();
			setInterval(updateTime, 1000); // 1초마다 updateTime 함수를 호출하여 시간을 업데이트합니다.
		};
	</script>
</body>
</html>
