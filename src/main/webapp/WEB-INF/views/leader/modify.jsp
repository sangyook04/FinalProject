<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,user-scalable=no,initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Final Project_leaderInfoModify</title>
<!-- CSS -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<script src="../../../resources/lib/jquery/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/common.css">
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/main2.css">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700"
	rel="stylesheet">

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

<script>
	$(function(){
		var formObj = $("form");
		
		$('button').on("click", function(e){
			e.preventDefault();
			
			var operation = $(this).data("oper");
			
			console.log(operation);
			
			if(operation === 'close'){
				self.location = "/leader/info?leaId=<c:out value="${ leader.leaId }"/>";
				return
			}
			formObj.submit();
		});
	});
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
			<div class="inner">
				<div class="content">
					<div class="infoContent">
						<form role="form" action="/leader/modify" method="post">
							<div class="img"><img src="../../../resources/img/GumonMain/user123.jpg"></div>
							<div class="info">아이디</div>
							<div class="userInfo"><c:out value="${ leader.leaId }"/></div>
							<div class="info">비밀번호 수정</div>
							<div class="userInfo"><input type="password" placeholder="비밀번호" class="joinInput"><input type="password" placeholder="비밀번호 확인" class="joinInput"></div>
							<div class="info">이름</div>
							<div class="userInfo"><c:out value="${ leader.leaName }"/></div>
							<div class="info">성별</div>
							<div class="userInfo"><c:out value="${ leader.leaGender }"/></div>
							<div class="info">국적</div>
							<div class="userInfo">추가하자!~!~!</div>
							<div class="info">주소</div>
							<div class="userInfo"><input type="text" placeholder="주소" class="joinInput1"><input type="text" placeholder="주소" class="joinInput"><button id="btn">주소찾기</button></div>
							<div class="info">연락처</div>
							<div class="userInfo"><input type="tel" placeholder="연락처" class="joinInput2"><span class="joinText">-</span><input type="tel" placeholder="연락처" class="joinInput2"><span class="joinText">-</span><input type="tel" placeholder="연락처" class="joinInput2"></div>
							<div class="info">이메일</div>
							<div class="userInfo"><input type="text" placeholder="이메일" class="joinInput1"><span class="joinText">@</span><input type="text" placeholder="이메일" class="joinInput1"></div>
							<div class="info">계좌번호</div>
							<div class="userInfo"><select class="joinInput2">
													<option>국민은행</option><option>신한은행</option><option>우리은행</option><option>기업은행</option></select>
													<input type="text" placeholder="계좌번호" class="joinInput" value="<c:out value="${ leader.leaAccount }"/>"></div>
							<div class="info">자기소개</div>
							<div class="userInfo"><textarea class="joinInput3"><c:out value="${ leader.leaIntroduce }"/></textarea></div>
		
							<button type="submit" data-oper="modify" id="modBtn">확인</button><button type="submit" data-oper="close" id="closeBtn">취소</button>
						</form>
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
								src="../../../resources/img/GumonMain/img_sns_instar.png" alt="인스타"></a>
							<a href="#" target="_blank"><img
								src="../../../resources/img/GumonMain/img_sns_blog.png" alt="블로그"></a>
							<a href="#" target="_blank"><img
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