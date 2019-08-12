<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width,user-scalable=no,initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="stylesheet" type="text/css" href="../../resources/css/headerfooter.css">
   <title>Final Project</title>
   <!-- CSS -->
   <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<script src="../../resources/lib/jquery/jquery-3.4.1.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
   <link rel="stylesheet" type="text/css" href="../../resources/css/common.css">
   <link rel="stylesheet" type="text/css" href="../../resources/css/main.css">
   <link rel="stylesheet" type="text/css" href="../../resources/css/study.css">
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
		<%@ include file="../common/header.jsp" %>
		<div id="container">
		
		<div class="inner">
			<h1 class="recommend">관심 스터디 목록 </h1>
			
			<c:forEach items="${stuid}" var="stuid">
			
			
			<div class="list">
			
			<div class="listtext">
			<span>${stuid.studyStartdate} </span> ~ <span>${stuid.studyEnddate} </span>
			<hr>
			<span>${stuid.studyPlace} </span>  |<span>${stuid.studyLevel}</span>
			<a>${stuid.studyName}</a>
			<span>${stuid.studyPrice} 원</span>
			</div>
			<div class="listimg">
			<!-- <img class="listimg" src="/img\2019\08\06\cd43d15d-bdb1-4d62-ae15-d43b933c1752 _1000003.jpg"> -->
			<img class="listimg" id="leaid">
			<input type="hidden" id="data1" value="${stuid.picturevo.uploadPath }">
			<input type="hidden" id="data2" value="${stuid.picturevo.uuid }">
			<input type="hidden" id="data3" value="${stuid.picturevo.fileName }">
			<a class="btn btn-danger" id="delbtn">삭제</a>
			</div> <!-- end listtext -->
			
			</div><!-- end list -->
			
			</c:forEach>
				
		</div>

<script>
(function(){	
	
	var data1 = $("#data1").val();
	var data2 = $("#data2").val();
	var data3 = $("#data3").val();
	document.getElementById('leaid').src = "/img\\"+data1+"\\"+data2 +"_"+ data3 ;
})();
</script>


		</div><!-- container -->
		
<%@ include file="../common/footer.jsp" %>
	</div><!-- wrap -->
</body>
</html>