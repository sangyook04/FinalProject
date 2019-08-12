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
<!-- CSS -->
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
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
					<table class="table">
						<thead>
							<tr>
								<th scope="col">제목</th>
								<th scope="col">${view.notTitle}</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>



						</tbody>

					</table>
	
					<textarea class="form-control" rows="3" readonly="readonly"> ${view.notContent }  </textarea>

				<button data-oper="adminNoticeMod" id="modBtn">수정</button>
				<button data-oper="adminNoticeRem" id="remBtn" 	style="background-color: red; padding: 10px; color: white; border-radius: 5px; margin-left: 10px; margin-top: -100px;">삭제</button>
				<button data-oper="adminNoticeManage" id="listBtn2" style="background-color: #47C83E; padding: 10px; color: white; border-radius: 5px; margin-left: 10px; margin-top: -100px;">목록</button>
				
				


				</div>

				<!-- 
				<button data-oper="adminNoticeMod" id="modBtn">수정</button>
				<button data-oper="adminNoticeRem" id="remBtn">삭제</button>
				<button data-oper="adminNoticeManage" id="listBtn">목록</button>
				 -->
				<form id="operForm" action="/admin/adminNoticeManage" method="get">
				
					<input type="hidden" id="notIndex" name="notIndex"
						value="${view.notIndex }">
				</form>

				<form id="deleteForm" action="/admin/remove" method="post">
				 <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
                  <input type="hidden" id="notIndex" name="notIndex" value="${view.notIndex}">
               </form>


			</div>
		</div>

		<!-- container -->
		<%@ include file="../common/adminfooter.jsp" %>
	</div>
	<!-- wrap -->

	<script>
		$(function() {
			var operForm = $("#operForm");
			
			//modify
			
			$('button[data-oper="adminNoticeMod"]').on("click", function(e) {
				operForm.attr("action", "/admin/adminNoticeMod").submit();
			});
			
			

			//list
			$('button[data-oper="adminNoticeManage"]').on("click", function(e) {
				operForm.find('#notIndex').remove();
				operForm.attr("action", "/admin/adminNoticeManage");
				operForm.submit();
			});

			//remove
			$('button[data-oper="adminNoticeRem"]').on("click", function(e){
			      
			      var conf = confirm("삭제 하시겠습니까?");
			      alert(conf);
			      
			      if(conf == true){
			     
			         $("#deleteForm").submit();
			      } 
			   });
			
			
			
		});
	</script>
</body>
</html>