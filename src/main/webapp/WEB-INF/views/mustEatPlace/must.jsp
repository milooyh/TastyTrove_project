<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<style>
		* {
			margin:0;
			padding:0;
			box-sizing:border-box;
		}
		
		h1{
			margin-bottom:30px;
		}
	
		.modal{
            position:absolute;
            display:none;
            justify-content: center;
            top:0;
            left:0;
            width:100%;
            height:100vh;
            background-color: rgba(0,0,0,0.4);
        }

        .modal_body{
            position:absolute;
        	margin-top:50px;
            width:500px;   
            height:700px; 
            padding:40px;  
            text-align: center;
            background-color: rgb(255,255,255);
            border-radius:10px;
            box-shadow:0 2px 3px 0 rgba(34,36,38,0.15);
			z-index : 1050;
        }
        
        .add_mustEatPlace {
        	width: 30%;
        	heigt: 420px;
        	display:flex;
            border-radius: 5px;
            margin-left:10%;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
		    text-decoration: none;
        }
        
        #map {
        	display:flex;
            border-radius: 5px;
        }

        input {
            border-radius: 15px;
            border: 0;
            margin: 17px;
            padding: 10px;
            outline: none;
            background-color: rgb(233, 233, 233);
        }

        .button {
            background-color: #ff153c;
            border-radius: 5px;
            color: white;
            font-weight: bold;
            padding: 5px;
        }

        #map_add {
            display: flex;
            justify-content: center;
        }
        
        .mustEatPlace-info{
        	width:27%;
        	height:10%;
        	text-align:center;
        	display:inline-block;
        	margin-left:5%;
        	margin-top:4%;
        	background-color:#ffffff;
        	border-radius:20px;
        	font-family: "paybooc-Light", sans-serif;
		    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
		    text-decoration: none;
        }
        
        .container{
        	background-color:#f0f0f0;
        }
        
        p {
        	font-weight:bold;
        }
        
        h3 {
        	margin:10px;
        }
        
        .btn {
		    position: relative;
		    border: none;
		    display: inline-block;
		    padding: 7px 15px;
		    border-radius: 15px;
		    font-family: "paybooc-Light", sans-serif;
		    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
		    text-decoration: none;
		    font-weight: 600;
		    transition: 0.25s;
		}
		
		.btn-blue {
		    background-color: #6aafe6;
		    color: #d4dfe6;
		}
		
		.btn-red {
			background-color: #ff5f2e;
		}
		
		.wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
	    .wrap * {padding: 0;margin: 0;}
	    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
	    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
	    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
	    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
	    .info .close:hover {cursor: pointer;}
	    .info .body {position: relative;overflow: hidden;}
	    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
	    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
	    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
	    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
	    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
	    .info .link {color: #5085BB;}
        
	</style>
	
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<h1>나만의 맛집을 등록하세요</h1>
	<div id="map_add">
		<div id="map" style="width:40%;height:420px;"></div>
	
	    <!-- 주소를 입력받는 폼 -->
	    
		    <div class="add_mustEatPlace">
		    <form id="addressForm" action="" method="post">
		        <input type="text" id="address" name="place" required placeholder="주소입력" readonly>   
		        <input type="button" onclick="search_address()" value="주소 검색" class="btn btn-red"><br>
		        <input type="text" id="nickname" name="restaurantName" required placeholder="식당이름"><br>
		        <input type="text" id="review" name="review" required placeholder="한줄평"><br>  
		        <input type="number" id="asterion" name="asterion" required placeholder="제 점수는요(1~5)"><br> 
		        <input type="text" id="telephone_number" name="telephoneNumber" required placeholder="전화번호"><br>
		        <input type="text" id="representative_menu" name="representativeMenu" required placeholder="대표메뉴">
		        <button type="submit" id="addBtn" disabled='disabled' class="btn btn-red">추가하기</button>
		    </form>
	    </div>
	</div>
	
	<c:forEach var="mustEatPlaceItem" items="${mustEatPlaces}">
		<div class="mustEatPlace-info">
			<p class="restaurant-name" onclick="moveToLocation('${mustEatPlaceItem.place}')" style="font-weight:bold; font-size:1.2rem; cursor:pointer; margin-top:10px">${mustEatPlaceItem.restaurantName}</p>
            <c:if test="${mustEatPlaceItem.representativeMenuImage == null}">
            	<img src="<c:url value="/image/noPhoto.PNG"/>" onclick="location.href='/must/upload?id=${mustEatPlaceItem.id}'" style="width:200px; height:200px; cursor:pointer; object-fit:cover;"><br>
            </c:if>
            <c:if test="${mustEatPlaceItem.representativeMenuImage != null}">
            	<img src="data:image/jpg;base64,${mustEatPlaceItem.representativeMenuImage}" onclick="location.href='/must/upload?id=${mustEatPlaceItem.id}'" style="width:200px; height:200px; cursor:pointer; border-radius:13px; object-fit:cover;"><br>
            </c:if>
            <p>${mustEatPlaceItem.place}</p><br>
			<p>${mustEatPlaceItem.review}</p><br>
			<p>${mustEatPlaceItem.asterion}점</p><br>
			<button onclick="removeMustEatPlace(${mustEatPlaceItem.id})" class="btn btn-blue">삭제</button>
			<button onclick="location.href='/must/modify?id=${mustEatPlaceItem.id}'" class="btn btn-blue">수정</button>
			<button onclick="location.href='/must/registerMenu?id=${mustEatPlaceItem.id}'" class="btn btn-blue">메뉴 추가</button>
			<button onclick="location.href='/must/modifyMenu?id=${mustEatPlaceItem.id}'" class="btn btn-blue">메뉴 삭제</button>
			<br><br>
			</div>
		</c:forEach>

	<div class="modal">
        <div class="modal_body">
        	<span style="margin-left:15px; cursor:pointer; float:right;" onclick="closeModal()">✖</span>
        	<c:forEach var="mustEatPlaceItem" items="${mustEatPlaces}">
        		<h2>${mustEatPlaceItem.restaurantName}</h2>
        		<span>${mustEatPlaceItem.place}</span>
        		<span>${mustEatPlaceItem.review}</span>
        		<span>${mustEatPlaceItem.asterion}</span>
        	</c:forEach>
        </div>
    </div>
    </div>
       
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=81e105f34368d7fc3ec8c1db571a19ad&libraries=services,clusterer"></script>
		
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<script>
	
	let findMustEatPlaceWithMenu=[];
	
	</script>
	
	<c:forEach var="mustEatPlaceWithMenuItem" items="${mustEatPlaceWithMenu}">
    <script>
        findMustEatPlaceWithMenu.push({
            id: '<c:out value="${mustEatPlaceWithMenuItem.id}" />',
            menuName: '<c:out value="${mustEatPlaceWithMenuItem.menuName}" />',
            price: '<c:out value="${mustEatPlaceWithMenuItem.price}" />'
        });
    </script>
	</c:forEach>

	<script>
	
	function removeMustEatPlace(id){
		if(confirm("정말 삭제하시겠습니까?")){
			//확인을 눌렀다
			console.log('삭제 확인 누름');
			console.log('넘어온 id 값 : ' + id);
			location.href='/must/remove?id=' + id;
		}	
		//취소 누르면 아무것도 안함
	}
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
    
<script>

var clusterer = new kakao.maps.MarkerClusterer({
    map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
    averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
    minLevel: 10 // 클러스터 할 최소 지도 레벨 
});

var markers = [];


</script>
<script>

var overlay;

function closeOverlay() {
    overlay.setMap(null);     
};

<c:forEach var="mustEatPlaceItem" items="${mustEatPlaces}">
    
    
    
		var geocoder = new kakao.maps.services.Geocoder();
		
		// 주소로 좌표를 검색하고, 마커를 표시합니다.
		geocoder.addressSearch('<c:out value="${mustEatPlaceItem.place}"/>', function(result, status) {
		    if (status === kakao.maps.services.Status.OK) {
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		        // 마커 이미지의 이미지 주소입니다
		        var imageSrc = "/image/marker.png";
		
		        // 마커 이미지의 이미지 크기 입니다
		        var imageSize = new kakao.maps.Size(30, 35);
		
		        // 마커 이미지를 생성합니다    
		        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
		        
		        var iwContent = '<div class="wrap">' + 
		        '    <div class="info">' + 
		        '        <div class="title">' + 
		        '			<c:out value="${mustEatPlaceItem.restaurantName}" />' + 
		        '            <div class="close" onclick="closeOverlay(overlay)" title="닫기"></div>' + 
		        '        </div>' + 
		        '        <div class="body">' + 
		        '            <div class="img">' +
		        '                <img src="data:image/jpg;base64,${mustEatPlaceItem.representativeMenuImage}" style="width:73px; height:70px; object-fit:cover; ">' +
		        '           </div>' + 
		        '            <div class="desc">' + 
		        '                <div class="ellipsis"><img src="<c:url value="/image/map-marker.png"/>" style="width:15px; height:15px;"> <c:out value="${mustEatPlaceItem.place}" /></div>' + 
		        '                <div class="jibun ellipsis"><img src="<c:url value="/image/telephone.png"/>" style="width:15px; height:15px; margin-top:5px;"> <c:out value="${mustEatPlaceItem.telephoneNumber}" /></div>' + 
		        '                <div><button class="btn btn-blue" onclick="openModal(\'' +
		        '<c:out value="${mustEatPlaceItem.restaurantName}" />\',' +
		        '\'<c:out value="${mustEatPlaceItem.place}" />\',' +
		        '\'<c:out value="${mustEatPlaceItem.review}" />\',' +
		        '\'<c:out value="${mustEatPlaceItem.telephoneNumber}" />\',' +
		        '\'<c:out value="${mustEatPlaceItem.representativeMenu}" />\',' +
		        '\'<c:out value="${mustEatPlaceItem.asterion}" />\',' +
		        '\'<c:out value="${mustEatPlaceItem.id}" />\')">자세히보기</button></div>' + 
		        
		        '            </div>' + 
		        '        </div>' + 
		        '    </div>' +    
		        '</div>';
		        iwRemoveable = true;
		
		        // 마커를 생성하고 지도에 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map, // 마커를 표시할 지도
		            position: coords, // 마커를 표시할 위치
		            title: '<c:out value="${mustEatPlaceItem.restaurantName}" />', // 마커의 타이틀
		            image: markerImage // 마커 이미지
		        });
		        
		        markers.push(marker); // markers 배열에 마커 추가
		        
		        overlay = new kakao.maps.CustomOverlay({
		        	position: coords,
		            content: iwContent,
		            removable : iwRemoveable
		        });
		        
		        // 마커에 클릭 이벤트를 등록합니다
		        kakao.maps.event.addListener(marker, 'click', function() {
		            // 마커 위에 인포윈도우를 표시합니다
		            overlay.setMap(map);
		            overlay.setPosition(coords);
		            overlay.setContent(iwContent);
		        });
		        
		        // 클러스터러에 마커들을 추가
		        clusterer.addMarkers(markers);
		        
		    } else {
		        console.error('주소를 변환할 수 없습니다.');
		    }
		    
		});
