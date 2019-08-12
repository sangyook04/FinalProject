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
		<h1 class="sslh1">스터디 학생 목록</h1>
		<table class="table table-striped">
			<thead class="endssl">
				<tr>
					<th class="sslth1">이름</th><th class="sslth2">연락처</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${studentlist }" var="slist">
				<tr>
					<td class="ssltd1">${slist.stuName }</td>
					<td class="ssltd2">${slist.stuPhonenum }</td>
				</tr>
			</c:forEach>	
			</tbody>
		
		</table>
		
		<form action="/study/studyingList" method="get" id="listform">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"><!-- 보안토큰 -->	
		<input type="hidden" name="pageNum" value="${cri.pageNum }">
		<input type="hidden" name="amount" value="${cri.amount }">	
		
		</form>
		<button class="btn btn-primary" id="ssllistbtn">목록</button>
		</div>
		
		
		
<script>

var listform = $("#listform");
var studyState = "${param.studyState}";

$("#ssllistbtn").on("click",function(e){
	if(studyState == "종료"){
		listform.attr("action","/study/endStudyList");
		listform.submit();
	}else if(studyState == "st종료"){
		listform.attr("action","/study/stendStudyList");
		listform.submit();
	}else if(studyState == "st진행"){
		listform.attr("action","/study/stStudyingList");
		listform.submit();
	} 
	else{
		listform.submit();	
	}
	
});

$("#ssllistbtn").on("click",function(e){
		listform.submit();	
	
	
});




</script>

		</div><!-- container -->
		<%@ include file="../common/footer.jsp" %>
	</div><!-- wrap -->
</body>
</html>