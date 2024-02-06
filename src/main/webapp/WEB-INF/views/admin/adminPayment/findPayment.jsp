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
	<h1>결제 검색</h1>
	<hr>
	<form>
		<p>검색기준</p>
		<lable><input type="checkbox" name="paymentId">결제번호</lable>
		<lable><input type="checkbox" name="orderId">전체주문번호</lable>
		<lable><input type="text" name="searchKeyword" placeholder="검색어를 입력하세요."></lable><br>
		<lable>결제일시</lable><input type="date" name="paymentDate">
		<lable>결제방법</lable>
		<select name="paymentMethod">
			<option disabled selected>결제방법</option>
			<option value="C">C</option>
			<option value="W">W</option>
		</select>
		<button type="submit">검색하기</button>
	</form>
	<hr>
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
					<td>${payment.orderId}</td>
					<td>${payment.paymentDate}</td>
					<td>${payment.paymentMethod}</td>
					<td>${payment.paymentAmount}</td>
					<td><button>결제정보수정</button>
					<td><button>결제정보삭제</button>
				</tr>
			</c:forEach>
		</tbody>
	</table><br>
	<button onclick="location.href='/admin/payment'">전체결제목룍</button>
	
</body>
</html>