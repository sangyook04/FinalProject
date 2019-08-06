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
   <link rel="stylesheet" type="text/css" href="../../resources/css/common.css">
   <link rel="stylesheet" type="text/css" href="../../resources/css/main.css">
   <link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700" rel="stylesheet">
   
   <!-- 부트스트랩 -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
   
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
   
    
<link rel="stylesheet" type="text/css" href="../../../resources/css/tableEllipsis.css">    
<style>
	#container .inner{
    text-align: center;
    }
    
    #container .inner h1{
    margin: 100px 0px 50px 0px;
    }
	
	.inner h2 {
	text-align: left;
	}
</style>
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
<!-- End Header -->

		<div id="container">
		<!-- <div class="sidenav">사이드바</div> -->
			<div class="inner">
				<h1>내 결제 내역</h1>
				<form>
					<h2>구매한 스터디 목록</h2>
					<div class="purchaseList">
						<table class="table table-striped table-bordered table-hover">
							<thead>
		                       <tr>
		                           <th>스터디명<!-- Rendering engine --></th>
		                           <th>기간<!-- Browser --></th>
		                           <th>레벨<!-- Platform(s) --></th>
		                           <th>장소<!-- Engine version --></th>
		                           <th>가격<!-- Engine version --></th>
		                       </tr>
		                   </thead>
		                   <tbody>
		                   <c:forEach items="${list }" var="payment" >
			                   <tr>
			                   <td><a href="#">${payment.study.studyName}</a></td>
			                   <td>${payment.study.studyStartdate} ~ ${payment.study.studyEnddate}</td>
			                   <td>${payment.study.studyLevel}</td>
			                   <td>${payment.study.studyPlace}</td>
			                   <td>${payment.study.studyPrice}</td>
			                   </tr>
			               </c:forEach>
		                   </tbody>
						</table>
					</div>
					<br>
					<h2>환불/취소한 스터디 목록</h2>
					<div class="cancleList">
						<table class="table table-stripped table-bordered table-hover">
							<thead>
		                       <tr>
		                           <th>스터디명<!-- Rendering engine --></th>
		                           <th>기간<!-- Browser --></th>
		                           <th>레벨<!-- Platform(s) --></th>
		                           <th>장소<!-- Engine version --></th>
		                           <th>가격<!-- Engine version --></th>
		                           <th>진행상태</th>
		                       </tr>
		                   </thead>
		                   <tbody>
			               <c:forEach items="${refundList }" var="refund" >
			                   <tr>
			                   <td><a href="#">${refund.study.studyName}</a></td>
			                   <td>${refund.study.studyStartdate} ~ ${refund.study.studyEnddate}</td>
			                   <td>${refund.study.studyLevel}</td>
			                   <td>${refund.study.studyPlace}</td>
			                   <td>${refund.study.studyPrice}</td>
			                   <td>${refund.refund.refState}</td>
			                   </tr>
			               </c:forEach>
		                   </tbody>
						</table>
					</div>
				</form>
			</div><!-- End inner -->
		</div><!-- container -->
		
<!-- Start Footer -->
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