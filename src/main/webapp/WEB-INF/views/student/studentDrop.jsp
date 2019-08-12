<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width,user-scalable=no,initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <title>Final Project_leaderWithdrawal</title>
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
				
				 <form role="form" action="/student/studentDrop" method="post">
				   <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
					<h1>회원 탈퇴</h1>
					<div class="withInfo">스터디가 시작 예정이거나 진행중인 경우 탈퇴를 할 수 없습니다. <br>탈퇴를 진행하시겠습니까?</div>
					<button data-oper="drop" id="dropBtn" style=" font-weight:bold; color: white; padding:15px; background:red; border-radius: 5px;">탈퇴하기</button>
					</form>
					<form id="LogOutForm" action="/logout" method="POST">
      			 		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    				</form>
				</div>
			</div>
		</div><!-- container -->
		<%@ include file="../common/footer.jsp" %>
	</div><!-- wrap -->
	
		<script>
	$(function() {
		
		var formObj = $("form");
		var LogOutForm = $("LogOutForm");
		
		
			//modify
			$('button').on("click", function(e){
				e.preventDefault();
				var operation = $(this).data("oper");
				
				 if(operation === 'drop'){
					
					
					 var conf = confirm("정말 탈퇴 하시겠습니까?");
				      alert(conf);   	  	
				}
				
				formObj.submit();
				LogOutForm.submit();
			});
			
		});
	</script>
	
	
	
</body>
</html>