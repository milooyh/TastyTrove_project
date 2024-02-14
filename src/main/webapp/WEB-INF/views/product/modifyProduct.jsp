<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f5f5f5;
        margin: 0;
        padding: 20px;
    }
    h1 {
        color: #333;
    }
    form {
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        max-width: 500px;
        margin: 20px auto;
    }
    label {
        display: block;
        margin: 10px 0 5px;
    }
    input[type="text"],
    input[type="file"],
    select {
        width: 100%;
        padding: 8px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    button {
        background-color: #6aafe6; 
        color: white;
        padding: 10px 20px;
        margin: 20px 0;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    button:hover {
        background-color: #0056b3;
    }
    .form-group {
        margin-bottom: 15px;
    }
    </style>
</head>
<body>

<%@include file="../main/header.jsp"%>
	
	<form action="/modifyProduct" method="post" enctype="multipart/form-data">
    <input type="hidden" name="productId" value="${product.productId}"> 
    <div class="form-group">
        <label>상품이름:</label>
        <input type="text" name="productName" value="${product.productName}">
    </div>
    <div class="form-group">
        <label>상품설명:</label>
        <input type="text" name="productContent" value="${product.productContent}">
    </div>
    <div class="form-group">
        <label>상품가격:</label>
        <input type="text" name="productPrice" value="${product.productPrice}">
    </div>
    <div class="form-group">
        <label>상품개수:</label>
        <input type="text" name="productCount" value="${product.productCount}">
    </div>
    <div class="form-group">
        <label>파일업로드:</label>
        <input type="file" name="uploadFile">
    </div>
    <div class="form-group">
        <!-- 파일 업로드 시, 기존 파일 경로 또는 이름을 서버에 전달하려면 아래 hidden 필드를 사용합니다. -->
        <input type="hidden" name="uploadFile" value="${product.uploadFile}"> 
    </div>
    <div class="form-group">
        <label>뷰 타입 선택:</label>
        <select name="viewType">
            <option value="OCN" <c:if test="${product.viewType == 'OCN'}">selected</c:if>>밀키트</option>
            <option value="CTY" <c:if test="${product.viewType == 'CTY'}">selected</c:if>>제품</option>
            <option value="MOT" <c:if test="${product.viewType == 'MOT'}">selected</c:if>>재료</option>
        </select>
    </div>
    <button type="submit">수정하기</button>
</form>
<%@include file="../main/footer.jsp"%>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // 상품 가격 입력 필드에 이벤트 리스너 추가
    document.querySelector('input[name="productPrice"]').addEventListener('input', function(e) {
        this.value = numberWithCommas(this.value);
    });

    // 상품 개수 입력 필드에 이벤트 리스너 추가
    document.querySelector('input[name="productCount"]').addEventListener('input', function(e) {
        this.value = numberWithCommas(this.value);
    });

    // 숫자에 3자리마다 쉼표를 추가하는 함수
    function numberWithCommas(x) {
        return x.replace(/\D/g, '').replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }
});
</script>
		
	
</body>
</html>