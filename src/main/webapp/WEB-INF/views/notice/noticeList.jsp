<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,user-scalable=no,initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Final Project</title>
<!-- CSS -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<script src="../../../resources/lib/jquery/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/common.css">
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/main3.css">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700"
	rel="stylesheet">


<!--부트스트랩 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<script>
	$(document).ready(function() {

		$('nav .one').hover(function() {
			if ($(".callsenterSub").css("display") == "none") {
				$('.callsenterSub').slideDown();
				$("headerA").css("color", "#f15b6d");
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
								</ul></li>
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

			<div class="innerNotice">

			
			<div class="inner">
				<h2>
					<b>공지사항</b>
				</h2>
				<div class="noticeTable">
					
						<table class="table table-hover tablenoticeContent">
							<thead>
								<tr>
									
									<th scope="col">번호</th>
									<th scope="col">제목</th>
									<th scope="col">날짜</th>

								</tr>
							</thead>
							  <tbody>
                   <!-- Model 데이터 출력 -->
                   <c:forEach items="${noticeList }" var="notice">
                   	   <tr><td>${notice.notIndex}</td>
                   	   	   <td><%-- 게시물 조회 페이지 이동 --%>
                   	   	   	   <a class="move" href="${notice.notIndex}">
                   	   	   	   	${notice.notTitle}
                   	   	       </a></td>
                   	   	  
                   	   	   <%-- <td><fmt:formatDate value="${board.regdate}"
                   	   	   					   pattern="yyyy-MM-dd"/></td>
                   	   	   <td><fmt:formatDate value="${board.updateDate}"
                   	   	   					   pattern="yyyy-MM-dd"/></td> --%>
                   	   </tr>
                   </c:forEach>
                   </tbody>
							<!-- <tbody>
								<tr>
									<th scope="row">10</th>
									<td><button id="notice">공지사항10</button></td>
									<td>2019-07-10</td>
								<tr>
									<th scope="row">9</th>
									<td>공지사항9</td>
									<td>2019-07-10</td>


								</tr>
								<tr>
									<th scope="row">8</th>
									<td>공지사항8</td>
									<td>2019-07-10</td>

								</tr>
								<tr>
									<th scope="row">7</th>
									<td>공지사항7</td>
									<td>2019-07-10</td>

								</tr>
								<tr>
									<th scope="row">6</th>
									<td>공지사항6</td>
									<td>2019-07-10</td>

								</tr>
								<tr>
									<th scope="row">5</th>
									<td>공지사항5</td>
									<td>2019-07-10</td>

								</tr>
								<tr>
									<th scope="row">4</th>
									<td>공지사항4</td>
									<td>2019-07-10</td>

								</tr>
								<tr>
									<th scope="row">3</th>
									<td>공지사항3</td>
									<td>2019-07-10</td>

								</tr>
								<tr>
									<th scope="row">2</th>
									<td>공지사항2</td>
									<td>2019-07-10</td>

								</tr>
								<tr>
									<th scope="row">1</th>
									<td>공지사항1</td>
									<td>2019-07-10</td>

								</tr>

							</tbody> -->
						</table>
					</div>
				
				<div class="page">
					<nav aria-label="...">
						<ul class="pagination">
							<li class="page-item disabled"><a class="page-link" href="#"
								tabindex="-1" aria-disabled="true">Previous</a></li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item active" aria-current="page"><a
								class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
							</li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">Next</a>
							</li>
						</ul>
					</nav>
				</div>

			</div>
		</div>
		</div>
		
		<!-- container -->
		<footer>
			<div class="inner">
				<div class="footArea">
					<div class="footerLeft">
						<div class="callNumber">
							<b>고객센터</b><strong> 1588-0000</strong> 평일 09:00~18:00(공휴일 제외)
						</div>
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
							<a href="#" target="_blank"><img
								src="../../../resources/img/GumonMain/img_sns_instar.png"
								alt="인스타"></a> <a href="#" target="_blank"><img
								src="../../../resources/img/GumonMain/img_sns_blog.png"
								alt="블로그"></a> <a href="#" target="_blank"><img
								src="../../../resources/img/GumonMain/img_sns_facebook.png"
								alt="페이스북"></a> <a href="#" target="_blank"><img
								src="../../../resources/img/GumonMain/img_sns_kakaostory.png"
								alt="카카오스토리"></a>
						</div>
					</div>
				</div>
				<div class="copyright">Copyrightⓒ AGUMON. All Right Reserved</div>
			</div>
			<!-- inner -->
		</footer>
	</div>
	<!-- wrap -->
</body>
</html>