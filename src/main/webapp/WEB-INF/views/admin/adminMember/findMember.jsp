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
		<div class="content-title">회원 검색</div>
		<hr>
		<div class="content-nav">
			<span>회원관리</span><span> - </span><span><a
				href="/admin/member">회원목록</a></span><span> - </span><span><a
				href="/admin/member/search">회원검색</a></span><span> - </span><span><a
				href="/admin/member/add">관리자추가</a></span>
		</div>
		<form>
			<p>검색기준</p>
			<lable> <input type="checkbox" name="memberId">회원번호</lable>
			<lable> <input type="checkbox" name="userId">아이디</lable>
			<lable> <input type="checkbox" name="userPassword">비밀번호</lable>
			<lable> <input type="checkbox" name="userName">이름</lable>
			<lable> <input type="checkbox" name="userNickname">별명</lable>
			<lable> <input type="checkbox" name="userTel">전화번호</lable>
			<lable> <input type="checkbox" name="userEmail">이메일</lable>
			<lable> <input type="checkbox" name="userBirthdate">출생년도</lable>
			<label><input type="text" name="searchKeyword"
				placeholder="검색어를 입력하세요."></label><br> <label>출생월</label> <select
				name="birthMonth">
				<option disabled selected>월</option>
				<%
				for (int i = 1; i <= 12; i++) {
					out.println("<option value='" + i + "'>" + i + "</option>");
				}
				%>
			</select> </select> <label>출생일</label> <select name="birthDate">
				<option disabled selected>일</option>
				<%
				for (int i = 1; i <= 31; i++) {
					out.println("<option value='" + i + "'>" + i + "</option>");
				}
				%>
			</select>

			<lable>주소</lable>
			<select name="addressSystem">
				<option disabled selected>행정도시</option>
				<option value="서울특별시">서울특별시</option>
				<option value="부산광역시">부산광역시</option>
				<option value="대구광역시">대구광역시</option>
				<option value="인천광역시">인천광역시</option>
				<option value="광주광역시">광주광역시</option>
				<option value="대전광역시">대전광역시</option>
				<option value="울산광역시">울산광역시</option>
				<option value="세종특별자치시">세종특별자치시</option>
				<option value="경기도">경기도</option>
				<option value="강원특별자치도">강원특별자치도</option>
				<option value="충청북도">충청북도</option>
				<option value="충청남도">충청남도</option>
				<option value="전북특별자치도">전북특별자치도</option>
				<option value="전라남도">전라남도</option>
				<option value="경상북도">경상북도</option>
				<option value="경상남도">경상남도</option>
				<option value="제주특별자치도">제주특별자치도</option>
			</select><br> <label>유형</label> <select name="userType">
				<option disabled selected>회원구분</option>
				<option value="CUS">회원</option>
				<option value="ADM">관리자</option>
			</select>

			<button type="submit">검색하기</button>
		</form>
		<hr>
		<table>
			<thead>
				<tr>
					<th>선택</th>
					<th>회원번호</th>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이름</th>
					<th>별명</th>
					<th>생년월일</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>이메일</th>
					<th>유형</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${userList}">
					<tr>
						<td><input type="checkbox"></td>
						<td>${user.memberId}</td>
						<td>${user.userId}</td>
						<td>${user.userPassword}</td>
						<td>${user.userName}</td>
						<td>${user.userNickname}</td>
						<td>${user.userBirthdate}</td>
						<td>${user.userTel}</td>
						<td>${user.userAddress}</td>
						<td>${user.userEmail}</td>
						<td><c:choose>
								<c:when test="${user.userType eq 'CUS'}">회원</c:when>
								<c:when test="${user.userType eq 'ADM'}">관리자</c:when>
							</c:choose></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>
		<button onclick="modifySelectedMember()">회원정보수정</button>
		<button onclick="deleteSelectedMember()">회원정보삭제</button>
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
	</script>

</body>
</html>