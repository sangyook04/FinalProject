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
<link rel="stylesheet" type="text/css" href="../../resources/css/headerfooter.css">

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
		<%@ include file="../common/header.jsp" %>
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
		<%@ include file="../common/footer.jsp" %>
	</div>
	<!-- wrap -->
</body>
</html>