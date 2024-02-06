<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modify Member</title>
</head>
<body>
    <h1>레시피 게시물 정보 수정</h1>
    
    <form:form method="post" action="/admin/recipeboard/update">
        <input type="hidden" name="recipeId" value="${user.memberId}" />
        
        <label for="userId">아이디:</label>
        <input type="text" id="userId" name="userId" value="${user.userId}" /><br>
        
        <label for="userPassword">비밀번호:</label>
        <input type="password" id="userPassword" name="userPassword" value="${user.userPassword}" /><br>
        
        <label for="userName">이름:</label>
        <input type="text" id="userName" name="userName" value="${user.userName}" /><br>
        
        <label for="userNickname">별명:</label>
        <input type="text" id="userNickname" name="userNickname" value="${user.userNickname}" /><br>
        
        <label for="userBirthdate">생년월일:</label>
        <input type="text" id="userBirthdate" name="userBirthdate" value="${user.userBirthdate}" /><br>
        
        <label for="userAddress">주소:</label>
        <input type="text" id="userAddress" name="userAddress" value="${user.userAddress}" /><br>
        
        <label for="userEmail">이메일:</label>
        <input type="text" id="userEmail" name="userEmail" value="${user.userEmail}" /><br>
        
        <input type="submit" value="수정" />
    </form:form>
    
    <br>
    <button onclick="location.href='/admin/member'">뒤로 가기</button>
</body>
</html>
