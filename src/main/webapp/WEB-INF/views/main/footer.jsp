<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
		@media (max-width: 768px) {
	    .footer-bottom {
	        flex-direction: column;
	        align-items: flex-start; /* 화면이 작을 때 항목들을 세로로 정렬 */
	    }
	    .footer-logo, .footer-contact {
	        margin-bottom: 20px; /* 로고 및 연락처 영역에 하단 마진 추가 */
	    }
	    .footer-contact {
	        padding-left: 0; /* 모바일 뷰에서는 좌측 패딩 제거 */
	    }
	}
	@import url('https://fonts.googleapis.com/icon?family=Material+Icons');
	@import "bootstrap/scss/bootstrap";

	.footer {
			margin-top:5%;
            background-color: #f2f2f2;
            color: #333;
            font-family: 'Arial', sans-serif;
            padding: 20px 0;
            font-size: 14px;
            border-top: 1px solid rgb(189, 189, 189);
        }
        .footer-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            padding: 0px 30px;
        }
        .footer-left,
        .footer-right {
            display: flex;
            flex-direction: column;
        }
        .footer-left h3 {
            margin: 0;
            font-size: 20px;
            font-weight: normal;
            color: #333;
        }
        .footer-left .contact-info,
        .footer-left .contact-details {
            margin: 10px 0;
        }
        .footer-left .contact-details {
            font-size: 12px;
            line-height: 1.5;
        }
        .footer-right {
            text-align: right;
        }
        .social-icons {
            font-size: 24px;
            display: flex;
            justify-content: flex-end;
        }
        .social-icons a {
            margin-left: 10px;
            color: #333;
            text-decoration: none;
        }
        .footer-bottom {
            text-align: center;
            margin-top: 20px;
            border-top: 1px solid #e0e0e0;
            padding-top: 10px;
        }
        .footer-bottom p {
            margin: 5px 0;
            font-size: 12px;
        }
        .copyright {
            margin-top: 10px;
            font-size: 12px;
            justify-content: center; /* 가로 내용 중앙 정렬 */       
            padding: 0px 60px; 
            margin: 0 auto;
            
        }
        .contact-center {
	        text-align: center; /* 텍스트 중앙 정렬 */
	        display: flex;
	        justify-content: center; /* 가로 내용 중앙 정렬 */
	        align-items: center; /* 세로 내용 중앙 정렬 */
	        flex-direction: column; /* 요소들을 세로로 배치 */
	        margin-top: 30px;
		}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<footer class="footer">
        <div class="footer-container">
            <div class="footer-left">
                <h3>고객센터</h3>
                <div class="contact-info">1566 - 9564</div>
                <div class="contact-details">
                    <p>운영시간: 평일 10:00 - 17:00 / 점심, 공휴일 휴무</p>
                    <p>1:1문의: 09:00 - 12:00, 13:00 - 17:30 / 주말, 공휴일 휴무</p>
                    <p>이메일: tasttytrove@trove.net</p>
                </div> 
            </div>
            <div class="contact-center">
                <p>주소: (31144) 충남 천안시 동남구 대흥로 215 7층</p>
                <p>사업자등록번호: 667-81-02135</p>
                <p>팩스 041-561-1126</p>
            </div>
            <div class="footer-right">
                <div class="social-icons">
                    <!-- 실제 링크와 아이콘으로 교체 필요 -->
                    <a href="#" aria-label="YouTube"><i class="bi bi-youtube"></i></a>
                    <a href="#" aria-label="Instagram"><i class="bi bi-instagram"></i></a>
                    <a href="#" aria-label="Facebook"><i class="bi bi-facebook"></i></a>
                    <a href="#" aria-label="Twitter"><i class="bi bi-twitter"></i></a>
                    <a href="#" aria-label="Blog"><i class="bi bi-blogger"></i></a>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            
        </div>
        <div class="copyright">
            Ⓒ 2023 TastyTrove. ALL RIGHTS RESERVED Design 
        </div>
    </footer>
</body>
</html>