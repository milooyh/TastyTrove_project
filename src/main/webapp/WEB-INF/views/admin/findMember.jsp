<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	border-collapse: collapse;
	text-align: center;
}

th, td {
	border: 1px solid black;
}
</style>
</head>
<body>
	<h1>회원 검색</h1>
	<hr>
	<form>
		<p>검색기준</p>
		<lable>
		<input type="radio" name="memberId">회원번호</lable>
		<lable>
		<input type="radio" name="userId">아이디</lable>
		<lable>
		<input type="radio" name="userPassword">비밀번호</lable>
		<lable>
		<input type="radio" name="userName">이름</lable>
		<lable>
		<input type="radio" name="userNickname">별명</lable><br>
		<lable>출생년도<input type="text" name="birthYear"></lable>
		<label>출생월</label> <select name="birthMonth">
			<option disabled selected>월</option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
			<option value="8">8</option>
			<option value="9">9</option>
			<option value="10">10</option>
			<option value="11">11</option>
			<option value="12">12</option>
		</select> <label>출생일</label> <select name="birthDate">
			<option disabled selected>일</option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
			<option value="8">8</option>
			<option value="9">9</option>
			<option value="10">10</option>
			<option value="11">11</option>
			<option value="12">12</option>
			<option value="13">13</option>
			<option value="14">14</option>
			<option value="15">15</option>
			<option value="16">16</option>
			<option value="17">17</option>
			<option value="18">18</option>
			<option value="19">19</option>
			<option value="20">20</option>
			<option value="21">21</option>
			<option value="22">22</option>
			<option value="23">23</option>
			<option value="24">24</option>
			<option value="25">25</option>
			<option value="26">26</option>
			<option value="27">27</option>
			<option value="28">28</option>
			<option value="29">29</option>
			<option value="30">30</option>
			<option value="31">31</option>
		</select><br>
		<label>전화번호</label><input type="text" id="tel1" name="tel1">
		<span> - </span>
		<input type="text" id="tel2" name="tel2">
		<span> - </span>
		<input type="text" id="tel3" name="tel3"><br>
		<lable>주소</lable>
		<select name="addressSystem">
			<option value="서울특별시">서울특별시</option>
			<option value="부산광역시">부산광역시</option>
			<option value="대구광역시">대구광역시</option>
			<option value="인천광역시">인천광역시</option>
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
		</select>
		<input type="text" name="myAddress" placeholder="상세주소"><br>
		<lable>이메일
		<input type="text" name="myEmail">
		<select name="emailSystem">
			<option value="naver">@naver.com</option>
			<option value="gmail">@gmail.com</option>
			<option value="hanmail">@hanmail.net</option>
		</select>
		<input type="text" name="etcEmail" placeholder="기타">
		</lable> <br>
		<button type="submit">검색하기</button>
	</form>
	<hr>
	<table>
		<thead>
			<tr>
				<th>회원번호</th>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>별명</th>
				<th>생년월일</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>이메일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="userList" items="${userList}">
				<tr>
					<td>${userList.userId}</td>
					<td>${userList.userPassword}</td>
					<td>${userList.userName}</td>
					<td>${userList.userNickname}</td>
					<td>${userList.userBirthdate}</td>
					<td>${userList.userTel}</td>
					<td>${userList.userAddress}</td>
					<td>${userList.userEmail}</td>
					<td><button>회원정보수정</button>
					<td><button>회원정보삭제</button>
				</tr>
			</c:forEach>
		</tbody>
	</table> <br>
	<button>회원추가</button>
</body>
</html>