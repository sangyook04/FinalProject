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
						<input type="date" id="start" name="start" class="form-control">
						 ~ 
						<span class="glyphicon glyphicon-calendar"></span>
						<input type="date" id="end" name="end" class="form-control">
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
		                   <c:forEach items="${list}" var="income">
		                   	<tr>
			                   <td>${income.payMoney}</td>
			                   <td>${income.paySendDate}</td>
			                   <td>${income.study.studyName}</td>
			                   <td>${income.paySendDate == null ? "지급 전":"지급완료" }</td>
		                   	</tr>
		                   </c:forEach>
		                   </tbody>
						</table>
						
						<!-- 페이징 -->
						<div class="pull-center">
						<ul class="pagination">
						<!-- previous 버튼 표시 -->
						<c:if test="${pageMaker.prev }">	
							<li class="paginate_button previous">
								<a href="${pageMaker.startPage -1}">이전으로</a>
							</li>
						</c:if>
							
						<!-- 페이지 번호 표시 -->
						<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
							<li class='paginate_button ${pageMaker.cri.pageNum == num ? "active":"" } '>
							<a href="${num}"> ${num} </a></li>
						</c:forEach>
						<!-- next 버튼 표시 -->
						<c:if test="${pageMaker.next }">	
							<li class="paginate_button next">
								<a href="${pageMaker.endPage +1 }">다음으로</a>
							</li>
						</c:if>
						</ul>
						</div>
						<!-- END 페이징  -->
					</div>
				</form>
				<!-- 액션폼 -->
				<form id='actionForm' action="/pay/incomeList" method="get">
					<input type="hidden" name="leaderId" value="${leaderId }">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
				</form>
				<!-- 검색폼 -->
				<form id='searchForm' action="/pay/incomeList" method="get">
					<input type="hidden" name="leaderId" value="${leaderId }">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
					<input type="hidden" name="start" value="${pageMaker.cri.start }">
					<input type="hidden" name="end" value="${pageMaker.cri.end }">
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
<script>
var actionForm = $("#actionForm");
var searchForm = $("#searchForm");

//페이지 이동
$(".paginate_button a").on("click", function(e){
	e.preventDefault();

	actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	
	actionForm.submit();
});

//end 달력 클릭시 조회
$("#end").on("change", function(e){
	if($("#start").val() == ""){
		alert("시작 날짜를 입력해주세요.");
	}
	else if($("#start").val() > $(this).val()){
		alert("날짜 선택이 잘못되었습니다.");
		$("#start").val(""); //시작날짜칸 비우기
		$(this).val(""); //종료날짜칸 비우기
	}
	else {
		searchForm.find("input[name='start']").val($("#start").val());
		searchForm.find("input[name='end']").val($("#end").val());
		searchForm.submit();
	}
});
</script>
</body>
</html>