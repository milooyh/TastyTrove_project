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
	<h1>배송 검색</h1>
	<hr>
	<form>
		<p>검색기준</p>
		<lable> <input type="checkbox" name="deliveryId">배송번호</lable>
		<lable> <input type="checkbox" name="orderId">전체주문번호</lable>
		<label><input type="text" name="searchKeyword"
			placeholder="검색어를 입력하세요."></label><br>


		<lable>배송일시</lable>
		<input type="date" name="deliveryDate">
		<lable>주소</lable>
		<select name="addressSystem">
			<option disabled selected>행정도시</option>
			<option value="서울특별시">서울특별시</option>
			<option value="부산광역시">부산광역시</option>
			<option value="대구광역시">대구광역시</option>
			<option value="인천광역시">인천광역시</option>
			<option value="광주광역시">광주광역시</option>
			<option value="대전광역시">대전광역시</option>
			<option value="울산광역시">울산광역시</option>
			<option value="세종특별자치시">세종특별자치시</option>
			<option value="경기도">경기도</option>
			<option value="강원특별자치도">강원특별자치도</option>
			<option value="충청북도">충청북도</option>
			<option value="충청남도">충청남도</option>
			<option value="전북특별자치도">전북특별자치도</option>
			<option value="전라남도">전라남도</option>
			<option value="경상북도">경상북도</option>
			<option value="경상남도">경상남도</option>
			<option value="제주특별자치도">제주특별자치도</option>
		</select><br> 
		
		<label>배송상태</label> <select name="deliveryStatus">
			<option disabled selected>배송상태</option>
			<option value="B">B</option>
			<option value="D">D</option>
			<option value="C">C</option>
		</select>
		
		 <label>배송비</label> <select name="deliveryFee">
			<option disabled selected>배송비</option>
			<option value="7500">7500</option>
			<option value="4500">4500</option>
		</select>

		<button type="submit">검색하기</button>
	</form>
	<hr>
	<table>
		<thead>
			<tr>
				<th>배송번호</th>
				<th>전제주문번호</th>
				<th>배송일시</th>
				<th>배송지</th>
				<th>배송비</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="delivery" items="${deliveryList}">
				<tr>
					<td>${delivery.deliveryId}</td>
					<td>${delivery.orderId}</td>
					<td>${delivery.deliveryDate}</td>
					<td>${delivery.deliveryStatus}</td>
					<td>${delivery.deliveryAddress}</td>
					<td>${delivery.deliveryFee}</td>
					<td><button>배송정보수정</button>
					<td><button>배송정보삭제</button>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	<button onclick="location.href='/admin/delivery'">전체배송목록</button>

</body>
</html>