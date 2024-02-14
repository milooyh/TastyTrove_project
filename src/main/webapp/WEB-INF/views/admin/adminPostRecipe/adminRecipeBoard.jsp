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
		<div class="content-title">레시피 목록</div>
		<hr>
		<div class="content-nav">
			<span>레시피게시판관리</span><span> - </span><span><a
				href="/admin/recipeboard">레시피목록</a></span><span> - </span><span><a
				href="/admin/recipeboard/search">레시피검색</a></span>
		</div>
		<hr>

		<table id="memberTable">
			<thead>
				<tr>
					<th>레시피번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일시</th>
					<th>카테고리</th>
					<th>카테고리수정</th>
					<th>레시피정보삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="recipe" items="${postRecipeList}">
					<tr>
						<td>${recipe.recipeId}</td>
						<td style="cursor: pointer">${recipe.recipeTitle}</td>
						<td>${recipe.memberId}</td>
						<td>${recipe.boardDate}</td>
						<form method="post" action="/admin/recipeboard/update">
							<td><select name="recipeType">
									<option value="KOR"
										<c:if test="${recipe.recipeType == 'KOR'}">selected</c:if>>
										한식</option>
									<option value="CHI"
										<c:if test="${recipe.recipeType == 'CHI'}">selected</c:if>>
										중식</option>
									<option value="JPN"
										<c:if test="${recipe.recipeType == 'JPN'}">selected</c:if>>
										일식</option>
									<option value="WTN"
										<c:if test="${recipe.recipeType == 'WTN'}">selected</c:if>>
										양식</option>
									<option value="DRT"
										<c:if test="${recipe.recipeType == 'DRT'}">selected</c:if>>
										디저트</option>
									<option value="ETC"
										<c:if test="${recipe.recipeType == 'ETC'}">selected</c:if>>
										기타</option>
							</select></td> <input type="hidden" name="recipeId" value="${recipe.recipeId}" />
							<td>

								<button type="submit"
									onclick="confirmModify(${recipe.recipeId})">수정하기</button>
							</td>
						</form>


						<td><button type="submit" onclick="confirmDelete(${recipe.recipeId})">삭제하기</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>

		<div class="pagination">
			<c:if test="${currentPage > 1}">
				<a href="javascript:void(0)" onclick="goToPage(${currentPage - 1})">이전</a>
			</c:if>

			<span>${currentPage} / ${totalPages}</span>

			<c:if test="${currentPage < totalPages}">
				<a href="javascript:void(0)" onclick="goToPage(${currentPage + 1})">다음</a>
			</c:if>
		</div>
	</div>

	<!-- 모달창 -->
	<div id="recipeModal" class="modal">
		<div class="modal-content">
			<div class="modal-title">레시피 상세 내용</div>
			<span class="close">&times;</span>
			<div id="recipeContent">${recipe.recipeContent}</div>
		</div>
	</div>

	<script>
		function goToPage(pageNumber) {
		    location.href = '/admin/recipeboard?page=' + pageNumber + '&pageSize=${pageSize}';
		}
		
    function confirmModify(recipeId) {
        var result = confirm("카테고리를 수정할까요?");
        if (result) {
            location.href = '/admin/recipeboard/update?recipeId=' + recipeId;
        }
        return result; 
    }

    function confirmDelete(recipeId) {
        var result = confirm("정말 삭제하시겠습니까?");
        if (result) {
            location.href = '/admin/recipeboard/remove?recipeId=' + recipeId;
        }
    }
    
 // 모달창 닫기 버튼 기능 구현
	var modal = document.getElementById('recipeModal');
	var closeButton = document.getElementsByClassName("close")[0];
	closeButton.onclick = function() {
		modal.style.display = "none";
	}

	// ESC 키를 눌렀을 때 모달창 닫기
	window.addEventListener("keydown", function(event) {
		if (event.key === "Escape") {
			modal.style.display = "none";
		}
	});
	
	// 테이블의 각 제목을 클릭했을 때 모달창 열기
	var recipeTitleCells = document.querySelectorAll("table tbody tr td:nth-child(2)");
	recipeTitleCells.forEach(function(cell) {
	    cell.addEventListener("click", function() {
	        var recipeId = this.parentNode.querySelector("td:first-child").textContent;
	        openRecipeModal(recipeId);
	    });
	    
	 // 툴팁 추가
		cell.addEventListener("mouseover", function(event) {
			var tooltip = document.createElement("div"); // 새로운 div 요소를 생성합니다.
			tooltip.textContent = "레시피상세내용보기"; // 툴팁에 표시할 내용을 설정합니다.
			tooltip.classList.add("tooltip"); // CSS 스타일링을 위해 클래스를 추가합니다.

			// 툴팁을 마우스 위치에 위치시킵니다.
			tooltip.style.position = "absolute";
			tooltip.style.top = event.clientY + 10 + "px";
			tooltip.style.left = event.clientX + 10 + "px";

			document.body.appendChild(tooltip); // 툴팁을 문서의 body에 추가합니다.

			// 마우스가 벗어날 때 툴팁을 제거합니다.
			cell.addEventListener("mouseout", function() {
				document.body.removeChild(tooltip); // 툴팁을 제거합니다.
			});
		});
	});

	// 모달창 열기 함수
	function openRecipeModal(recipeId) {
	    console.log("레시피 모달창 열기 함수 호출");
	    var modal = document.getElementById('recipeModal');
	    modal.style.display = "block";

	    console.log("모달창 열림");

	    // AJAX 요청을 통해 레시피 상세 정보 가져오기
	    $.ajax({
	        url: '/admin/recipeboard/details',
	        type: 'GET',
	        data: {
	            recipeId: recipeId
	        },
	        success: function(recipe) {
	            console.log(recipe);
	            document.getElementById('recipeContent').textContent = recipe.recipeContent;
	        },
	        error: function(error) {
	            console.error(error);
	        }
	    });
	}

</script>
</body>
</html>