</c:forEach>
</script>

	<script>
	function openModal(name, place, review, telephoneNumber, representativeMenu, asterion, id) {
	    const modal = document.querySelector('.modal');
	    const modalBody = document.querySelector('.modal_body');

	    // id에 해당하는 모든 메뉴 정보 가져오기
	    var menuInfos = findMustEatPlaceWithMenu.filter(function(item) {
	        return item.id === id;
	    });

	    modalBody.innerHTML = '<span style="margin-left:15px; cursor:pointer; float:right;" onclick="closeModal()">✖</span>' +
	        '<h2>' + name + '</h2><br>' +
	        '<p>' + place + '</p><br>' +
	        '<p>' + review + '</p><br>' +
	        '<p>' + telephoneNumber + '</p><br>' +
	        '<p>' + representativeMenu + '</p><br>' +
	        '<p>' + getStarRating(asterion) + '</p><br>' + 
	        '<p>'+'=============메뉴============='+ '</p><br>';

	 // 모든 메뉴 정보 출력
	    menuInfos.forEach(function(menuInfo) {
	        modalBody.innerHTML += '<p>' + menuInfo.menuName + ', 가격: ' + menuInfo.price + '</p><br>';
	    });

	    modalBody.innerHTML += '<p>'+'============================'+ '</p>';

	    modal.style.display = "flex";
	}

	
	function getStarRating(asterion) {
        let stars = '';
        for (let i = 1; i <= 5; i++) {
            if (i <= asterion) {
                stars += '⭐';
            } else {
                stars += '☆';
            }
        }
        return stars;
    }

    function closeModal() {
        // 모달 닫기
        const modal = document.querySelector('.modal');
        modal.style.display = "none";
    }
    </script>
    
	<script>
	function moveToLocation(address) {
        // 주소로 좌표를 검색합니다
        var geocoder = new kakao.maps.services.Geocoder();
        geocoder.addressSearch(address, function (result, status) {
            // 주소 검색이 완료되면
            if (status === kakao.maps.services.Status.OK) {
                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                // 해당 좌표로 지도를 이동합니다
                map.setCenter(coords);
            } else {
                alert('주소를 찾을 수 없습니다.');
            }
        });
    }
</script>
</body>
</html>