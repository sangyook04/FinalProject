<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>      
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
		
			<div>
			<img class="imgplace" id="leaid">
			<input type="hidden" id="data1" value="${list.picturevo.uploadPath }">
			<input type="hidden" id="data2" value="${list.picturevo.uuid }">
			<input type="hidden" id="data3" value="${list.picturevo.fileName }">
			</div>
			<div>
			<h2 class="h2">${list.studyName}</h2>
			<hr>
			<h3 class="h3">스터디 소개</h3>
			
			<p>${list.studyIntroduce }</p>
			<hr>
			
			<h3 class="h3">상세 정보</h3>
			<table class="table table-bordered" id="table">
				<thead>
					<tr>
						<td>지역</td><td>인원</td><td>시작 날짜</td><td>종료 날짜</td><td>가격</td><td>스터디 시간</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${list.studyPlace }</td><td>${list.studyPeople }</td><td>${list.studyStartdate }</td><td>${list.studyEnddate }</td><td>${list.studyPrice }</td><td>${list.studySTime } ~ ${list.studyETime }</td>
					</tr>
				</tbody>
			</table>
			
			<button class="btn btn-primary">스터디 참여 신청하기</button>
			<button class="btn btn-warning">찜하기</button>
			
			<hr>
			<h3 class="h3">리더 소개</h3>
			
			<p>${list.leaderVO.leaIntroduce }</p>
			<hr>
			<h3 class="h3">리더 점수 및 후기</h3>
			<span class="lea">총 평점 </span><span class="lea">${list.leaderReviewVO.revGrade}</span> 
			<hr>
			
			<table class="table table-striped" id="table">
				<%-- <c:forEach items="${reviewlist}" var="review">
				<thead>
					<tr>
						<td class="nametd">이름</td><td>후기</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${review.stuId }</td><td>${review.revComment }</td>
					</tr>
				</tbody>
				</c:forEach> --%>
			</table>
			
			
			
			</div>
			
		</div>
<script>
(function(){	
	var data1 = $("#data1").val();
	var data2 = $("#data2").val();
	var data3 = $("#data3").val();
	document.getElementById('leaid').src = "/img\\"+data1+"\\"+data2 +"_"+ data3 ;
})();





</script>
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