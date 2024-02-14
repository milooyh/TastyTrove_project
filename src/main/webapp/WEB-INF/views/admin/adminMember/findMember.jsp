<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/findMember.css?after"
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
			<span>회원관리</span><span> - </span><span><a href="/admin/member">회원목록</a></span><span>
				- </span><span><a href="/admin/member/search">회원검색</a></span><span>
				- </span><span><a href="/admin/member/add">관리자추가</a></span>
		</div>
		<table id="searchTable">
			<form>
				<tr>
					<td class="title" colspan="9">검색기준</td>
				</tr>
				<tr>
					<td>선택</td>
					<td><input type="checkbox" name="memberId" value="memberId"
						id="memberId"> <label for="memberId">회원번호</label></td>
					<td><input type="checkbox" name="userId" value="userId"
						id="userId"> <label for="userId">아이디</label></td>
					<td><input type="checkbox" name="userPassword"
						value="userPassword" id="userPassword"> <label
						for="userPassword">비밀번호</label></td>
					<td><input type="checkbox" name="userName" value="userName"
						id="userName"> <label for="userName">이름</label></td>
					<td><input type="checkbox" name="userNickname"
						value="userNickname" id="userNickname"> <label
						for="userNickname">별명</label></td>
					<td><input type="checkbox" name="userTel" value="userTel"
						id="userTel"> <label for="userTel">전화번호</label></td>
					<td><input type="checkbox" name="userEmail" value="userEmail"
						id="userEmail"> <label for="userEmail">이메일</label></td>


				</tr>
				<tr>
					<td><label>검색어</label></td>
					<td colspan="8"><input type="text" name="searchKeyword"
						placeholder="검색어를 입력해주세요."> <span id="errorMessage"
						class="error-message">검색어를 입력해주세요.</span></td>
				</tr>

				<tr>

					<td>출생</td>
					<td colspan="3">출생월 <select name="birthMonth">
							<option disabled selected>월</option>
							<%
							for (int i = 1; i <= 12; i++) {
							%>
							<option value="<%=i%>"><%=i%></option>
							<%
							}
							%>
					</select>
					</td>
					<td colspan="4">출생일 <select name="birthDate">
							<option disabled selected>일</option>
							<%
							for (int i = 1; i <= 31; i++) {
							%>
							<option value="<%=i%>"><%=i%></option>
							<%
							}
							%>
					</select>
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td colspan="9"><select name="addressSystem">
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
					</select></td>
				</tr>
				<tr>
					<td>유형</td>
					<td colspan="8"><select name="userType">
							<option disabled selected>회원구분</option>
							<option value="CUS">회원</option>
							<option value="ADM">관리자</option>
					</select></td>
				</tr>
				<tr>
					<td colspan="9"
						style="background-color: transparent; text-align: center;">
						<button type="button" id="searchButton" onclick="history.back()">취소</button>
						<button type="submit" id="searchButton">검색하기</button>
					</td>
				</tr>
		</table>
		</form>
		<hr>

		<table id="memberTable">
			<thead>
				<tr>
					<th>회원번호</th>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이름</th>
					<th>별명</th>
					<th style="width: 10%">생년월일</th>
					<th style="width: 10%">전화번호</th>
					<th style="width: 20%">주소</th>
					<th>이메일</th>
					<th>유형</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${userList}">
					<tr>
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

	</div>

	<script>
		document.addEventListener('DOMContentLoaded', function() {
			// 각 체크박스 요소를 가져옴
			var checkboxes = document
					.querySelectorAll('#searchTable input[type="checkbox"]');

			// 각 체크박스에 이벤트 리스너 추가
			checkboxes.forEach(function(checkbox) {
				checkbox.addEventListener('change', function() {
					// 모든 체크박스의 checked 속성을 false로 설정
					checkboxes.forEach(function(cb) {
						cb.checked = false;
					});
					// 현재 체크된 체크박스의 checked 속성을 true로 설정
					this.checked = true;
				});
			});
		});
	</script>

</body>
</html>