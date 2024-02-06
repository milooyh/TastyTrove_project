<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>메뉴 삭제 페이지</h1>

	
	<c:forEach var="mustEatPlaceMenuItem" items="${mustEatPlaceMenu}">
		<input type="hidden" name="menuId" value="${mustEatPlaceMenuItem.menuId}">
		메뉴 : <input type="text" name="menuName" value="${mustEatPlaceMenuItem.menuName}">
		가격 : <input type="number" name="price" value="${mustEatPlaceMenuItem.price}">
		<button onclick="removeMenu('${mustEatPlaceMenuItem.menuName}')">삭제하기</button><br>
	</c:forEach>
	
	
	<script>
	
	function removeMenu(menuName){
		if(confirm("정말 삭제하시겠습니까?")){
			//확인을 눌렀다
			console.log('삭제 확인 누름');
			console.log('넘어온 id 값 : ' + menuName);
			location.href='/must/removeMenu?menuName=' + menuName;
		}	
		//취소 누르면 아무것도 안함
	}
	</script>
</body>
</html>