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
   <!-- 부트스트랩 -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
   <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<script src="../../resources/lib/jquery/jquery-3.4.1.min.js"></script>
   <link rel="stylesheet" type="text/css" href="../../resources/css/common.css">
   <link rel="stylesheet" type="text/css" href="../../resources/css/main.css">
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
   
    
<link rel="stylesheet" type="text/css" href="../../../resources/css/tableEllipsis.css">    
<style>
	#container .inner{
    text-align: center;
    }
    
    #container .inner h1{
    margin: 100px 0px 50px 0px;
    }
	
	.inner h2 {
	text-align: left;
	}
</style>
</head>
<body>
	<div id="wrap">
		<%@ include file="../common/header.jsp" %>
<!-- End Header -->

		<div id="container">
		<!-- <div class="sidenav">사이드바</div> -->
			<div class="inner">
				<h1>환불 신청</h1>
					<div class="purchaseList">
						<table class="table table-striped table-bordered">
		                   <tbody>
			                   <tr>
				                   <td>스터디명</td>
				                   <td>${study.studyName}</td>
			                   </tr>
			                   <tr>
				                   <td>레벨</td>
				                   <td>${study.studyLevel}</td>
			                   </tr>
			                   <tr>
				                   <td>기간</td>
				                   <td>${study.studyStartdate} ~ ${study.studyEnddate}</td>
			                   </tr>
			                   <tr>
				                   <td>금액</td>
				                   <td>${study.studyPrice}</td>
			                   </tr>
		                   </tbody>
						</table>
						
					</div>
				<form id="refundForm" action="/pay/refund" method="post">
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"><!-- 보안토큰 -->
					<input type="hidden" name="payIndex" value=${payIndex }>
					<input type="hidden" name="studentId" value="rkdvnfms5">
					<button type="submit" id="refundBtn" class="btn btn-primary">환불 하기</button>
				</form>
			</div><!-- End inner -->
		</div><!-- container -->
		
<!-- Start Footer -->
		<%@ include file="../common/footer.jsp" %>
	</div><!-- wrap -->
<script>
</script>
</body>
</html>