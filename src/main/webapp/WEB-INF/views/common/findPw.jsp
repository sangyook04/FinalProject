<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,user-scalable=no,initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Final Project_findPw</title>
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
</head>
<body>
	<div id="wrap">
		<%@ include file="../common/header.jsp" %>
		<div id="container">
			<div class="inner">
				<div class="content">
					<h1>비밀번호 찾기</h1>
					<div class="chkPw">
						<form>
							<div class="textInput"><input type="text" placeholder="이름을 입력해주세요"></div>
							<div class="textInput"><input type="tel" placeholder="아이디를 입력해주세요"></div>
							<div class="textInput"><input type="text" placeholder="회원가입시 등록한 전화번호를 입력해주세요"></div>
							<div class="textInput"><input type="button" value="확인" class="loginBtn"></div>
						</form>
					</div>
						
					<div class="chgPw">
						<div class="textInput"><input type="tel" placeholder="새로운 비밀번호를 입력해주세요."></div>
						<div class="textInput"><input type="text" placeholder="새로운 비밀번호를 다시 입력해주세요"></div>
						<div class="textInput"><input type="button" value="비밀번호 변경" class="loginBtn"></div>
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