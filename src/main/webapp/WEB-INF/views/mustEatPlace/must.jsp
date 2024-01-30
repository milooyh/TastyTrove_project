<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<style>
		
		
		.modal{
            position:absolute;
            display:none;
            
            justify-content: center;
            top:0;
            left:0;

            width:100%;
            height:100%;

            background-color: rgba(0,0,0,0.4);
        }
        
        .modal_body{
            position:absolute; 
        	margin-top:50px;

            width:400px;   
            height:600px; 

            padding:40px;  

            text-align: center;

            background-color: rgb(255,255,255);
            border-radius:10px;
            box-shadow:0 2px 3px 0 rgba(34,36,38,0.15);

            transform:translateY(-50%);
        }
        
        #map {
        
        }
		
	</style>
	
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>나만의 맛집을 등록하세요</h1>
	
	<div id="map" style="width:40%;height:400px;"></div>

    <!-- 주소를 입력받는 폼 -->
    <form id="addressForm" action="" method="post">
        <label>주소 입력:</label><input type="text" id="address" name="place" required>   

        <!-- <button type="button" onclick="searchAddress()">주소 검색</button><br> -->
        <input type="button" onclick="search_address()" value="주소 검색"><br>
        <label>식당 입력:</label><input type="text" id="nickname" name="restaurant_name" required>  
        <!-- <button type="button" onclick="searchAddress()">별명 설정</button> -->
        <label>자신만의 리뷰 등록하세요</label><input type="text" id="review" name="review" required>  
        <label>자신만의 별점</label><input type="number" id="asterion" name="asterion" required>  
        <button type="submit" id="addBtn" disabled='disabled'>추가하기</button>
    </form>
    
    <!-- <input type="text" id="sample5_address" placeholder="주소">
	<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br> -->
	
	<c:forEach var="mustEatPlaceItem" items="${mustEatPlaces}">
		<label>주소 : </label><span>${mustEatPlaceItem.place}</span><br>
		<label>식당 이름 : </label><span>${mustEatPlaceItem.restaurant_name}</span><br>
		<label>나만의 리뷰 : </label><span>${mustEatPlaceItem.review}</span><br>
		<label>나만의 별점 : </label><span>${mustEatPlaceItem.asterion}</span><br>
	</c:forEach>
	
	<div class="modal">
        <div class="modal_body">
            <h2>모달창 제목</h2>
            <p>모달창 내용 </p>
        </div>
    </div>
    
    
    
 
    
    <script type="text/javascript"
src="//dapi.kakao.com/v2/maps/sdk.js?appkey=81e105f34368d7fc3ec8c1db571a19ad&libraries=services,clusterer"></script>
		
	
		
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<script>
	
	</script>
	
	<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.56107, 126.9822), // 지도의 중심좌표
            level: 14 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성(좌표없이)
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(),
        map: map
    });


    function search_address() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수
                
                const addBtn = document.getElementById('addBtn');

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                        
                        addBtn.disabled = false;
                    } else{
                    	addBtn.disabled = true;
                        alert('주소 검색 실패했습니다. 다시 시도해주세요.');
                    }
                });
            }
        }).open();
    }
</script>
    
    
    
    <%-- <c:forEach var="mustEatPlaceItem" items="${mustEatPlaces}">
    	<script>
    	
        var geocoder = new kakao.maps.services.Geocoder();

        // 주소로 좌표를 검색하고, 마커를 표시합니다.
        geocoder.addressSearch('<c:out value="${mustEatPlaceItem.place}" />', function(result, status) {
            if (status === kakao.maps.services.Status.OK) {
                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                // 마커 이미지의 이미지 주소입니다
                var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

                // 마커 이미지의 이미지 크기 입니다
                var imageSize = new kakao.maps.Size(24, 35);

                // 마커 이미지를 생성합니다    
                var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
                
                var iwContent = '<div style="width:150px;text-align:center;padding:6px 0;">' + '${mustEatPlaceItem.restaurant_name}' + '<br><button class="btn-open-modal">정보보기</button></div>'

                // 마커를 생성하고 지도에 표시합니다
                var marker = new kakao.maps.Marker({
                    map: map, // 마커를 표시할 지도
                    position: coords, // 마커를 표시할 위치
                    title: '<c:out value="${mustEatPlaceItem.restaurant_name}" />', // 마커의 타이틀
                    image: markerImage // 마커 이미지
                });
                
                var infowindow = new kakao.maps.InfoWindow({
                	map: map,
                    position: coords,
                    content: iwContent
                });
                infowindow.open(map, marker);
                
                markers.push(marker);
                
            } else {
                console.error('주소를 변환할 수 없습니당.');
            }
        });
        
        
	    </script>
	</c:forEach> --%>
	
<script>

var clusterer = new kakao.maps.MarkerClusterer({
    map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
    averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
    minLevel: 10 // 클러스터 할 최소 지도 레벨 
});

var markers = [];

</script>

<c:forEach var="mustEatPlaceItem" items="${mustEatPlaces}">
    <script>
    
    
        var geocoder = new kakao.maps.services.Geocoder();

        // 주소로 좌표를 검색하고, 마커를 표시합니다.
        geocoder.addressSearch('<c:out value="${mustEatPlaceItem.place}"/>', function(result, status) {
            if (status === kakao.maps.services.Status.OK) {
                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                // 마커 이미지의 이미지 주소입니다
                var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

                // 마커 이미지의 이미지 크기 입니다
                var imageSize = new kakao.maps.Size(24, 35);

                // 마커 이미지를 생성합니다    
                var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
                
                var iwContent = '<div style="width:150px;text-align:center;padding:6px 0;">' + '${mustEatPlaceItem.restaurant_name}' + '<br><button class="btn-open-modal" onclick="openModal()">정보보기</button></div>',
                iwRemoveable = true;

                // 마커를 생성하고 지도에 표시합니다
                var marker = new kakao.maps.Marker({
                    map: map, // 마커를 표시할 지도
                    position: coords, // 마커를 표시할 위치
                    title: '<c:out value="${mustEatPlaceItem.restaurant_name}" />', // 마커의 타이틀
                    image: markerImage // 마커 이미지
                });
                
                markers.push(marker); // markers 배열에 마커 추가
                
                var infowindow = new kakao.maps.InfoWindow({
                	
                    content: iwContent,
                    removable : iwRemoveable
                });
                
             	// 마커에 클릭이벤트를 등록합니다
                kakao.maps.event.addListener(marker, 'click', function() {
                      // 마커 위에 인포윈도우를 표시합니다
                      infowindow.open(map, marker);  
                });
                
        	    // 클러스터러에 마커들을 추가
                clusterer.addMarkers(markers);
                
            } else {
                console.error('주소를 변환할 수 없습니다.');
            }
            
        });	
	    
	</script>
</c:forEach>

	<script>
        const modal = document.querySelector('.modal');
        const btnOpenModal = document.querySelector('.btn-open-modal');
        
        function openModal(){
        	modal.style.display="flex";
        }
    </script>
	
	
</body>
</html>