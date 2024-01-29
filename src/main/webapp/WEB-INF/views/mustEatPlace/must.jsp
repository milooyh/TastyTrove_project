<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
	#contentBox{
		width:100px;
		height:100px;
		text-align:center;
		padding:10px;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>나만의 맛집을 등록하세요</h1>
	
	<div id="map" style="width:100%;height:400px;"></div>

    <!-- 주소를 입력받는 폼 -->
    <form id="addressForm" action="" method="post">
        <label>주소 입력:</label><input type="text" id="address" name="place" required>   

        <button type="button" onclick="searchAddress()">주소 검색</button>
        
        <label>설정할 별명 입력:</label><input type="text" id="nickname" name="restaurant_name" required>  
        <button type="button" onclick="searchAddress()">별명 설정</button>
        <label>자신만의 리뷰 등록하세요</label><input type="text" id="review" name="review" required>  
        <label>자신만의 별점</label><input type="number" id="asterion" name="asterion" required>  
        <button type="submit" id="addBtn" disabled='disabled'>추가하기</button>
    </form>
    
    
    <!-- <script>
	    var mapContainer = document.getElementById('map');
	    var mapOption = {
	        center: new kakao.maps.LatLng(37.56107, 126.9822),
	        level: 14
	    };
	
	    var map = new kakao.maps.Map(mapContainer, mapOption);
	    var geocoder = new kakao.maps.services.Geocoder();
	    var imageSrc = "<c:out value='${imageSrc}' />";
	    var positions = [];
	    
	    var address = "<c:out value='${mustEatPlaceItem.place}' />";
	    var title = "<c:out value='${mustEatPlaceItem.restaurant_name}' />";
	
	    geocoder.addressSearch(address, function(result, status) {
	        if (status === kakao.maps.services.Status.OK) {
	            positions.push({
	                title: title,
	                latlng: new kakao.maps.LatLng(result[0].y, result[0].x)
	            });
	
	            // 마커를 생성하는 부분
	            var imageSize = new kakao.maps.Size(24, 35);
	            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
	
	            for (var i = 0; i < 17; i++) {
	                var marker = new kakao.maps.Marker({
	                    map: map,
	                    position: positions[i].latlng,
	                    title: positions[i].title,
	                    image: markerImage
	                });
	            }
	        } else {
	            alert('주소 검색 실패했습니다.');
	        }
	    });
    </script> -->
    
    <script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=81e105f34368d7fc3ec8c1db571a19ad&libraries=services"></script>
		
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=81e105f34368d7fc3ec8c1db571a19ad&libraries=clusterer"></script>
		
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <script>
        var mapContainer = document.getElementById('map');
        var mapOption = {
            center: new kakao.maps.LatLng(37.56107, 126.9822),
            level: 14
        };

        var map = new kakao.maps.Map(mapContainer, mapOption);
        
        var markers = []; // 마커를 저장할 배열

        // 주소를 입력받는 폼
        var addressForm = document.getElementById('addressForm');

        // 주소로 좌표를 검색하고 마커를 표시하는 함수
        function searchAddress() {
            // 폼에서 입력된 주소 가져오기
            var inputAddress = document.getElementById('address').value;
            
            var inputNickname = document.getElementById('nickname').value;
            

            // 주소로 좌표를 검색
            var geocoder = new kakao.maps.services.Geocoder();
            
            geocoder.addressSearch(inputAddress, function(result, status) {
                // 정상적으로 검색이 완료됐으면
                if (status === kakao.maps.services.Status.OK) {
                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                    
                    const addBtn = document.getElementById('addBtn');

                    // 결과값으로 받은 위치를 마커로 표시
                    var marker = new kakao.maps.Marker({
                        map: map,
                        position: coords
                    });

                    // 인포윈도우로 장소에 대한 설명 표시
                    var infowindow = new kakao.maps.InfoWindow({
                        content: '<div style="width:150px;text-align:center;padding:6px 0;">' + inputNickname + '</div>'
                    });
                    infowindow.open(map, marker);
                    
                    addBtn.disabled = false;

                    // 지도의 중심을 결과값으로 받은 위치로 이동
                    map.setCenter(coords);
                } else {
                	addBtn.disabled = true;
                    alert('주소 검색 실패했습니다. 다시 시도해주세요.');
                }
            });
        }
        </script>
        
        <c:forEach var="mustEatPlaceItem" items="${mustEatPlaces}">
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
                console.error('주소를 변환할 수 없습니다.');
            }
        });
        
        
	    </script>
	</c:forEach>
	
	<script>
		var clusterer = new kakao.maps.MarkerClusterer({
	        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
	        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
	        minLevel: 14 // 클러스터 할 최소 지도 레벨 
	    });
	
	    // 클러스터러에 마커들을 추가
	    clusterer.addMarkers(markers);
	</script>
	
	<!-- <script>
	    var clusterer = new kakao.maps.MarkerClusterer({
	        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
	        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
	        minLevel: 14 // 클러스터 할 최소 지도 레벨 
	    });
	
	    // 클러스터러에 마커들을 추가
	    clusterer.addMarkers(markers);
	</script> -->
        
     <!-- // 폼 데이터를 서버로 전송하는 함수
        /* function submitForm() {
            var formData = {
                place: document.getElementById('address').value,
                restaurant_name: document.getElementById('nickname').value,
                review: document.getElementById('review').value,
                asterion: document.getElementById('asterion').value
            };

            $.ajax({
                type: 'POST',
                url: '/must',
                contentType: 'application/json;charset=UTF-8',
                data: JSON.stringify(formData),
                success: function(response) {
                    // 성공 시 수행할 동작
                    console.log(response);
                    alert('맛집이 성공적으로 등록되었습니다.');

                    // 지도에 마커 표시
                    displayMarker(formData.place, formData.restaurant_name);
                },
                error: function(error) {
                    // 실패 시 수행할 동작
                    console.error(error);
                    alert('맛집 등록에 실패했습니다. 다시 시도해주세요.');
                }
            });
        } */
        // 지도에 마커를 표시하는 함수
        function displayMarker(place, restaurant_name) {
            var geocoder = new kakao.maps.services.Geocoder();
            geocoder.addressSearch(place, function(result, status) {
                // 정상적으로 검색이 완료됐으면
                if (status === kakao.maps.services.Status.OK) {
                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                    // 결과값으로 받은 위치를 마커로 표시
                    var marker = new kakao.maps.Marker({
                        map: map,
                        position: coords,
                        title: restaurantName // 마커에 표시할 타이틀 추가
                    });

                    // 마커를 배열에 추가
                    markers.push(marker);

                    // 지도의 중심을 마지막 마커의 위치로 이동
                    map.setCenter(coords);
                } else {
                    alert('주소 검색 실패했습니다. 다시 시도해주세요.');
                }
            });
        } */
        var geocoder = new kakao.maps.services.Geocoder();
        var positions = positions || []; // 배열이 없으면 새로 생성

        // 주소로 좌표를 검색
        geocoder.addressSearch('<c:out value="${place}" />', function (result, status) {
            // 정상적으로 검색이 완료됐으면
            if (status === kakao.maps.services.Status.OK) {
                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                positions.push({
                    title: '<c:out value="${restaurant_name}" />',
                    latlng: coords
                });

                // 마커를 생성하는 부분
                var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
    
		    for (var i = 0; i < positions.length; i++) {
		        var imageSize = new kakao.maps.Size(24, 35);
		        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
		
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: positions[i].latlng,
		            title: positions[i].title,
		            image: markerImage
		        });
		    }
            } else {
                console.error('주소 검색 실패했습니다.');
            }
        }); -->
        
    
</body>
</html>