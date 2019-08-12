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
   <title>Final Project</title>
   <!-- CSS -->
   <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<script src="../../../resources/lib/jquery/jquery-3.4.1.min.js"></script>
   <link rel="stylesheet" type="text/css" href="../../../resources/css/common.css">
   <link rel="stylesheet" type="text/css" href="../../../resources/css/main3.css">
   <link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700" rel="stylesheet">
<!-- 부트스트랩 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
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
					 <h1><b>레벨 테스트 결과</b></h1>
				<div class="content">
					
						<div class="level"> <b>${stuLevel.stuId}</b> 회원님은  <span class="levelResult"><b>${stuLevel.stuLevel }</b></span>  입니다.</div> <br>
				
          		 	
					
						
						<button class="recommend"  data-oper="recommendStudy" ><b>추천 스터디 목록 보기</b></button><br>
						<button class="reTest"  data-oper="reTest"><b>재시험</b>	</button>
					
					
					
				   <form id="operForm" action="/study/recommend" method="get">
					<input type="hidden" id="stuId" name="stuId"
						value="${stuLevel.stuId}">
				</form> 
				 <form id="operForm2" action="/level/commonTest" method="get">
					<input type="hidden" id="stuId" name="stuId"
						value="${stuLevel.stuId}">
				</form> 
         
				</div>
			</div>
		</div><!-- container -->
	
<%@ include file="../common/footer.jsp" %>
	</div><!-- wrap -->
	
	<script>
		$(function() {
			var operForm = $("#operForm");
			var operForm2 = $("#operForm2");
			

			//추천 스터디 및 재시험 페이지 이동
			
			$('button[data-oper="recommendStudy"]').on("click", function(e) {
				operForm.attr("action", "/study/recommend").submit();
			});
			
			
			$('button[data-oper="reTest"]').on("click", function(e) {
				operForm2.attr("action", "/level/commonTest").submit();
			});
			
			
			
		});
		
		
		
	</script>
	
	
	
	
</body>
</html>