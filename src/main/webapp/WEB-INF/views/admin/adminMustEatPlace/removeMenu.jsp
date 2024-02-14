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
	<c:forEach var="mustEatPlaceMenuItem" items="${mustEatPlaceMenu}">
        <div class="deleteMenu" style="display: flex; justify-content: center;">
            <input type="hidden" name="menuId" value="${mustEatPlaceMenuItem.id}">
            메뉴 : <input type="text" name="menuName" value="${mustEatPlaceMenuItem.menuName}" readonly>
            가격 : <input type="number" name="price" value="${mustEatPlaceMenuItem.price}" readonly>
            <button class="btn btn-sm" onclick="removeMenu('${mustEatPlaceMenuItem.menuName}')">삭제하기</button><br>
        </div>
    </c:forEach>
    
    <script>
	
	function removeMenu(menuName){
		if(confirm("정말 삭제하시겠습니까?")){
			//확인을 눌렀다
			console.log('삭제 확인 누름');
			console.log('넘어온 id 값 : ' + menuName);
			location.href='/admin/musteatplace/reomoveMenuName?menuName=' + menuName;
		}	
		//취소 누르면 아무것도 안함
	}
	</script>
</body>
</html>