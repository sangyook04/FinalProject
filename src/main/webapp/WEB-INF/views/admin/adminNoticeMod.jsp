<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,user-scalable=no,initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Final Project</title>
<!-- 부트스트랩 -->
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
<link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/adminheaderfooter.css">
<script>
	$(document).ready(function() {

		$('.first').hover(function() {
			if ($(".firstSub").css("display") == "none") {
				$('.firstSub').css("display", "block");
				event.preventDefault();
			} else {
				$('.firstSub').css("display", "none");
			}
		});

		$('.firstSub2').hover(function() {
			if ($(".asideSubmenu2").css("display") == "none") {
				$('.asideSubmenu2').css("display", "block");
				event.preventDefault();
			} else {
				$('.asideSubmenu2').css("display", "none");
			}
		});

		$('.second').hover(function() {
			if ($(".secondSub").css("display") == "none") {
				$('.secondSub').css("display", "block");
				event.preventDefault();
			} else {
				$('.secondSub').css("display", "none");
			}
		});

		$('.third').hover(function() {
			if ($(".thirdSub").css("display") == "none") {
				$('.thirdSub').css("display", "block");
				event.preventDefault();
			} else {
				$('.thirdSub').css("display", "none");
			}
		});

		$('.fourth').hover(function() {
			if ($(".fourthSub").css("display") == "none") {
				$('.fourthSub').css("display", "block");
				event.preventDefault();
			} else {
				$('.fourthSub').css("display", "none");
			}
		});

	});//ready
</script>
</head>
<body>
	<div id="wrap">
		<%@ include file="../common/adminheader.jsp" %>
		<div id="container">
			<%@ include file="../common/adminaside.jsp" %>

			<div class="inner">
				<h2>
					<b>공지사항</b>
				</h2>

				<div class="noticeContenttable">
					<form role="form" action="/notice/adminNoticeMod" method="post">
					<input type="hidden" class="form-control" name="notIndex" value="${view.notIndex}">
						<table class="table">	
							<thead>
							
								<tr>
									
									<th scope="col">제목</th>
									<th scope="col"><input type="text" name="notTitle"
										placeholder="${view.notTitle}" value="${view.notTitle}"></th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody>



							</tbody>

						</table>

						<textarea class="form-control" rows="3" name="notContent"> ${view.notContent} </textarea>

						<button data-oper="adminNoticeMod" id="modBtn">수정</button>
						<button data-oper="adminNoticeClose" id="closeBtn"
							style="background-color: red; padding: 10px; color: white; border-radius: 5px; margin-left: 10px; margin-top: -100px;">취소</button>



					</form>



				</div>



			</div>
		</div>

		<!-- container -->
		<%@ include file="../common/adminfooter.jsp" %>
	</div>
	<!-- wrap -->

	<script>
	$(function() {
		
		var formObj = $("form");
		
		
		
			//modify
			$('button').on("click", function(e){
				e.preventDefault();
				var operation = $(this).data("oper");
				
				if(operation === "adminNoticeClose"){
					formObj.attr("action", "/notice/adminNoticeManage").attr("method", "get");
					
				}else if(operation === 'adminNoticeMod'){
					
					
					 var conf = confirm("수정 하시겠습니까?");
				      alert(conf);   	  	
				}
				
				formObj.submit();
			});
			
		});
	</script>
</body>
</html>