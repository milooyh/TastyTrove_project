<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modify Member</title>
</head>
<body>
    <h1>개별 주문 정보 수정</h1>
    
    <form:form method="post" action="/admin/order/orderitem/update">
    <input type="hidden" name="orderItemId" value="${orderItem.orderItemId}" />
    <label for="orderItemCount">주문개수:</label>
    <input type="text" id="orderItemCount" name="orderItemCount" value="${orderItem.orderItemCount}" /><br>
    <input type="submit" value="수정" />
</form:form>

    <br>
    <button onclick="location.href='/admin/order/orderitem?memberId=${orderItem.memberId}'">뒤로 가기</button>
</body>
</html>
