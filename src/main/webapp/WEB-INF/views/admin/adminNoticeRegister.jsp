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
   
   <!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> 
   <!-- CSS -->
   <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<script src="../../../resources/lib/jquery/jquery-3.4.1.min.js"></script>
   <link rel="stylesheet" type="text/css" href="../../../resources/css/common.css">
   <link rel="stylesheet" type="text/css" href="../../../resources/css/adminMain3.css">
   <link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700" rel="stylesheet">
	<link rel="stylesheet" type="text/css"
	href="../../../resources/css/adminheaderfooter.css">


  
</head>
<body>
	<div id="wrap">
		<%@ include file="../common/adminheader.jsp" %>
		<div id="container">
			<%@ include file="../common/adminaside.jsp" %>
			<div class="containerContent">

				<h2>
					<b>공지사항 등록</b>
				</h2>

				<div class="containerContenttable">
					<form role="form" method="post" action="/admin/adminNoticeRegister">
					  <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"> 
						<table class="table">
							<thead>
								<tr>
									<th scope="col">제목</th>
									<th scope="col"><input type="text"  name="notTitle"
										placeholder="공지사항 제목을 입력해주세요."></th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							
						</table>
						<textarea class="form-control" rows="3"
							placeholder="공지할 내용을 입력해주세요." name="notContent"></textarea>
						<button id="regBtn">확인</button>
						<!-- <button data-oper="close" id="closeBtn" class="closeBtn">취소</button> -->
					
					</form>
					
					
					<button data-oper="close" id="closeBtn5" class="closeBtn">취소</button>
					<form id="operForm" action="/admin/adminNoticeManage" method="get">
					<input type="hidden" id="notIndex" name="notIndex"
						value="${content.notIndex }">
					
				</form>
					
					
				</div>
			</div>
		</div>
		<!-- container -->
		<%@ include file="../common/adminfooter.jsp" %>
	</div><!-- wrap -->
	
 <script>
		$(function() {
			var operForm = $("#operForm");

			//list
			$('button[data-oper="close"]').on("click", function(e) {
				//operForm.find('#notIndex').remove();
				operForm.attr("action", "/admin/adminNoticeManage");
				operForm.submit();
			});

		});
	</script>
</body>
</html>