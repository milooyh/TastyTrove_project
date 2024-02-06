<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품 목록 페이지</title>
<style>
body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        padding: 20px;
    }
    h1 {
        color: #333;
    }
    form {
        background-color: #ffffff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .form-row {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 10px;
    }
    .form-row > div {
        flex-basis: 48%; /* Adjusts the base size of each div to fill the row */
    }
    label {
        display: block;
        margin-bottom: 5px;
        color: #666;
    }
    input[type="text"],
    input[type="file"],
    select {
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        border-radius: 5px;
        border: 1px solid #ddd;
        box-sizing: border-box;
    }
    button {
        background-color: #5cb85c;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        display: block; /* Makes the button fill the width */
    }
    button:hover {
        background-color: #4cae4c;
    }
</style>
</head>
<body>
	
     <h1>상품 등록 페이지</h1>
    <form action="<c:url value='/productwrite'/>" method="post" enctype="multipart/form-data">
        <label>상품이름:</label>
        <input type="text" name="productName"><br>
        <label>상품설명:</label>
        <input type="text" name="productContent"><br>
        <label>상품 가격:</label>
        <input type="text" name="productPrice"  maxlength="10" placeholder="숫자만입력해주세요"><br>
        <label>상품개수:</label>
        <input type="text" name="productCount"  maxlength="3" placeholder="3자리수만입력가능합니다."><br>
        
        <label>파일:</label>
        <input type="file" name="uploadFile" accept="image/*"><br>
        
        <label>뷰 타입 선택:</label>
        <select name="viewType">
            <option value="OCN">밀키트</option>
            <option value="CTY">제품</option>
            <option value="MOT">재료</option>
        </select><br>
        
        <button type="submit">상품 등록</button>
    </form>
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