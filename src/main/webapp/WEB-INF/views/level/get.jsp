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
   <!-- 부트스트랩 -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
   <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<script src="../../../resources/lib/jquery/jquery-3.4.1.min.js"></script>
   <link rel="stylesheet" type="text/css" href="../../../resources/css/common.css">
   <link rel="stylesheet" type="text/css" href="../../../resources/css/adminMain.css">
   <link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/adminheaderfooter.css">
   

   <script>
   		$(document).ready(function(){

			$('.first').hover(function () {
			    if($(".firstSub").css("display") == "none"){
			       $('.firstSub').css("display", "block");
			       event.preventDefault();
			    } else {
			       $('.firstSub').css("display", "none");
			    }
			});

			$('.firstSub2').hover(function () {
			    if($(".asideSubmenu2").css("display") == "none"){
			       $('.asideSubmenu2').css("display", "block");
			       event.preventDefault();
			    } else {
			       $('.asideSubmenu2').css("display", "none");
			    }
			});

			$('.second').hover(function () {
			    if($(".secondSub").css("display") == "none"){
			       $('.secondSub').css("display", "block");
			       event.preventDefault();
			    } else {
			       $('.secondSub').css("display", "none");
			    }
			});

			$('.third').hover(function () {
			    if($(".thirdSub").css("display") == "none"){
			       $('.thirdSub').css("display", "block");
			       event.preventDefault();
			    } else {
			       $('.thirdSub').css("display", "none");
			    }
			});

			$('.fourth').hover(function () {
			    if($(".fourthSub").css("display") == "none"){
			       $('.fourthSub').css("display", "block");
			       event.preventDefault();
			    } else {
			       $('.fourthSub').css("display", "none");
			    }
			});

		});//ready
   </script>
   <link rel="stylesheet" type="text/css" href="../../../resources/css/test.css">
</head>
<body>
	<div id="wrap">
		<%@ include file="../common/adminheader.jsp" %>
		<div id="container">
			<%@ include file="../common/adminaside.jsp" %>
			
			<!-- End Sidebar Start 내용물-->
			<div class="containerContent">
			<div class="inner">
			<h2>레벨 테스트 상세 정보</h2>
			<!-- <div class="containerContent"> -->
			<div class="Problem">
					<div class="form-group form-inline">
					<h2>문제</h2><br>
					<textarea class="form-control title" rows="2" cols="100" readonly="readonly">${test.title}</textarea>
					<textarea class="form-control questionInput" rows="20" cols="100" readonly="readonly">${test.testContent}</textarea>
					<h2>보기</h2><br>
					1 : <input type="text" class="form-control" readonly="readonly" value="${test.testExam1}">
					2 : <input type="text" class="form-control" readonly="readonly" value="${test.testExam2}">
					3 : <input type="text" class="form-control" readonly="readonly" value="${test.testExam3}">
					4 : <input type="text" class="form-control" readonly="readonly" value="${test.testExam4}"><br>
					<p id="answerInput">정답 : <input type="text" class="form-control" readonly="readonly" value="${test.testAnswer}"></p>
					<button data-oper="list" class="btn btn-success pull-right"> 목록 </button>
					<button data-oper="modify" class="btn btn-primary pull-right"> 변경 </button>
					<button data-oper="remove" class="btn btn-danger pull-right"> 삭제 </button>
					
					<form id="operForm" action="/board/modify" method="get">
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"><!-- 보안토큰 -->
						<input type="hidden" id="testIndex" name="testIndex" value="${test.testIndex }">
						<%-- <input type="hidden" name="pageNum" value="${cri.pageNum }">
						<input type="hidden" name="amount" value="${cri.amount }">
						<input type="hidden" name="type" value="${cri.type }">
						<input type="hidden" name="keyword" value="${cri.keyword }"> --%>
					</form>
					</div>
			</div>
			<!-- </div> -->
			</div>
			</div>
			<!-- End 내용물 -->
			
		</div><!-- container -->
		
			
		<%@ include file="../common/adminfooter.jsp" %>
	</div><!-- wrap -->
<script>
$(function() {
	var operForm = $("#operForm");
	
	//modify
	$('button[data-oper="modify"]').on("click", function(e){
		operForm.attr("action", "/level/modify")
				.submit();
	});
	
	//list
	$('button[data-oper="list"]').on("click", function(e){
		operForm.find('#testIndex').remove();
		operForm.attr("action","/level/list");
		operForm.submit();
	});
	
	//remove
	$('button[data-oper="remove"]').on("click", function(e){
		operForm.attr("action","/level/remove").attr("method", "post");
		operForm.submit();
	});
});
</script>
</body>
</html>