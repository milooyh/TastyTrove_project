<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>지도 제발</h1>

	<div id="map" style="width: 500px; height: 400px;"></div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=81e105f34368d7fc3ec8c1db571a19ad"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    	mapOption = { 
        	center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        	level: 3 // 지도의 확대 레벨
    	};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		/* // 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(36.80730, 127.1472);  //달식당

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		}); */
		
		// 마커를 표시할 위치와 title 객체 배열입니다
		// title은 맛집 테이블에서 restaurant_name을 가져올 것.
		// 테이블에서 미리 생성 후 데이터 값을 반복문으로 넣어보기.
		var positions = [
		    {
		        title: '달식당', 
		        latlng: new kakao.maps.LatLng(36.80730, 127.1472)  //달식당(천안)
		    },
		    {
		        title: '란주라미엔', 
		        latlng: new kakao.maps.LatLng(37.56105, 126.9821)  //란주라미엔(서울)
		    },
		    {
		        title: '스모크트레인', 
		        latlng: new kakao.maps.LatLng(37.58410, 127.0008)  //스모크트레인(서울)
		    },
		    {
		        title: '노가드네',
		        latlng: new kakao.maps.LatLng(36.41305, 127.2163)  //노가드네(공주)
		    },
		    {
		        title: '광천식당',
		        latlng: new kakao.maps.LatLng(36.32858, 127.4236)  //광천식당(대전)
		    },
		    {
		        title: '동차밥',
		        latlng: new kakao.maps.LatLng(37.56138, 126.9263)  //동차밥(서울)
		    },
		    {
		        title: '루가밀팩토리',
		        latlng: new kakao.maps.LatLng(36.81963, 127.1539)  //루가밀팩토리(천안)
		    }
		    /* {
		        title: '노가드네',
		        latlng: new kakao.maps.LatLng(36.41305, 127.2163)  //노가드네(공주)
		    }
		    {
		        title: '노가드네',
		        latlng: new kakao.maps.LatLng(36.41305, 127.2163)  //노가드네(공주)
		    }
		    {
		        title: '노가드네',
		        latlng: new kakao.maps.LatLng(36.41305, 127.2163)  //노가드네(공주)
		    }
		    {
		        title: '노가드네',
		        latlng: new kakao.maps.LatLng(36.41305, 127.2163)  //노가드네(공주)
		    }
		    {
		        title: '노가드네',
		        latlng: new kakao.maps.LatLng(36.41305, 127.2163)  //노가드네(공주)
		    } */
		    
		];

		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		    
		for (var i = 0; i < positions.length; i ++) {
		    
		    // 마커 이미지의 이미지 크기 입니다
		    var imageSize = new kakao.maps.Size(24, 35); 
		    
		    // 마커 이미지를 생성합니다    
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		    
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng, // 마커를 표시할 위치
		        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		        image : markerImage // 마커 이미지 
		    });
		}

		
	</script>
</body>
</html>