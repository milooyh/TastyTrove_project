<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
body {
    font-family: 'Arial', sans-serif;
    background-color: #f0f0f0;
    margin: 0;
    padding: 20px;
}

h1 {
    text-align: center;
    color: #333;
}

.product-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    margin-top: 20px;
}

.product-card {
    background-color: #fff;
    border: 1px solid #ddd;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    margin: 10px;
    padding: 20px;
    width: calc(33.333% - 20px);
    box-sizing: border-box;
    border-radius: 10px;
    transition: transform 0.3s ease-in-out;
}

.product-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 4px 8px rgba(0,0,0,0.2);
}

.product-image img {
    max-width: 100%;
    height: auto;
    border-radius: 5px;
    margin-bottom: 15px;
}

.product-info h3, .product-info p {
    margin: 5px 0;
}

.product-info {
    color: #555;
}

button {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 10px 15px;
    margin: 5px 0;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

button:hover {
    background-color: #0056b3;
}

.add-product-btn {
    display: block;
    width: 200px;
    margin: 20px auto;
}
</style>
</head>
<body>
    <h1>상품 목록 페이지</h1>
    <div class="product-container">
        <c:forEach items="${productList}" var="product">
            <div class="product-card">
                <div class="product-image">
                    <img src="${product.uploadFile}" alt="${product.productName}">
                </div>
                <div class="product-info">
                    <h3>상품이름 : ${product.productName}</h3>
                    <p>상품내용 : ${product.productContent}</p>
                    <p>가격 : <span class="product-price">${product.productPrice}</span></p>
					<p>재고 : <span class="product-count">${product.productCount}</span></p>
                  	
                    <p>뷰 타입: <c:choose>
                                    <c:when test="${product.viewType == 'OCN'}">밀키트</c:when>
                                    <c:when test="${product.viewType == 'CTY'}">제품</c:when>
                                    <c:when test="${product.viewType == 'MOT'}">재료</c:when>
                                    <c:otherwise>없음</c:otherwise>
                                </c:choose>
                    </p>
                    <button onclick="location.href='/modifyProduct?productId=${product.productId}'">수정</button>
                    <button class="btn_removeRoom" data-productid="${product.productId}">삭제</button>
                </div>
            </div>
        </c:forEach>
    </div>
    <button class="add-product-btn" onclick="location.href='/productwrite'">상품 추가하기</button>

    <script>
    let removeBtns = document.querySelectorAll('.btn_removeRoom');

    removeBtns.forEach(function(item){
        item.addEventListener('click', (e)=>{
            
            let productId = e.target.dataset.productid;
            
            // "정말 삭제하시겠습니까?" 확인 대화 상자 표시
            let confirmDelete = confirm("정말 삭제하시겠습니까?");
            
            if (confirmDelete) {
                // 사용자가 '확인'을 클릭한 경우
                location.href='/removeProduct?productId=' + productId;
            }
        });
    })
    
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

document.addEventListener('DOMContentLoaded', function() {
    // 상품 가격 정보를 포맷팅
    document.querySelectorAll('.product-price').forEach(function(element) {
        var text = element.textContent.replace(/원/g, "").trim();
        element.textContent = numberWithCommas(text) + '원';
    });

    // 상품 재고 정보를 포맷팅
    document.querySelectorAll('.product-count').forEach(function(element) {
        var text = element.textContent.replace(/개/g, "").trim();
        element.textContent = numberWithCommas(text) + '개';
    });
});
    </script>
</body>
</html>