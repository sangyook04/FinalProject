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
			<h2>레벨 테스트 문항 변경</h2>
			<div class="problem">
				<form role="form" action="/level/modify" method="post">
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"><!-- 보안토큰 -->
					<div class="form-group form-inline">
					<h2>문제</h2><br>
					<input type="hidden" class="form-control" name="testIndex" value="${test.testIndex}">
					<textarea class="form-control title" rows="2" cols="100" name="title">${test.title}</textarea>
					<textarea class="form-control questionInput" rows="20" cols="100" name="testContent">${test.testContent}</textarea>
					<h2>보기</h2><br>
					1 : <input type="text" class="form-control" name="testExam1" value="${test.testExam1}">
					2 : <input type="text" class="form-control" name="testExam2" value="${test.testExam2}">
					3 : <input type="text" class="form-control" name="testExam3" value="${test.testExam3}">
					4 : <input type="text" class="form-control" name="testExam4" value="${test.testExam4}"><br>
					<p id="answerInput">정답 : <input type="text" class="form-control" name="testAnswer" value="${test.testAnswer}"></p>
					<button type="submit" data-oper="list" class="btn btn-danger pull-right"> 취소 </button>
					<button type="submit" data-oper="modify" class="btn btn-primary pull-right"> 확인 </button>
					</div>
				</form>
			</div>
			</div>
			</div>
			<!-- End 내용물 -->
			
		</div><!-- container -->
		
			
		<%@ include file="../common/adminfooter.jsp" %>
	</div><!-- wrap -->
<script>
$(function() {
	
var formObj = $("form");
	
	//modify
	$('button').on("click", function(e){
		e.preventDefault();
		var operation = $(this).data("oper");
		
		if(operation === "list"){
			formObj.attr("action", "/level/list").attr("method", "get");
			/* var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			var typeTag = $("input[name='type']").clone();
			var keywordTag = $("input[name='keyword']").clone();
			
			formObj.empty();
			
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			formObj.append(typeTag);
			formObj.append(keywordTag); */
		}else if(operation === 'modify'){

		}
		
		formObj.submit();
	});
	
});
</script>
</body>
</html>