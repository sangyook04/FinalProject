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
   <link rel="stylesheet" type="text/css" href="../../../resources/css/common.css">
   <link rel="stylesheet" type="text/css" href="../../../resources/css/main.css">
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
    <link rel="stylesheet" type="text/css" href="../../../resources/css/test.css">
  
<style>
.answer {
margin-top: 50px;
}
</style>
</head>
<body>
	<div id="wrap">
		<%@ include file="../common/header.jsp" %>
<!-- End Header -->

		<div id="container">
			<div class="inner">
				<h1>레벨 테스트</h1>
				<div class="questionTitle">${TestNum}. ${TestOne.title}</div><br>
				<div class="inner question">${TestOne.testContent}</div>
				<div class="select">
				<ol>
					<li>1. ${TestOne.testExam1}</li>
					<li>2. ${TestOne.testExam2}</li>
					<li>3. ${TestOne.testExam3}</li>
					<li>4. ${TestOne.testExam4}</li>
				</ol>
				</div>
				<div class="answer">
					<form id="answerForm" action="/level/commonTest" method="post">
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"><!-- 보안토큰 -->
					<input type="hidden" name="stuId" value="${stuId }">
						<div class="form-group form-inline">
							<button id="prevBtn" class="btn btn-success">이전으로</button>
							<input type="text" class="form-control" name="dap" id="dap" value="${dap}" placeholder="번호를 입력해 주세요.">
							<button id="nextBtn" class="btn btn-success">다음으로</button>
							<input type="hidden" id ="state" name="state" value="next">
						</div>
					</form>
				</div>
			</div>
		</div><!-- container -->
		
<!-- Start Footer -->
		<%@ include file="../common/footer.jsp" %>
	</div><!-- wrap -->
<script>
var answerForm = $("#answerForm");

//다음문제 이동
$("#nextBtn").on("click",function(e){
		answerForm.submit();
});

//이전문제 이동
$("#prevBtn").on("click",function(e){
	$("#state").val("prev");
	answerForm.submit();
});

var score = "${score}";
if(score != ""){
	var str = "";
	if(score >= 80){
		str += "점수는 " + score + "점 입니다. 통과";
	}else {
		str += score + "점입니다. 탈락이다 임마.";
	}
	alert(str);
}

</script>
</body>
</html>