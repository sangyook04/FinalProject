<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width,user-scalable=no,initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <title>Final Project_login</title>
   <!-- CSS -->
   <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<script src="../../../resources/lib/jquery/jquery-3.4.1.min.js"></script>
   <link rel="stylesheet" type="text/css" href="../../../resources/css/common.css">
   <link rel="stylesheet" type="text/css" href="../../../resources/css/main2.css">
   <link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700" rel="stylesheet">
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
					<h1>로그인</h1>
					<div class="msg"><c:out value="${ msg }"/><c:out value="${ logout }"/></div>
					<form method="post" action="/login">
						<div class="loginInput"><input type="text" name="username" placeholder="아이디" autofocus></div>
						<div class="loginInput"><input type="password" name="password" placeholder="비밀번호"></div>
						<div class="find"><a href="/common/findId">아이디 찾기</a>/<a href="/common/findPw">비밀번호 찾기</a></div>
						<div class="loginInput"><input type="submit" value="LOGIN" class="loginBtn"></div>
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
					</form>
				</div>
			</div>
		</div>
		<!-- container -->
		<%@ include file="../common/footer.jsp" %>
	</div>
	<!-- wrap -->
</body>
</html>