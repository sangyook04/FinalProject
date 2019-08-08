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
<meta name="viewport"
	content="width=device-width,user-scalable=no,initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Final Project</title>
<!--부트스트랩 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- CSS -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<script src="../../../resources/lib/jquery/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/common.css">
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/adminMain3.css">
<link rel="stylesheet" type="text/css" href="../../resources/css/headerfooter.css">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700"
	rel="stylesheet">



<script>
	$(document).ready(function() {

		$('nav .one').hover(function() {
			if ($(".callsenterSub").css("display") == "none") {
				$('.callsenterSub').slideDown();
				$("headerA").css("color", "#f15b6d");
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
		
			<div class="containerContent cc">

				<h2>
					<b>리더 평가</b>
				</h2>


				<div class="containerContenttable">
				
				<form role="form" method="post" action="/student/studentComment">
				 <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
			<%-- 
				<input type="hidden" id="stuId" name="stuId"
						value="<sec:authentication property="principal.username"/>">  --%>
				
					<table class="table">
					
						<thead>
							<tr>
								<th scope="col">리더 아이디</th>
								<th scope="col"><input type="text"
								  name="leaId"	placeholder="리더 아이디를 입력해주세요."></th>
								  
								<th></th>
								<th></th>
							</tr>
						</thead>
						
						<tbody>
						
						
							<tr>
								<th scope="row">평가 점수</th>
								<td>
								
				<input type="hidden" id="stuId" name="stuId"
						value="<sec:authentication property="principal.username"/>"> 
									<div class="radiogComment">
										<label class="radiolabel"><input
											class="radioCommentRadio" type="radio" name="revGrade" value="1">1</label>
										<label class="radiolabel"><input
											class="radioCommentRadio" type="radio" name="revGrade" value="2">2</label>
										<label class="radiolabel"><input
											class="radioCommentRadio" type="radio" name="revGrade" value="3">3</label>
										<label class="radiolabel"><input
											class="radioCommentRadio" type="radio" name="revGrade" value="4">4</label>
										<label class="radiolabel"><input
											class="radioCommentRadio" type="radio" name="revGrade" value="5">5</label>
									</div>
								</td>

							</tr>
							<tr>
								<th scope="row">comment</th>
								<td></td>
								<td></td>
								<td></td>
							</tr>

						</tbody>

					</table>
					<textarea class="form-control" rows="3"
						name="revComment" placeholder="평가 코멘트를 입력해주세요."></textarea>
					<button id="modBtn">확인</button>
					
					</form>
				
					
					
					<button data-oper="close" id="closeBtn2" class="closeBtn">취소</button>
					<form id="operForm" action="/common/main" method="get">
					<input type="hidden" id="revIndex" name="revIndex"
						value="${review.revIndex }">
					
				</form>

				</div>
			</div>
		</div>
		<!-- container -->

		<%@ include file="../common/footer.jsp" %>
	</div>
	<!-- wrap -->


 <script>
		$(function() {
			var ModForm = $("#ModForm");
			var CloseForm = $("#CloseForm");
		
			//modify
			$('button[data-oper="mod"]').on("click", function(e){
			      
			      var conf = confirm("수정이 완료되었습니다.");
			      alert(conf);
			      
			      if(conf == true){
			     
			         $("#ModForm").submit();
			      } 
			   });
			
			
			
			//close
			$('button[data-oper="close"]').on("click", function(e) {
				//CloseForm.find('#stuId').remove();
				CloseForm.attr("action", "/admin/adminStudentInfo");
				CloseForm.submit();
			});

			
			
			
		});
	</script>
	
	




	<script>
		$(function() {
			
			
			var ModForm = $("#ModForm");
			var CloseForm = $("#CloseForm");
			
			
			
			
			
			
			
			var operForm = $("#operForm");

			//list
			$('button[data-oper="close"]').on("click", function(e) {
				//operForm.find('#notIndex').remove();
				operForm.attr("action", "/common/main");
				operForm.submit();
			});

		});
	</script>

</body>
</html>