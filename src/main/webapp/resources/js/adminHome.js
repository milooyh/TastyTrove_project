
// 지도 ================================
var mapContainer = document.getElementById('map');
var mapOption = {
	center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	level: 3 // 지도의 확대 레벨
};
var map = new kakao.maps.Map(mapContainer, mapOption);

// 통계 ====================================

// 회원 타입
$.ajax({
	url: '/admin/userTypeCount',
	type: 'GET',
	success: function(data) {

		var canvas = document.getElementById('userDonutChart');
		var ctx = canvas.getContext('2d'); // 차트 그릴 거

		var userDonutChart = new Chart(ctx, {
			type: 'doughnut',
			data: {
				labels: ['CUS', 'ADM'],
				datasets: [{
					data: [data.cusCount, data.admCount],
					backgroundColor: ['#FF6384', '#36A2EB']
				}]
			},
			options: {
				cutoutPercentage: 50,
				responsive: false
			}
		});
	},
	error: function(error) {
		console.error(error);
	}
});

// 레시피 타입
$.ajax({
	url: '/admin/recipeTypeCount',
	type: 'GET',
	success: function(data) {

		var canvas = document.getElementById('recipeDonutChart');
		var ctx = canvas.getContext('2d'); // 차트 그릴 거

		var recipeDonutChart = new Chart(ctx, {
			type: 'doughnut',
			data: {
				labels: ['KOR', 'CHI', 'JPN', 'WTN', 'DRT', 'ETC'],
				datasets: [{
					data: [data.korCount, data.chiCount, data.jpnCount, data.wtnCount, data.drtCount, data.etcCount],
					backgroundColor: ['#3498db', '#2ecc71', '#e74c3c', '#9b59b6', '#e67e22', '##e91e63']
				}]
			},
			options: {
				cutoutPercentage: 50,
				responsive: false
			}
		});
	},
	error: function(error) {
		console.error(error);
	}
});

// 레시피 작성 순위 타입
// 서버에서 데이터를 가져와 차트를 그리는 함수
function drawChart(data) {
	var labels = [];
	var counts = [];

	data.forEach(function(item) {
		labels.push(item['MEMBER_ID']); // x축에 사용할 멤버 ID를 labels 배열에 추가
		counts.push(item['COUNT(*)']); // y축에 사용할 레시피 수를 counts 배열에 추가
	});

	// Canvas 요소 가져오기
	var canvas = document.getElementById('recipeBarChart');
	var ctx = canvas.getContext('2d');

	// 막대 그래프 생성
	var recipeBarChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: labels, // x축 데이터
			datasets: [{
				label: '작성한 게시물 수', // 그래프의 레이블
				data: counts, // y축 데이터
				backgroundColor: 'rgba(54, 162, 235, 0.6)', // 막대의 배경색
				borderColor: 'rgba(54, 162, 235, 1)', // 막대의 테두리 색상
				borderWidth: 0.1 // 막대의 테두리 두께
			}]
		},
		options: {
			responsive: true,
			maintainAspectRatio: false, // 가로세로 비율 유지 비활성화
			legend: {
				display: false // 범례 표시 안 함
			},
			scales: {
				xAxes: [{ // x축 설정
					ticks: {
						beginAtZero: true, // x축의 값이 0부터 시작하도록 설정
						stepSize: 0.5 // 간격 설정
					}
				}],

				yAxes: [{ // y축 설정
					barThickness: 0.5, // 막대 두께
					maxBarThickness: 0.5, // 막대 최대 두께
					minBarLength: 1 // 막대 최소 길이
				}]
			},
			width: 100,
			height: 200
		}
	});
}

// 서버에서 데이터를 가져오고 차트를 그리는 함수 호출
$.ajax({
	url: '/admin/postRecipeUserCount', // 서버 URL
	type: 'GET',
	success: function(data) {
		drawChart(data); // 데이터를 받아서 차트를 그리는 함수 호출
	},
	error: function(error) {
		console.error(error);
	}
});

// 월매출
$.ajax({
	url: '/admin/monthlySales',
	type: 'GET',
	success: function(data) {
		displayMonthlySales(data);
	},
	error: function(error) {
		console.error(error);
	}
});

function displayMonthlySales(data) {
	var salesTableBody = document.getElementById('salesTableBody');
	salesTableBody.innerHTML = ''; 

	data.forEach(function(item) {
		var row = document.createElement('tr');
		row.innerHTML = '<td>' + item.MONTH + '</td><td>' + item.TOTALAMOUNT + '</td>';
		salesTableBody.appendChild(row);
	});
}



// 캘린더 ===============================
// scheduleList를 캘린더에 렌더링하는 함수
function fetchAndRenderSchedule() {
	$.ajax({
		url: '/admin/schedulelist',
		type: 'GET',
		success: function(response) {
			var events = convertScheduleListToEvents(response);
			renderCalendar(events); // 캘린더에 일정 데이터 렌더링
		},
		error: function(error) {
			console.error(error);
		}
	});
}

// schedultList를 events로 변환
function convertScheduleListToEvents(scheduleList) {
	var events = [];
	for (var i = 0; i < scheduleList.length; i++) {
		var schedule = scheduleList[i];
		events.push({
			title: schedule.subject,
			start: schedule.startDate,
			end: schedule.endDate
		});
			}
	return events;

}

// events를 캘린더에 렌더링하는 함수
function renderCalendar(events) {
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		events: events
	});
	calendar.render();
}


// 문서가 로드되면 캘린더를 렌더링하도록 설정
$(document).ready(function() {
	fetchAndRenderSchedule();
});

// 폼 제출 시
$('#scheduleForm').submit(function(event) {
	event.preventDefault(); // 기본 제출 방지

	var formData = $(this).serialize(); // 폼 데이터 직렬화
	$.ajax({
		type: 'POST',
		url: '/admin/addschedule', // 수정된 경로로 변경
		data: formData,
		success: function(response) {
			alert('일정이 추가되었습니다.');
			fetchAndRenderSchedule(); // 새로운 일정을 포함하여 캘린더를 다시 렌더링
			$('#scheduleForm')[0].reset(); // 폼 초기화
		},
		error: function(xhr, status, error) {
			alert('일정 추가 실패: ' + error);
		}
	});
});
