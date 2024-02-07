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
			<span>회원관리</span><span> - </span><span><a
				href="/admin/member">회원목록</a></span><span> - </span><span><a
				href="/admin/member/search">회원검색</a></span><span> - </span><span><a
				href="/admin/member/add">관리자추가</a></span>
		</div>
		<table id="memberTable">
			<thead>
				<tr>
					<th>회원번호</th>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이름</th>
					<th>유형</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${userList}">
					<tr class="member-row" data-member-id="${user.memberId}">
						<td><input type="checkbox"></td>
						<td style="cursor: pointer">${user.memberId}</td>
						<td>${user.userId}</td>
						<td>${user.userPassword}</td>
						<td>${user.userName}</td>
						<td>${user.userType}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>
		<button onclick="modifySelectedMember()">회원정보수정</button>
		<button onclick="deleteSelectedMember()">회원정보삭제</button>
	</div>

	<!-- 모달창 -->
	<div id="memberModal" class="modal">
		<div class="modal-content">
			<div class="modal-title">회원상세정보</div>
			<span class="close">&times;</span>
			<div id="memberDetails">
				<table>
					<thead>
						<tr>
							<th>회원 이름</th>
							<th>프로필 사진</th>
							<th>별명</th>
							<th>생년월일</th>
							<th>전화번호</th>
							<th>주소</th>
							<th>이메일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td id="userName">${user.userName}</td>
							<td><img src="/image/memberProfile.jpg" class="memberImg"></td>
							<td id="userNickname">${user.userNickname}</td>
							<td id="userBirthdate">${user.userBirthdate}</td>
							<td id="userTel">${user.userTel}</td>
							<td id="userAddress">${user.userAddress}</td>
							<td id="userEmail">${user.userEmail}</td>
						</tr>
					</tbody>
				</table>

				<div></div>
			</div>
		</div>
	</div>

	<script>
		function modifySelectedMember() {
			var selectedMemberIds = [];
			var checkboxes = document
					.querySelectorAll('input[type="checkbox"]:checked');

			checkboxes
					.forEach(function(checkbox) {
						selectedMemberIds
								.push(checkbox.parentNode.nextElementSibling.textContent);
					});

			if (selectedMemberIds.length > 0) {
				location.href = '/admin/member/update?memberId='
						+ selectedMemberIds.join(',');
			} else {
				alert("회원을 선택해주세요.");
			}
		}

		function deleteSelectedMember() {
			var selectedMemberIds = [];
			var checkboxes = document
					.querySelectorAll('input[type="checkbox"]:checked');

			checkboxes
					.forEach(function(checkbox) {
						selectedMemberIds
								.push(checkbox.parentNode.nextElementSibling.textContent);
					});

			if (selectedMemberIds.length > 0) {
				var result = confirm("정말 삭제하시겠습니까?");
				if (result) {
					location.href = '/admin/member/remove?memberId='
							+ selectedMemberIds.join(',');
				}
			} else {
				alert("회원을 선택해주세요.");
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

		// 테이블의 각 회원번호를 클릭했을 때 모달창 열기
		var memberIdCells = document
				.querySelectorAll(".member-row td:nth-child(2)"); // 회원번호가 있는 열에 해당하는 셀을 선택합니다.
		memberIdCells.forEach(function(cell) {
			cell.addEventListener("click", function() {
				var memberId = this.textContent; // 클릭된 셀의 텍스트, 즉 회원번호를 가져옵니다.
				openMemberModal(memberId); // 모달 창을 열기 위해 회원번호를 인자로 넘겨줍니다.
			});

			// 툴팁 추가
			cell.addEventListener("mouseover", function(event) {
				var tooltip = document.createElement("div"); // 새로운 div 요소를 생성합니다.
				tooltip.textContent = "회원상세정보보기"; // 툴팁에 표시할 내용을 설정합니다.
				tooltip.classList.add("tooltip"); // CSS 스타일링을 위해 클래스를 추가합니다.

				// 툴팁을 마우스 위치에 위치시킵니다.
				tooltip.style.position = "absolute";
				tooltip.style.top = event.clientY + 10 + "px";
				tooltip.style.left = event.clientX + 10 + "px";

				document.body.appendChild(tooltip); // 툴팁을 문서의 body에 추가합니다.

				// 마우스가 벗어날 때 툴팁을 제거합니다.
				cell.addEventListener("mouseout", function() {
					document.body.removeChild(tooltip); // 툴팁을 제거합니다.
				});
			});
		});

		// 모달창 열기 함수
		function openMemberModal(memberId) {
			console.log("openMemberModal 함수 호출 !!");
			var modal = document.getElementById('memberModal');
			modal.style.display = "block";

			console.log("모달창 열림");

			// AJAX 요청을 통해 회원 상세 정보 가져오기
			$
					.ajax({
						url : '/admin/member/details',
						type : 'GET',
						data : {
							memberId : memberId
						},
						success : function(user) {
							console.log(user);
							// 서버에서 받은 회원 정보를 사용하여 각 요소에 값을 넣어줌
							document.getElementById('userName').textContent = user.userName;
							document.getElementById('userNickname').textContent = user.userNickname;
							document.getElementById('userBirthdate').textContent = user.userBirthdate;
							document.getElementById('userTel').textContent = user.userTel;
							document.getElementById('userAddress').textContent = user.userAddress;
							document.getElementById('userEmail').textContent = user.userEmail;
						},
						error : function(error) {
							console.error(error);
						}
					});

		}
	</script>
</body>
</html>