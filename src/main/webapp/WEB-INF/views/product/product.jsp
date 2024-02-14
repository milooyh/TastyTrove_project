<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
* {
		margin: 0px;
		padding: 0px;
		box-sizing: border-box;
	}
body {
    font-family: 'Arial', sans-serif;
    background-color:#F0F0F0; 
    margin: 0;
   <!-- padding: 20px;-->
}

h1 {
    text-align: center;
    color: #333;
}

.product-container {
    display: flex;
    flex-wrap: wrap;
  <!--  justify-content: center;-->
    margin-top: 20px;
    justify-content: flex-start;
}

.product-card {
    background-color: #fff;
    border: 1px solid #6aafe6;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    margin: 10px;
    padding: 20px;
    width: calc(25% - 20px);
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
    background-color: #6aafe6;
    color: white;
    border: none;
    padding: 10px 15px;
    margin: 5px 0;
    border-radius: 30px;
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
<%@include file="../main/header.jsp"%>

<body>

<%
	session.getAttribute("userId");
    String userId = (String) session.getAttribute("userId");
    String userType = (String) session.getAttribute("userType"); // 세션에서 userType 가져오기

    if (userId == null) {
        // 로그인하지 않았으면 로그인 페이지로 리다이렉트
        response.sendRedirect("login");
    } else {
      //  out.println("<h1>Welcome, " + userId + "</h1>");
        
        // 사용자 유형에 따라 다른 메시지 또는 콘텐츠를 표시
        if ("ADMIN".equals(userType)) {
            // 관리자용 콘텐츠
            out.println("<h2>Admin Dashboard</h2>");
            // 관리자 전용 콘텐츠 및 링크 표시
        } else if ("CUSTOMER".equals(userType)) {
            // 일반 사용자용 콘텐츠
            out.println("<h2>Product List</h2>");
            // 상품 목록 표시 로직
        }
    }
%>
<% if("admin_1".equals(userId)) { %>
    <button class="add-product-btn" onclick="location.href='/productwrite'">상품 추가하기</button>
	<% } %>
	
	<!--  <% if(!"admin_1".equals(userId)) { %>
		    <button onclick="location.href='/cart'">장바구니</button>
		<% } %> -->
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
                   
                </div>
                <!-- 조건부로 버튼 표시: admin_1일 때만 수정, 삭제, 상품 추가하기 버튼 표시 -->
            <% if("admin_1".equals(userId)) { %>
                <button onclick="location.href='/modifyProduct?productId=${product.productId}'">수정</button>
                <button class="btn_removeRoom" data-productid="${product.productId}">삭제</button>
                
            <% } else { %>
                <!-- 다른 아이디로 로그인했을 때는 담기 버튼만 보여줌 -->
              <!--   <button onclick="location.href='/addProductToCart?productId=${product.productId}'">담기</button> -->
           		<!-- 담비거튼액션 수정 -->
           		<!-- <form action="/addToCart" method="post"> -->
           		<form action="/addToCart" method="post"  onsubmit="event.preventDefault(); confirmAddToCart(this);">
				    <input type="hidden" name="productId" value="${product.productId}" />
				    <input type="hidden" name="productName" value="${product.productName}" />
				    <input type="hidden" name="productPrice" value="${product.productPrice}" />
				    <input type="hidden" name="productCount" value="1" /> <!-- 예시로 수량 1을 설정 -->
				    <button type="submit">담기</button>
				</form>
				
            <% } %>
                
            </div>
        </c:forEach>
        <!-- <button  onclick="location.href='/addToCart'">장바구니</button> -->
       <!--  <button  onclick="location.href='/cart'">장바구니</button> --> 
        
    </div>
    
    
    
    
	
	<%@include file="../main/footer.jsp"%>
    <script>
    //담기 함수
    function confirmAddToCart(form) {
        if (confirm('담으시겠습니까?')) {
            // AJAX 요청을 설정합니다.
            var xhr = new XMLHttpRequest();
            xhr.open(form.method, form.action, true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    var status = xhr.status;
                    if (status === 0 || (status >= 200 && status < 400)) {
                        // 요청이 성공적으로 완료되었을 때
                        // 서버로부터의 응답을 처리합니다.
                        if(xhr.responseText === 'success') {
                            alert('담겼습니다.');
                        } else if(xhr.responseText === 'duplicate') {
                            alert('중복된 상품입니다.');
                        }
                    } else {
                        // 오류를 처리합니다.
                        alert('장바구니에 담는 도중 오류가 발생했습니다.');
                    }
                }
            };
            
            // 폼 데이터를 인코딩합니다.
            var formData = new FormData(form);
            var encodedData = '';
            for (var [key, value] of formData.entries()) {
                encodedData += encodeURIComponent(key) + '=' + encodeURIComponent(value) + '&';
            }
            encodedData = encodedData.substring(0, encodedData.length - 1); // 마지막 & 제거
            
            // 요청을 전송합니다.
            xhr.send(encodedData);
        }
    }
    //
    
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