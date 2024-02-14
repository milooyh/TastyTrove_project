
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/saveMember.css?after"
	type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/js/signup.js" type="text/javascript"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
	<%@include file="../adminHeader.jsp"%>
	<div class="content">
		<div class="content-title">관리자 추가</div>
		<hr>
		<div class="content-nav">
			<span>회원관리</span><span> - </span><span><a href="/admin/member">회원목록</a></span><span>
				- </span><span><a href="/admin/member/search">회원검색</a></span><span>
				- </span><span><a href="/admin/member/add">관리자추가</a></span>
		</div>
		<hr>
		<form action="" method="post">
			<div class="form-item">
				<label>아이디 : </label><input type="text" id="userId" name="userId"
					required>
				<button type="button" id="idChk_btn" name="idChk_btn">확인</button>
				<div id="idAvailabilityMessage"></div>
			</div>

			<div class="form-item">
				<label>비밀번호<label><input type="password"
						id="userPassword" name="userPassword" required> <label>비밀번호
							확인 : </label><input type="password" id="userPasswordChk"
						name="userPasswordChk" required>
						<button type="button" id="pwChk_btn" name="pwChk_btn">확인</button>
						<div id="pwAvailabilityMessage"></div>
			</div>

			<div class="form-item">
				<label>이름 : </label><input type="text" id="userName" name="userName"
					required>
			</div>

			<div class="form-item">
				<label>별명 : </label><input type="text" id="userNickname"
					name="userNickname">
				<button type="button" id="nicknameChk_btn" name="nicknameChk_btn"
					required>확인</button>
				<div id="nickNameAvailabilityMessage"></div>
			</div>

			<div class="form-item">
				<label>출생연도 : </label><input type="text" name="birthYear"
					id="birthYear" required> <label>출생월 : </label> <select
					name="birthMonth" id="birthMonth" required>
					<option disabled selected>월</option>
					<%
					for (int i = 1; i <= 12; i++) {
						out.println("<option value='" + i + "'>" + i + "</option>");
					}
					%>
				</select> <label>출생일 : </label> <select name="birthDate" id="birthDate"
					required>
					<option disabled selected>일</option>
					<%
					for (int i = 1; i <= 31; i++) {
						out.println("<option value='" + i + "'>" + i + "</option>");
					}
					%>
				</select>
			</div>
			<div class="form-item">
				<label>전화번호 : </label><input type="text" id="tel1" name="tel1"
					required> <input type="text" id="tel2" name="tel2" required>
				<input type="text" id="tel3" name="tel3" required>
				<button type="button" id="telChk_btn" name="telChk_btn">확인</button>
				<div id="telAvailabilityMessage"></div>
			</div>

			<div class="form-item">
				<label>주소 : </label> <input type="text" id="userAddress"
					name="userAddress"> <input
					onclick="sample5_execDaumPostcode()" value="주소 검색" type="button"
					class="btn"> <br>
				<div id="map"
					style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>

			</div>

			<div class="form-item">
				<label>이메일 : </label><input type="text" id="userEmail"
					name="userEmail" required>
				<button type="button" id="emailChk_btn" name="emailChk_btn">확인</button>
				<div id="emailAvailabilityMessage"></div>

			</div>
			<div class="form-item">
				<button type="submit">관리자 등록</button>
				<button onclick="location.href='/admin/member'">회원 목록</button>
			</div>
		</form>

		<script
			src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=56cd7f45575f03b0823b5bb3bfe20b1556cd7f45575f03b0823b5bb3bfe20b15&libraries=services"></script>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div
			mapOption = {
				center : new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
				level : 5
			// 지도의 확대 레벨
			};

			//지도를 미리 생성
			var map = new daum.maps.Map(mapContainer, mapOption);
			//주소-좌표 변환 객체를 생성
			var geocoder = new daum.maps.services.Geocoder();
			//마커를 미리 생성
			var marker = new daum.maps.Marker({
				position : new daum.maps.LatLng(37.537187, 127.005476),
				map : map
			});

			function sample5_execDaumPostcode() {
				new daum.Postcode(
						{
							oncomplete : function(data) {
								var addr = data.address; // 최종 주소 변수

								// 주소 정보를 해당 필드에 넣는다.
								document.getElementById("sample5_address").value = addr;
								// 주소로 상세 정보를 검색
								geocoder
										.addressSearch(
												data.address,
												function(results, status) {
													// 정상적으로 검색이 완료됐으면
													if (status === daum.maps.services.Status.OK) {
														console.log("정상검색완료");

														var result = results[0]; //첫번째 결과의 값을 활용

														// 해당 주소에 대한 좌표를 받아서
														var coords = new daum.maps.LatLng(
																result.y,
																result.x);
														// 지도를 보여준다.
														mapContainer.style.display = "block";
														map.relayout();
														// 지도 중심을 변경한다.
														map.setCenter(coords);
														// 마커를 결과값으로 받은 위치로 옮긴다.
														marker
																.setPosition(coords)
													}
												});
							}
						}).open();
			}
		</script>
</body>
</html>
