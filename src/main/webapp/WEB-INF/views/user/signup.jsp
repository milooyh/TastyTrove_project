<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/signup.css?after"
	type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/js/signup.js" type="text/javascript"></script>
</head>
<body>
	<jsp:include page="../main/header.jsp"></jsp:include>

	<div class="content">
		<div class="content-signup">
			<div class="content-item title">회원가입</div>
			<form action="/signup" method="post">
				<div class="content-item">
					<label>아이디 : </label><input type="text" id="userId" name="userId"
						required style="width: 70%">
					<button type="button" id="idChk_btn" name="idChk_btn"
						class="searchButton">확인</button>
					<div class="content-item">
						<div id="idAvailabilityMessage"></div>
					</div>
				</div>
				<div class="content-item">
					<label>비밀번호 : </label><input type="password" id="userPassword"
						name="userPassword" required style="width: 80%">
				</div>
				<div class="content-item">
					<label>비밀번호 확인 : </label><input type="password"
						id="userPasswordChk" name="userPasswordChk" required
						style="width: 56%">
					<button type="button" id="pwChk_btn" name="pwChk_btn"
						class="searchButton">확인</button>
					<div class="content-item">
						<div id="pwAvailabilityMessage"></div>
					</div>
				</div>

				<div class="content-item">
					<label>이름 : </label><input type="text" id="userName"
						name="userName" required style="width: 90%"><br>
				</div>
				<div class="content-item">
					<label>별명 : </label><input type="text" id="userNickname"
						name="userNickname" style="width: 73%">
					<button type="button" id="nicknameChk_btn" name="nicknameChk_btn"
						required class="searchButton">확인</button>
					<div class="content-item">
						<div id="nickNameAvailabilityMessage"></div>
					</div>
				</div>

				<div class="content-item">
					<label>출생연도 : </label><input type="text" name="birthYear"
						id="birthYear" required style="width: 80%">
				</div>
				<div class="content-item">
					<label>출생월</label> <select name="birthMonth" id="birthMonth"
						required style="width: 40%">
						<option disabled selected>월</option>
						<%
						for (int i = 1; i <= 12; i++) {
							out.println("<option value='" + i + "'>" + i + "</option>");
						}
						%>
					</select> <label>출생일</label> <select name="birthDate" id="birthDate"
						required style="width: 40%">
						<option disabled selected>일</option>
						<%
						for (int i = 1; i <= 31; i++) {
							out.println("<option value='" + i + "'>" + i + "</option>");
						}
						%>
					</select>
				</div>
				<div class="content-item">
					<label>전화번호 : </label><input type="text" id="tel1" name="tel1"
						required style="width: 20%"> <input type="text" id="tel2"
						name="tel2" required style="width: 20%"> <input
						type="text" id="tel3" name="tel3" required style="width: 20%">
					<button type="button" id="telChk_btn" name="telChk_btn"
						class="searchButton">확인</button>
					<div class="content-item">
						<div id="telAvailabilityMessage"></div>
					</div>
				</div>
				<div class="content-item">
					<label>주소 : </label> <input type="text" id="userAddress"
						name="userAddress" required style="width: 76%">< <input
						type="button" a onclick="sample5_execDaumPostcode()" value="확인"
						class="searchButton">
					<div class="content-item">
						<div id="map"
							style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>
					</div>
				</div>

				<div class="content-item">
					<label>이메일 : </label><input type="text" id="userEmail"
						name="userEmail" required style="width: 70%">
					<button type="button" id="emailChk_btn" name="emailChk_btn"
						class="searchButton">확인</button>
					<div class="content-item">
						<div id="emailAvailabilityMessage"></div>
					</div>
				</div>
				<div class="content-item">
					<button type="submit" style="text-align: center;">회원가입하기</button>
				</div>
			</form>
		</div>
	</div>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=56cd7f45575f03b0823b5bb3bfe20b15&libraries=services"></script>
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
			new daum.Postcode({
				oncomplete : function(data) {
					var addr = data.address; // 최종 주소 변수

					// 주소 정보를 해당 필드에 넣는다.
					document.getElementById("userAddress").value = addr;
					// 주소로 상세 정보를 검색
					geocoder.addressSearch(data.address, function(results,
							status) {
						// 정상적으로 검색이 완료됐으면
						if (status === daum.maps.services.Status.OK) {

							var result = results[0]; //첫번째 결과의 값을 활용

							// 해당 주소에 대한 좌표를 받아서
							var coords = new daum.maps.LatLng(result.y,
									result.x);
							// 지도를 보여준다.
							mapContainer.style.display = "block";
							map.relayout();
							// 지도 중심을 변경한다.
							map.setCenter(coords);
							// 마커를 결과값으로 받은 위치로 옮긴다.
							marker.setPosition(coords)
						}
					});
				}
			}).open();
		}
	</script>


</body>
</html>