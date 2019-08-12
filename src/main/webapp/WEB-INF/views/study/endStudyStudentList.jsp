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
	<script src="../../resources/lib/jquery/jquery-3.4.1.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
   <link rel="stylesheet" type="text/css" href="../../resources/css/common.css">
   <link rel="stylesheet" type="text/css" href="../../resources/css/main.css">
   <link rel="stylesheet" type="text/css" href="../../resources/css/study.css">
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
		<h1 class="sslh1">수료한 스터디 학생 목록</h1>
		<table class="table table-striped">
			<thead class="endssl">
				<tr>
					<th class="sslth1">이름</th><th class="sslth2">연락처</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="ssltd1">이름들</td>
					<td class="ssltd2">연락처들</td>
				</tr>
			</tbody>
		
		</table>
		
		
		<button type="button" class="btn btn-primary" id="ssllistbtn">목록</button>
		</div>

		</div><!-- container -->
		<%@ include file="../common/footer.jsp" %>
	</div><!-- wrap -->
</body>
</html>