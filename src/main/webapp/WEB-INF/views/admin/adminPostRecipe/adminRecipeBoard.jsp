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
	<h1>레시피 게시물 목록</h1>
	<a href="/admin/member">회원관리</a>
	<br>
	<a href="/admin/musteatplace">맛집관리</a>
	<br>
	<a href="/admin/product">상품관리</a>
	<br>
	<a href="/admin/order">주문관리</a>
	<br>
	<a href="/admin/payment">결제관리</a>
	<br>
	<a href="/admin/delivery">배송관리</a>
	<br>
	<hr>
	<table>
		<thead>
			<tr>
				<th>레시피번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일시</th>
				<th>카테고리</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="recipe" items="${postRecipeList}">
				<tr>
					<td>${recipe.recipeId}</td>
					<td><a
						href="/admin/recipeboard/content?recipeId=${recipe.recipeId}">${recipe.recipeTitle}</a></td>
					<td>${recipe.memberId}</td>
					<td>${recipe.boardDate}</td>
					<form method="post" action="/admin/recipeboard/update/recipeType">
					<td><select name="selectedRecipeType">
							<c:forEach var="category" items="${allRecipeTypes}">
								<option ${recipe.recipeType eq category ? 'selected' : ''}>${category}</option>
							</c:forEach>
					</select></td>
					<input type="hidden" name="recipeId" value="${recipe.recipeId}" />
					<td><button type="submit"
							onclick="confirmModify(${recipe.recipeId})">카테고리수정</button></td>
					</form>

					<form method="get" action="/admin/recipe/remove">
						<input type="hidden" name="recipeId" value="${recipe.recipeId}" />
						<td><button type="submit">레시피정보삭제</button></td>
					</form>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>

	<script>
    function confirmModify(recipeId) {
        var result = confirm("카테고리를 수정할까요?");
        if (result) {
            location.href = '/admin/recipeboard/update/recipeType?recipeId=' + recipeId;
        }
        return result; // true면 submit 진행, false면 중단
    }

    function confirmDelete(recipeId) {
        var result = confirm("정말 삭제하시겠습니까?");
        if (result) {
            location.href = '/admin/recipeboard/remove?recipeId=' + recipeId;
        }
    }
</script>

</body>
</html>
