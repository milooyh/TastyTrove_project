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
		<div class="content-title">전체 주문 목록</div>
		<hr>
		<div class="content-nav">
			<span>주문관리</span><span> - </span><span><a href="/admin/order">전체주문목록</a></span><span>
				- </span><span><a href="/admin/order/search">주문내역검색</a></span><span>
		</div>
		
		<table>
			<thead>
				<tr>
					<th>전체주문번호</th>
					<th>회원번호</th>
					<th>주문일시</th>
					<th>주문상태</th>
					<th>총계</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="order" items="${orderList}">
					<tr>
						<td><a href="/admin/order/orders?orderId=${order.orderId}"
							onmouseover="showTooltip('주문번호별주문내역보기')"
							onmouseout="hideTooltip()">${order.orderId}</a></td>
						<td><a
							href="/admin/order/orderitem?memberId=${order.memberId}"
							onmouseover="showTooltip('회원별주문내역보기')" onmouseout="hideTooltip()">
								${order.memberId}</a></td>
						<td>${order.orderDate}</td>
						<form action="/admin/order/update" method="post">
							<td><select name="orderStatus">
									<option value="O"
										<c:if test="${order.orderStatus == 'O'}">selected</c:if>>주문완료
										/ 결제 전</option>
									<option value="P"
										<c:if test="${order.orderStatus == 'P'}">selected</c:if>>주문완료
										/ 결제 완료</option>
									<option value="C"
										<c:if test="${order.orderStatus == 'C'}">selected</c:if>>주문취소</option>
							</select></td>
							<td>${order.totalPrice}</td> <input type="hidden" name="orderId"
								value="${order.orderId}" />
							<td><button onclick="confirmModify(${order.orderId})">주문상태수정</button></td>
						</form>
					</tr>
				</c:forEach>

			</tbody>
		</table>
		<br>
		<button onclick="location.href='/admin/order/search'">주문검색</button>
	</div>

	<script>
		function confirmModify(orderId) {
			var result = confirm("주문상태를 수정할까요?");
			if (result) {
				location.href = '/admin/order/update?orderId='
						+ orderId;
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