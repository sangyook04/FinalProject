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
   
    
    
<style>
	#container .inner{
    text-align: center;
    }
    
    #container .inner h1{
    margin: 100px 0px 50px 0px;
    }

	.calender {
	height: 70px;
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
				<h1>소득 내역</h1>
				<form>
					<div class="form-group form-inline calender">
						<span class="glyphicon glyphicon-calendar"></span>
						<input type="date" id="start" class="form-control">
						 ~ 
						<span class="glyphicon glyphicon-calendar"></span>
						<input type="date" id="end" class="form-control">
					</div>
					<div class="incomeList">
						<table class="table table-striped table-bordered table-hover">
							<thead>
		                       <tr>
		                           <th>금액<!-- Rendering engine --></th>
		                           <th>날짜<!-- Browser --></th>
		                           <th>스터디명<!-- Platform(s) --></th>
		                           <th>지급상태<!-- Engine version --></th>
		                       </tr>
		                   </thead>
		                   <tbody>
		                  <%--  <!-- Model 데이터 출력 -->
		                   <c:forEach items="${list }" var="board">
		                   	   <tr><td>${board.bno }</td>
		                   	   	   <td>게시물 조회 페이지 이동
		                   	   	   	   <a class="move" href="${board.bno}">
		                   	   	   	   	${board.title }
		                   	   	   	   	<!-- 댓글 갯수 표시 -->
		                   	   	   	   	[${board.replyCnt }]</a></td>
		                   	   	   <td>${board.writer}</td>
		                   	   	   <td><fmt:formatDate value="${board.regdate}"
		                   	   	   					   pattern="yyyy-MM-dd"/></td>
		                   	   	   <td><fmt:formatDate value="${board.updateDate}"
		                   	   	   					   pattern="yyyy-MM-dd"/></td>
		                   	   </tr>
		                   </c:forEach> --%>
		                   
		                   	<tr>
			                   <td>240000</td>
			                   <td>2019.06.17</td>
			                   <td>영어가 안되면 시원스콜피온닷컴</td>
			                   <td>지급 완료</td>
		                   	</tr>
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