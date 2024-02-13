<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
        table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<h2>주문 내역</h2>

<table>
    <thead>
        <tr>
            <th>주문 ID</th>
            <th>주문 날짜</th>
            <th>주문 상태</th>
            <th>총 금액</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${orders}" var="order">
            <tr>
                <td>${order.orderId}</td>
                <td>${order.orderDate}</td>
                <td>${order.orderStatus}</td>
                <td>${order.totalPrice}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>