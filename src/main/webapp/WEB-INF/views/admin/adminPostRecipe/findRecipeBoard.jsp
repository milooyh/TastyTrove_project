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
	<h1>레시피 게시물 검색</h1>
	<hr>
	<form>
		<p>검색기준</p>
		<lable>
		<input type="checkbox" name="recipeId">레시피번호</lable>
		<lable>
		<input type="checkbox" name="recipeTitle">제목</lable>
		<lable>
		<input type="checkbox" name="recipeContent">내용</lable>
		<lable>
		<input type="checkbox" name="memberId">작성자</lable>
		<label><input type="text" name="searchKeyword"
			placeholder="검색어를 입력하세요."></label><br> <label>작성일시</label><input
			type="date" name="boardDate"> <label>카테고리</label> <select
			name="recipeType">
			<option disabled selected>카테고리</option>
			<option value="KOR">한식</option>
			<option value="CHI">중식</option>
			<option value="JPN">일식</option>
			<option value="WTN">양식</option>
			<option value="DRT">디저트</option>
			<option value="ETC">기타</option>
		</select>

		<button type="submit">검색하기</button>
	</form>
	<hr>
	<table>
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
					<td>${recipe.recipeContent}</td>
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
	<button onclick="location.href='/admin/recipeboard'">전체레시피게시물목록</button>

	<script>
		function trimContent(content){
			if(content.length > 30){
				return content.substr(0, 30) + ' ...';
			}			
			return content;
		}
	</script>

</body>
</html>
