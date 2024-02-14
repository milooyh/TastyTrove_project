<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/adminMember.css?after"
	type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
	<%@include file="../adminHeader.jsp"%>

	<div class="content">
		<div class="content-title">맛집 목록</div>
		<hr>
		<div class="content-nav">
			<span>맛집관리</span><span> - </span><span><a
				href="/admin/musteatplace">맛집목록</a></span><span> - </span><span><a
				href="/admin/musteatplace/search">맛집검색</a></span><span> - </span><span><a
				href="/admin/musteatplace/add">맛집추가</a></span>
		</div>
		<table id="memberTable">
			<thead>
				<tr>
					<th style="width:1%">맛집번호</th>
					<th>맛집명</th>
					<th style="width:10%">주소</th>
					<th>평균별점</th>
					<th style="width:10%">전화번호</th>
					<th>오픈시간</th>
					<th>마감시간</th>
					<th>유형</th>
					<th style="width:10%">맛집정보수정</th>
					<th style="width:10%">맛집삭제</th>
					<th style="width:10%">이미지추가</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="place" items="${placeList}">
					<tr>
						<td>${place.id}</td>
						<td>${place.restaurantName}</td>
						<td>${place.place}</td>
						<td>${place.rating}</td>
						<td>${place.telephoneNumber}</td>
						<td>${place.openingHours}</td>
						<td>${place.closingHours}</td>
						<td>${place.type}</td>
						<td><button
								onclick="location.href='/admin/musteatplace/update?id=${place.id}'">수정하기</button></td>
						<td><button onclick="confirmDelete(${place.id})">삭제하기</button></td>
						<td><button onclick="location.href='/admin/musteatplace/upload?id=${place.id}'">추가하기</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>

		<!-- 모달창 -->
		<div id="mustModal" class="modal">
			<div class="modal-content">
				<div class="modal-title">맛집 리뷰 목록</div>
				<span class="close">&times;</span>
				<div id="review">${place.review}</div>
			</div>
		</div>
		<script>
		function confirmDelete(id) {
			var result = confirm("맛집 정보를 삭제하시겠습니까?");

			if (result) {
				location.href = '/admin/musteatplace/remove?id=' + id;
			}
		}
		
		// 모달창 닫기 버튼 기능 구현
		var modal = document.getElementById('mustModal');
		var closeButton = document.getElementsByClassName("close")[0];
		closeButton.onclick = function() {
			modal.style.display = "none";
		}

		// ESC 키를 눌렀을 때 모달창 닫기
		window.addEventListener("keydown", function(event) {
			if (event.key === "Escape") {
				modal.style.display = "none";
			}
		});

		// 테이블의 각 맛집명을 클릭했을 때 모달창 열기
		var restaurantnameCells = document.querySelectorAll(".content table tbody tr td:nth-child(2)");
		restaurantnameCells.forEach(function(cell) {
		    cell.addEventListener("click", function() {
		        var id = this.parentNode.firstChild.textContent; // 클릭한 행의 첫 번째 열(맛집번호)의 값을 가져옵니다.
		        openMemberModal(id);
		    });
		    // 툴팁 추가
		    cell.addEventListener("mouseover", function(event) {
		        var tooltip = document.createElement("div"); // 새로운 div 요소를 생성합니다.
		        tooltip.textContent = "맛집리뷰보기"; // 툴팁에 표시할 내용을 설정합니다.
		        tooltip.classList.add("tooltip"); // CSS 스타일링을 위해 클래스를 추가합니다.

		        // 툴팁을 마우스 위치에 위치시킵니다.
		        tooltip.style.position = "absolute";
		        tooltip.style.top = event.clientY + 10 + "px";
		        tooltip.style.left = event.clientX + 10 + "px";

		        document.body.appendChild(tooltip); // 툴팁을 문서의 body에 추가합니다.

		        // 마우스가 벗어날 때 툴팁을 제거합니다.
		        cell.addEventListener("mouseout", function() {
		            if (tooltip.parentNode) {
		                document.body.removeChild(tooltip); // 툴팁을 제거합니다.
		            }
		        });

		    });
		});


		// 모달창 열기 함수
		function openMemberModal(id) {
		    console.log("openMemberModal 함수 호출 !!");
		    var modal = document.getElementById('mustModal');
		    modal.style.display = "block";

		    console.log("모달창 열림");

		    // AJAX 요청을 통해 회원 상세 정보 가져오기
		    $.ajax({
		        url: '/admin/musteatplace/details',
		        type: 'GET',
		        data: {
		            id: id // 맛집 번호를 매개변수로 전달
		        },
		        success: function(mustEatPlace) {
		            console.log(mustEatPlace);
		            document.getElementById('review').textContent = mustEatPlace.review;
		        },
		        error: function(error) {
		            console.error(error);
		        }
		    });
		}

	</script>
</body>
</html>