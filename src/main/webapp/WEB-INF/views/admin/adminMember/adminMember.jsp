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
		<div class="content-title">회원 목록</div>
		<hr>
		<div class="content-nav">
			<span>회원관리</span><span> - </span><span><a href="/admin/member">회원목록</a></span><span>
				- </span><span><a href="/admin/member/search">회원검색</a></span><span>
				- </span><span><a href="/admin/member/add">관리자추가</a></span>
		</div>
		<table id="memberTable">
			<thead>
				<tr>
					<th>회원번호</th>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이름</th>
					<th>유형</th>
					<th>회원정보수정</th>
					<th>회원정보삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${userList}">
					<tr class="member-row" data-member-id="${user.memberId}">
						<td style="cursor: pointer">${user.memberId}</td>
						<td>${user.userId}</td>
						<td>${user.userPassword}</td>
						<td>${user.userName}</td>
						<td>${user.userType}</td>
						<td>
							<form method="get" action="/admin/member/update">
								<input type="hidden" name="memberId" value="${user.memberId}" />
								<button type="submit"
									onclick="location.href = '/admin/member/update?memberId=' + memberId">수정하기</button>
							</form>
						</td>
						<td>

							<button type="submit" onclick="confirmDelete(${memberId})">삭제하기</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<br>

		<div class="pagination">
			<c:if test="${currentPage > 1}">
				<a href="javascript:void(0)" onclick="goToPage(${currentPage - 1})">이전</a>
			</c:if>

			<span>${currentPage} / ${totalPages}</span>

			<c:if test="${currentPage < totalPages}">
				<a href="javascript:void(0)" onclick="goToPage(${currentPage + 1})">다음</a>
			</c:if>
		</div>

	</div>

	<!-- 모달창 -->
	<div id="memberModal" class="modal">
		<div class="modal-content">
			<div class="modal-title">회원상세정보</div>
			<span class="close">&times;</span>
			<div id="memberDetails">
				<!-- 회원 상세 정보를 표시할 테이블 -->
				<div class="memberProfile">
					<img src="/image/memberProfile.jpg" class="memberImg">
					<div class="memberInfo">
						<h2 id="userName">회원 이름</h2>
						<p id="userNickname">별명</p>
					</div>
				</div>
				<hr>
				<table id="memberTable" class="modalTable">
					<tbody>
						<tr>
							<td><strong>생년월일:</strong> <span id="userBirthdate"></span></td>
						</tr>
						<tr>
							<td><strong>전화번호:</strong> <span id="userTel"></span></td>
						</tr>
						<tr>
							<td><strong>주소:</strong> <span id="userAddress"></span></td>
						</tr>
						<tr>
							<td><strong>이메일:</strong> <span id="userEmail"></span></td>
						</tr>
					</tbody>
				</table>

			</div>
		</div>
	</div>




	<script>
	function goToPage(pageNumber) {
	    location.href = '/admin/member?page=' + pageNumber + '&pageSize=${pageSize}';
	}

    function confirmDelete(memberId) {
        var result = confirm("정말 삭제하시겠습니까?");
        if (result === true) {
            location.href = '/admin/member/remove?memberId=' + memberId;
            return result;
        }
        
       
     }

		// 모달창 닫기 버튼 기능 구현
		var modal = document.getElementById('memberModal');
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

		 // 모달창 열기 함수
	    function openMemberModal(memberId) {
	        var modal = document.getElementById('memberModal');
	        modal.style.display = "block";

	        // AJAX 요청을 통해 회원 상세 정보 가져오기
	        $.ajax({
	            url: '/admin/member/details',
	            type: 'GET',
	            data: {
	                memberId: memberId
	            },
	            success: function (user) {
	                // 성공 시 처리
	                console.log("success");
	                // 서버에서 받은 회원 정보를 사용하여 각 요소에 값을 넣어줌
	                document.getElementById('userName').textContent = user.userName;
	                document.getElementById('userNickname').textContent = user.userNickname;
	                document.getElementById('userBirthdate').textContent = user.userBirthdate;
	                document.getElementById('userTel').textContent = user.userTel;
	                document.getElementById('userAddress').textContent = user.userAddress;
	                document.getElementById('userEmail').textContent = user.userEmail;
	            },
	            error: function (xhr, status, error) {
	                console.error("AJAX 오류: ", status, error);
	            }
	        });

	    }

	    // 테이블의 각 회원번호를 클릭했을 때 모달창 열기
	    var memberIdCells = document.querySelectorAll(".member-row td:first-child");
	    memberIdCells.forEach(function (cell) {
	        cell.addEventListener("click", function () {
	        	var memberId = this.textContent;
	            openMemberModal(memberId);
	        });

	        // 툴팁 추가
	        cell.addEventListener("mouseover", function (event) {
	            var tooltip = document.createElement("div");
	            tooltip.textContent = "회원상세정보보기";
	            tooltip.classList.add("tooltip");

	            // 툴팁을 마우스 위치에 위치시킵니다.
	            tooltip.style.position = "absolute";
	            tooltip.style.top = event.clientY + 10 + "px";
	            tooltip.style.left = event.clientX + 10 + "px";

	            document.body.appendChild(tooltip);

	            // 마우스가 벗어날 때 툴팁을 제거합니다.
	            cell.addEventListener("mouseout", function () {
	                document.body.removeChild(tooltip);
	            });
	        });
	    });

	    // 모달창 닫기 버튼 기능 구현
	    var closeButton = document.querySelector(".close");
	    closeButton.addEventListener("click", function () {
	        var modal = document.getElementById('memberModal');
	        modal.style.display = "none";
	    });

	    // ESC 키를 눌렀을 때 모달창 닫기
	    window.addEventListener("keydown", function (event) {
	        if (event.key === "Escape") {
	            var modal = document.getElementById('memberModal');
	            modal.style.display = "none";
	        }
	    });
	</script>
</body>
</html>