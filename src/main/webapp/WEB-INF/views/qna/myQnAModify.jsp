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
	<script src="../../../resources/lib/jquery/jquery-3.4.1.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
   <link rel="stylesheet" type="text/css" href="../../../resources/css/common.css">
   <link rel="stylesheet" type="text/css" href="../../../resources/css/leastuQnA.css">
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
						<div class="mainlogo"><a href="#"></a></div>
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
				<h1>내 문의 수정</h1>
				<div class="QnAWrap">
					<form class="QnAModifyForm" action="/qna/modify" method="post">
					  <div class="form-group">
					    <label for="QnAModifyGetNo">번호</label>
					    <input type="text" class="form-control" id="QnAModifyGetNo" name="qnaIndex" placeholder="번호" readonly="readonly" value="${qna.qnaIndex}">
					  </div>
					  <div class="form-group">
					    <label for="QnAModifyTitle">제목</label>
					    <input type="text" class="form-control" id="QnAModifyTitle" name="qnaTitle" placeholder="제목" value="${qna.qnaTitle}">
					  </div>
					  <div class="form-group">
					    <label for="QnAModifyDate">날짜</label>
					    <input type="text" class="form-control" id="QnAModifyDate" name="qnaDate" placeholder="날짜" readonly="readonly" value="${qna.qnaDate}">
					  </div>
					  <div class="form-group">
					    <label for="QnAModifyDate">작성자</label>
					    <input type="text" class="form-control" id="QnAModifyDate" name="qnaWriter" placeholder="작성자" readonly="readonly" value="${qna.qnaWriter}">
					  </div>
					  <div class="form-group">
					    <label for="QnAModifyContent">내용</label>
					    <textarea class="form-control" id="QnAModifyContent" name="qnaContent" placeholder="내용" style="resize: none">${qna.qnaContent}</textarea>
					  </div>
					  <button type="submit" data-oper="modify" id="modifyOK" class="btn btn-default">확인</button>
					  <button type="button" id="cancel" class="btn btn-default">취소</button>
					</form>
				</div>
			</div><!-- inner -->
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
		                    <a href="#" target="_blank"><img src="../../../resources/img/GumonMain/img_sns_instar.png" alt="인스타"></a>
		                    <a href="#" target="_blank"><img src="../../../resources/img/GumonMain/img_sns_blog.png" alt="블로그"></a>
		                    <a href="#" target="_blank"><img src="../../../resources/img/GumonMain/img_sns_facebook.png" alt="페이스북"></a>
		                    <a href="#" target="_blank"><img src="../../../resources/img/GumonMain/img_sns_kakaostory.png" alt="카카오스토리"></a>
		                </div>
					</div>
				</div>
				<div class="copyright">Copyrightⓒ AGUMON. All Right Reserved</div>
			</div><!-- inner -->
		</footer>
	</div><!-- wrap -->
</body>
<script>

	$("#cancel").on("click", function(e){
		
		var QnAModifyGetNo = $("#QnAModifyGetNo").val();
		location.href = "/qna/get?qnaIndex="+QnAModifyGetNo;
	});

</script>
</html>