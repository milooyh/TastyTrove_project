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
		<div class="content-title">결제 내역 목록</div>
		<hr>
		<div class="content-nav">
			<span>결제관리</span><span> - </span><span><a
				href="/admin/payment">결제내역목록</a></span><span> - </span><span><a
				href="/admin/payment/search">결제내역검색</a></span><span>
		</div>

		<table>
			<thead>
				<tr>
					<th>결제번호</th>
					<th>전체주문번호</th>
					<th>결제일시</th>
					<th>결제방법</th>
					<th>총계</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="payment" items="${paymentList}">
					<tr>

						<td>${payment.paymentId}</td>
						<td><a href="/admin/order/orders?orderId=${payment.orderId}"
							onmouseover="showTooltip('주문번호별주문내역보기')"
							onmouseout="hideTooltip()">${payment.orderId}</a></td>
						<td>${payment.paymentDate}</td>
						<form action="/admin/payment/update" method="post">
							<td><select name="paymentMethod">
									<option value="C"
										<c:if test="${payment.paymentMethod == 'C'}">selected</c:if>>
										카드</option>
									<option value="W"
										<c:if test="${payment.paymentMethod == 'W'}">selected</c:if>>
										계좌이체</option>
							</select></td>
							<td>${payment.paymentAmount}</td> <input type="hidden"
								name="paymentId" value="${payment.paymentId}">
							<td><button onclick="confirmModify(${payment.paymentId})'">결제방법수정</button></td>
					</tr>
					</form>
				</c:forEach>
			</tbody>
		</table>
		<br>
		<button onclick="location.href='/admin/payment/search'">결제내역검색</button>
		<script>
    function confirmModify(paymentId) {
        var result = confirm("결제방법을 수정할까요?");
        if (result) {
            location.href = '/admin/payment/update?paymentId=' + paymentId;
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