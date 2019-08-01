<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width,user-scalable=no,initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">

   <title>Final Project</title>
   <!-- CSS -->
   <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<script src="../../resources/lib/jquery/jquery-3.4.1.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
   <link rel="stylesheet" type="text/css" href="../../resources/css/common.css">
   <link rel="stylesheet" type="text/css" href="../../resources/css/main.css">
   <link rel="stylesheet" type="text/css" href="../../resources/css/study.css">
   <link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700" rel="stylesheet">

  
   <script>
   		$(document).ready(function(){

			$('nav .one').hover(function () {
			    if($(".callsenterSub").css("display") == "none"){
			       $('.callsenterSub').slideDown();
			       $("headerA").css("color","#f15b6d");
			       event.preventDefault();
			    } else {
			       $('.callsenterSub').css("display", "none");
			    }
			});

		});//ready
   </script>
</head>
<body>
	<div id="wrap">
		<header>
			<nav>
				<div class="inner">
					<div class="headerContent">
						<div class="mainlogo"></div>
						<ul class="mainmenu">
							<li><a href="#">스터디 찾기</a></li>
							<li><a href="#">레벨 테스트</a></li>
							<li><a href="#">공지사항</a></li>
							<li class="one"><a href="#">고객센터</a>
								<ul class="callsenterSub">
								
									<li><a href="#">FAQ</a></li>
									<li><a href="#">QnA</a></li>
								</ul>
							</li>
						</ul>
						<ul class="gnb">
							<li><a href="#">로그인</a></li>
							<li><a href="#">학생 회원가입</a></li>
							<li><a href="#">리더 시작하기</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</header>
		<div id="container">
		
		<div class="inner">
			 
			
			<div><!-- 총괄div -->
			
			<div class="kimchiimg"><!-- 사진 -->
				<img class="kimchi" src="../../resources/img/doyouknowkimch.png">
				<p class="ptitle">다양한 영어 회화 스터디</p>
			</div>
			
			<div class="filter"><!-- 필터 -->
				<form method="post">
					
				<label for="select">스터디 레벨</label>
				<select id="select">
				<option>초급</option>
				<option>중급</option>
				<option>고급</option>
				</select>
			
			
 			 <label for="starttime">시작 시간</label>
 			 <select id="starttime">
			<option>08:00</option>
			<option>09:00</option>
			<option>11:00</option>
			<option>12:00</option>
			<option>13:00</option>
			<option>14:00</option>
			<option>15:00</option>
			<option>16:00</option>
			<option>17:00</option>
			<option>18:00</option>
			<option>19:00</option>
			<option>20:00</option>
			<option>21:00</option>
			<option>22:00</option>
			<option>23:00</option>
			<option>24:00</option>
			</select>
			
			
			 
 			 <label for="endtime">종료 시간</label>
 			 <select id="endtime">
			<option>08:00</option>
			<option>09:00</option>
			<option>11:00</option>
			<option>12:00</option>
			<option>13:00</option>
			<option>14:00</option>
			<option>15:00</option>
			<option>16:00</option>
			<option>17:00</option>
			<option>18:00</option>
			<option>19:00</option>
			<option>20:00</option>
			<option>21:00</option>
			<option>22:00</option>
			<option>23:00</option>
			<option>24:00</option>
			</select>
			
 			 <label for="local">지역</label>
 			 <select id="local">
				<option>마포구</option>
				<option>영등포구</option>
				<option>양천구</option>
				<option>강서구</option>
				<option>동작구</option>
				<option>용산구</option>
				<option>중구</option>
				<option>서대문구</option>
				<option>종로구</option>
				<option>성동구</option>
				<option>강남구</option>
				<option>서초구</option>
				<option>관악구</option>
				<option>금천구</option>
				<option>구로구</option>
			</select>
				
				<button class="btn btn-warning">검색</button>
				</form>	
			</div>
			
			
			<div class="totallist">
			
			<div class="list">
			<div class="listtext">
			<span>2019-08-01</span> ~ <span>2019-08-01</span>
			<hr>
			<span>지역</span>  |<span>레벨</span>
			<a>제목제목제목제목제목제목제목제목제목제목제목</a>
			<span>가격</span>
			</div>
			<div class="listimg">
			<img class="listimg" src="../../resources/img/KisJamMain/인체아틀라스_배너.jpg">
			</div>
			</div>
			
			</div>
			
			</div><!-- div3개 합친거 -->
			
		</div>

		</div><!-- container -->
		<footer>
			<div class="inner">
				<div class="footArea">
					<div class="footerLeft">
						<div class="callNumber"><b>고객센터</b><strong> 1588-0000</strong> 평일 09:00~18:00(공휴일 제외)</div>
						<div class="footerinfo">
							<ul>
								<li><a href="#">개인정보 처리방침</a></li>
								<li><a href="#">서비스약관</a></li>
							</ul>
						</div>
						<address>서울특별시 마포구 서교동 447-5 풍성빌딩 쌍용강북교육센터</address>
					</div>
					<div class="footerRight">
						<div class="sns">
		                    <a href="#" target="_blank"><img src="../../resources/img/GumonMain/img_sns_instar.png" alt="인스타"></a>
		                    <a href="#" target="_blank"><img src="../../resources/img/GumonMain/img_sns_blog.png" alt="블로그"></a>
		                    <a href="#" target="_blank"><img src="../../resources/img/GumonMain/img_sns_facebook.png" alt="페이스북"></a>
		                    <a href="#" target="_blank"><img src="../../resources/img/GumonMain/img_sns_kakaostory.png" alt="카카오스토리"></a>
		                </div>
					</div>
				</div>
				<div class="copyright">Copyrightⓒ AGUMON. All Right Reserved</div>
			</div><!-- inner -->
		</footer>
	</div><!-- wrap -->
</body>
</html>