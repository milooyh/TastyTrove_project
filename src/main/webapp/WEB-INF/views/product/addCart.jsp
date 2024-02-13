<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.product-container {
  display: flex;
  flex-direction: column;
}

.product-card {
  display: flex;
  align-items: center;
  background-color: #fff;
  border: 1px solid #ddd;
  margin-bottom: 10px;
  padding: 10px;
}

.product-image img {
  width: 100px; /* 이미지 크기를 조정하세요 */
  height: 100px; /* 이미지 크기를 조정하세요 */
  object-fit: cover;
  margin-right: 15px;
}

.product-info {
  flex-grow: 1;
}

.product-name {
  font-weight: bold;
}

.product-description {
  font-size: 0.8rem;
  color: #666;
}

.product-price {
  color: #E44D26;
  font-weight: bold;
}

.product-quantity-control {
  display: flex;
  align-items: center;
}

.quantity-decrease, .quantity-increase {
  width: 30px;
  height: 30px;
  border: 1px solid #ddd;
  background-color: #f7f7f7;
  color: #333;
}

.quantity-input {
  width: 50px;
  text-align: center;
  margin: 0 5px;
}

.order-summary {
  float: right; /* 혹은 flexbox, grid를 사용해 위치를 정렬하세요 */
  width: 300px; /* 요약 정보 박스 크기 조정 */
  border: 1px solid #ddd;
  padding: 20px;
  background-color: #f9f9f9;
}

.summary-title {
  font-size: 1.2rem;
  font-weight: bold;
  margin-bottom: 10px;
}

.summary-total {
  margin-bottom: 20px;
}

.total-label {
  font-weight: bold;
}

.checkout-button {
  width: 100%;
  padding: 10px;
  background-color: #5cb85c;
  color: white;
  border: none;
  cursor: pointer;
}
</style>
 <script>
        var userId = "<%= session.getAttribute("userId") %>"; // userId 값을 JavaScript 변수에 할당
        var memberId = "<%= session.getAttribute("memberId") %>"; // memberId 값을 JavaScript 변수에 할당
    </script>
<body>
<h1>장바구니</h1>

<%
session.getAttribute("userId");
session.getAttribute("memberId");
%>
<p>사용자 ID: ${userId}</p>
<p>사용자 멤버:${memberId }</p>
 
  <div class="product-container">
    <c:forEach items="${cartItems}" var="item">
        <c:forEach items="${productList}" var="product">
            <c:if test="${product.productName == item.productName}">
                <div class="product-card">
                    <div class="product-image">
                        <img src="${product.uploadFile}" alt="${product.productName}">
                    </div>
                    <div class="product-info">
                        <div class="product-name">상품이름 : ${item.productName}</div>
                        <div class="product-price">상품 가격 : <span class="price-value">${item.productPrice}</span>원</div>
                        <div class="product-quantity">
                            수량: 
                            <button type="button" class="quantity-minus" data-product-id="${item.productId}">-</button>
                            <input type="text" class="quantity-value" data-product-id="${item.productId}" value="${item.productCount}" size="2">
                            <button type="button" class="quantity-plus" data-product-id="${item.productId}">+</button>
                             <!-- 삭제 버튼 추가 -->
    						<button type="button" class="product-delete" data-product-id="${item.productId}">삭제</button>
                        </div>
                    </div>
                </div>
            </c:if>
        </c:forEach>
    </c:forEach>
</div>
<!-- 주문 요약 정보 -->
<div class="order-summary">
  <div class="summary-title">주문 예상 금액</div>
  <div class="summary-total">
    <span class="total-label">총 상품 금액:</span>
    <span class="total-value">0원</span>
  </div>
  <button type="button" class="checkout-button" id="checkoutButton">주문하기</button>
</div>
<script>
//숫자를 3자리 콤마 형식으로 포맷팅하는 함수
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

// 주문 요약 업데이트 함수
function updateOrderSummary() {
    var total = 0;
    document.querySelectorAll('.product-card').forEach(function(card) {
        var priceElement = card.querySelector('.price-value');
        var price = parseInt(priceElement.textContent.replace(/[^0-9]/g, ""), 10);
        var quantityInput = card.querySelector('.quantity-value');
        var quantity = parseInt(quantityInput.value, 10);
        total += price * quantity;
    });
    document.querySelector('.total-value').textContent = numberWithCommas(total) + '원';
}

document.addEventListener('DOMContentLoaded', function() {
    // 초기 총액 계산
    updateOrderSummary();

    // 수량 변경 이벤트 핸들러
    document.querySelectorAll('.quantity-minus, .quantity-plus').forEach(function(button) {
        button.addEventListener('click', function() {
            var quantityInput = this.classList.contains('quantity-minus') ?
                                this.nextElementSibling :
                                this.previousElementSibling;
            var currentValue = parseInt(quantityInput.value, 10);
            if (this.classList.contains('quantity-minus') && currentValue > 1) {
                quantityInput.value = currentValue - 1;
            } else if (this.classList.contains('quantity-plus')) {
                quantityInput.value = currentValue + 1;
            }
            updateOrderSummary();
        });
    });
    
 // 삭제 버튼 이벤트 핸들러
    document.querySelectorAll('.product-delete').forEach(function(button) {
        button.addEventListener('click', function() {
            if (!confirm('이 상품을 장바구니에서 삭제하시겠습니까?')) {
                return; // 취소를 누르면 아무것도 하지 않음
            }
            var productId = this.getAttribute('data-product-id');
            // AJAX 요청으로 서버에 삭제를 요청
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "/deleteCartItem", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onload = function() {
                if (xhr.status === 200) {
                    // 성공적으로 삭제되면 UI에서도 제품을 제거
                    var card = button.closest('.product-card');
                    card.remove();
                    // 총액 업데이트
                    updateOrderSummary();
                } else {
                    // 오류 처리
                    alert('삭제 중 오류가 발생했습니다.');
                }
            };
            xhr.send("productId=" + productId);
        });
    });
});
document.getElementById('checkoutButton').addEventListener('click', function() {
    // 장바구니 아이템 수집
    var cartItems = [];
    document.querySelectorAll('.product-card').forEach(function(card) {
        var productId = card.querySelector('.quantity-value').getAttribute('data-product-id');
        var quantity = parseInt(card.querySelector('.quantity-value').value, 10);
        var price = parseFloat(card.querySelector('.price-value').textContent.replace(/[^0-9.-]+/g, ""));
        
        cartItems.push({
            productId: productId,
            quantity: quantity,
            price: price
        });
    });

    // AJAX 요청 생성 및 전송
    var xhr = new XMLHttpRequest();
    xhr.open('POST', '/order', true); // '/placeOrder'는 주문을 처리할 서버의 URL입니다.
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onload = function() {
        if (xhr.status === 200) {
            // 서버 응답 처리
            alert('주문이 성공적으로 처리되었습니다!');
            window.location.href = '/order';
            // 성공 시 페이지를 새로 고침하거나 사용자를 다른 페이지로 리다이렉트할 수 있습니다.
        } else {
            alert('주문 처리 중 오류가 발생했습니다.');
        }
    };
    xhr.send(JSON.stringify({ userId: userId, items: cartItems })); // userId는 세션에서 가져온 사용자 ID입니다.
});
</script>
</body>
</html>