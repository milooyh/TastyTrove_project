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
<body>
	<%@include file="../adminHeader.jsp"%>

	<div class="content">
		<div class="content-title">배송 내역 목록</div>
		<hr>
		<div class="content-nav">
			<span>배송관리</span><span> - </span><span><a
				href="/admin/delivery">배송내역목록</a></span><span> - </span><span><a
				href="/admin/delivery/search">배송내역검색</a></span><span>
		</div>

		<table id="memberTable">
			<thead>
				<tr>
					<th style="width:5%">배송번호</th>
					<th style="width:5%">전체주문번호</th>
					<th style="width:15%">배송일시</th>
					<th>배송상태</th>
					<th style="width:20%">배송주소</th>
					<th style="width:10%">배송비</th>
					<th>주문상태수정</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="delivery" items="${deliveryList}">
					<tr>

						<td>${delivery.deliveryId}</td>
						<td><a href="/admin/order/orders?orderId=${delivery.orderId}"
							onmouseover="showTooltip('주문번호별주문내역보기')"
							onmouseout="hideTooltip()">${delivery.orderId}</a></td>
						<td>${delivery.deliveryDate}</td>
						<form action="/admin/delivery/update" method="post">
							<td><select name="deliveryStatus">
									<option value="B"
										<c:if test="${delivery.deliveryStatus == 'B'}">selected</c:if>>
										배송 전</option>
									<option value="D"
										<c:if test="${delivery.deliveryStatus == 'D'}">selected</c:if>>
										배송 중</option>
									<option value="C"
										<c:if test="${delivery.deliveryStatus == 'C'}">selected</c:if>>
										배송 완</option>
							</select></td>
							<td>${delivery.deliveryAddress}</td>
							<td>${delivery.deliveryFee}</td> <input type="hidden"
								name="deliveryId" value="${delivery.deliveryId}">
							<td><button
									onclick="confirmModify('${delivery.deliveryId}')">수정하기</button>
							</td>
						</form>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>
		<div class="pagination">
			<c:if test="${currentPage > 1}">
				<a href="javascript:void(0)" onclick="goToPage(${currentPage - 1})">이전</a>
			</c:if>

			<span>${currentPage} / ${totalPages}</span>

			<c:if test="${currentPage < totalPages}">
				<a href="javascript:void(0)" onclick="goToPage(${currentPage + 1})">다음</a>
			</c:if>
		</div>
	</div>
	<script>
	function goToPage(pageNumber) {
	    location.href = '/admin/delivery?page=' + pageNumber + '&pageSize=${pageSize}';
	}
	
			function confirmModify(deliveryId) {
				var result = confirm("배송상태를 수정할까요?");
				if (result) {
					location.href = '/admin/delivery/update?deliveryId='
							+ deliveryId;
				}
				return result;
			}

			function showTooltip(tooltipText) {
				var tooltip = document.createElement("div"); // 새로운 div 요소를 생성합니다.
				tooltip.textContent = tooltipText; // 툴팁에 표시할 내용을 설정합니다.
				tooltip.classList.add("tooltip"); // CSS 스타일링을 위해 클래스를 추가합니다.

				// 툴팁을 마우스 위치에 위치시킵니다.
				tooltip.style.position = "absolute";
				tooltip.style.top = event.clientY + 10 + "px";
				tooltip.style.left = event.clientX + 10 + "px";
				document.body.appendChild(tooltip); // 툴팁을 문서의 body에 추가합니다.

				// 마우스가 벗어날 때 툴팁을 제거합니다.
				tooltip.addEventListener("mouseout", function() {
					hideTooltip();
				});
			}

			function hideTooltip() {
				var tooltips = document.querySelectorAll(".tooltip");
				tooltips.forEach(function(tooltip) {
					document.body.removeChild(tooltip);
				});
			}
		</script>
</body>
</html>