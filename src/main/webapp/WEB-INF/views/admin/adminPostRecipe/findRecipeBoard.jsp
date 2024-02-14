<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/findMember.css?after"
	type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<%@include file="../adminHeader.jsp"%>
	<div class="content">
		<div class="content-title">레시피 목록</div>
		<hr>
		<div class="content-nav">
			<span>레시피게시판관리</span><span> - </span><span><a
				href="/admin/recipeboard">레시피목록</a></span><span> - </span><span><a
				href="/admin/recipeboard/search">레시피검색</a></span>
		</div>
		<hr>
		<table id="searchTable">
			<form>
				<tr>
					<td class="title" colspan="5">검색기준</td>
				</tr>
				<tr>
					<td>선택</td>
					<td><input type="checkbox" name="recipeId"> <lable>
						레시피번호</lable></td>
					<td><input type="checkbox" name="recipeTitle"> <lable>제목</lable></td>
					<td><input type="checkbox" name="recipeContent"> <label>내용</lable></label>
					<td><input type="checkbox" name="memberId"> <lable>
						작성자</lable></td>
				</tr>
				<tr>
					<td>검색어</td>
					<td colspan="8"><input type="text" name="searchKeyword"
						placeholder="검색어를 입력해주세요."> <span id="errorMessage"
						class="error-message">검색어를 입력해주세요.</span></td>
				</tr>
				<tr>
					<td>작성일시</td>
					<td colspan="8"><input type="date" name="boardDate" id="date"></td>
				</tr>

				<tr>
					<td>카테고리</td>
					<td colspan="8"><select name="recipeType">
							<option disabled selected>카테고리</option>
							<option value="KOR">한식</option>
							<option value="CHI">중식</option>
							<option value="JPN">일식</option>
							<option value="WTN">양식</option>
							<option value="DRT">디저트</option>
							<option value="ETC">기타</option>
					</select></td>
				</tr>

				<tr>
					<td colspan="9"
						style="background-color: transparent; text-align: center;">
						<button type="button" id="searchButton" onclick="history.back()">취소</button>
						<button type="submit" id="searchButton">검색하기</button>
					</td>
				</tr>



			</form>
		</table>
		<hr>
		<table id="memberTable">
			<thead>
				<tr>
					<th>레시피번호</th>
					<th>제목</th>
					<th>내용</th>
					<th>작성자</th>
					<th>작성일시</th>
					<th>카테고리</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="recipe" items="${recipeList}">
					<tr>
						<td>${recipe.recipeId}</td>
						<td>${recipe.recipeTitle}</td>
						<td>${fn:substring(recipe.recipeContent, 0, 30)}...</td>

						<td>${recipe.memberId}</td>
						<td>${recipe.boardDate}</td>
						<td><c:choose>
								<c:when test="${recipe.recipeType eq 'KOR'}">한식</c:when>
								<c:when test="${recipe.recipeType eq 'CHI'}">중식</c:when>
								<c:when test="${recipe.recipeType eq 'JPN'}">일식</c:when>
								<c:when test="${recipe.recipeType eq 'WTN'}">양식</c:when>
								<c:when test="${recipe.recipeType eq 'DRT'}">디저트</c:when>
								<c:when test="${recipe.recipeType eq 'ETC'}">기타</c:when>
							</c:choose></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>
		<script>
			document
					.addEventListener(
							'DOMContentLoaded',
							function() {
								// 각 체크박스 요소를 가져옴
								var checkboxes = document
										.querySelectorAll('#searchTable input[type="checkbox"]');

								// 각 체크박스에 이벤트 리스너 추가
								checkboxes.forEach(function(checkbox) {
									checkbox.addEventListener('change',
											function() {
												// 모든 체크박스의 checked 속성을 false로 설정
												checkboxes
														.forEach(function(cb) {
															cb.checked = false;
														});
												// 현재 체크된 체크박스의 checked 속성을 true로 설정
												this.checked = true;
											});
								});
							});
		</script>
</body>
</html>
