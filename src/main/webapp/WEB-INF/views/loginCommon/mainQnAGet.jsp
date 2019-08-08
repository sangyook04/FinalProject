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
   <!-- CSS -->
   <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<script src="../../../resources/lib/jquery/jquery-3.4.1.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
   <link rel="stylesheet" type="text/css" href="../../../resources/css/common.css">
   <link rel="stylesheet" type="text/css" href="../../../resources/css/mainQnA.css">
   <link rel="stylesheet" type="text/css" href="../../resources/css/headerfooter.css">
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

			$('input[id="pwdCheck"]').change(function() {
				    var value = $(this).val();
				    var checked = $(this).prop('checked');

				    if(checked)
				    	$('#mainQnARegisterPwd').attr("readonly", false);
				    else
				        $('#mainQnARegisterPwd').attr("readonly", true);
				});

		});//ready
   </script>
</head>
<body>
	<div id="wrap">
		<%@ include file="../common/header.jsp" %>
		<div id="container">
			<div class="inner">
				<h1>QnA 상세 정보</h1>
				<div class="QnAWrap">
					<div class="MyQnAGetForm">
					  <div class="form-group">
					    <label for="QnAGetNo">번호</label>
					    <input type="text" class="form-control" id="QnAGetNo" placeholder="번호" readonly="readonly"  value="${qna.qnaIndex}">
					  </div>
					  <div class="form-group">
					    <label for="QnAGetTitle">제목</label>
					    <input type="text" class="form-control" id="QnAGetTitle" placeholder="제목" readonly="readonly" value="${qna.qnaTitle}">
					  </div>
					  <div class="form-group">
					    <label for="QnAGetDate">날짜</label>
					    <input type="text" class="form-control" id="QnAGetDate" placeholder="날짜" readonly="readonly" value="${qna.qnaDate}">
					  </div>
					  <div class="form-group">
					    <label for="QnAGetDate">작성자</label>
					    <input type="text" class="form-control" id="QnAGetDate" placeholder="작성자" readonly="readonly" value="${qna.qnaWriter}">
					  </div>
					  <div class="form-group">
					    <label for="QnAGetContent">내용</label>
					    <textarea class="form-control" id="QnAGetContent" placeholder="내용" style="resize: none" readonly="readonly">${qna.qnaContent}</textarea>
					  </div>
					  <button data-oper="modify" class="btn btn-default">수정</button>
					  <sec:authentication property="principal" var="pinfo"/>
					  <sec:authorize access="isAuthenticated()">
					  	<c:if test="${pinfo.username == qna.qnaWriter}">
					  		<button data-oper="remove" class="btn btn-default">삭제</button>
					  	</c:if>
					  </sec:authorize>
					  <button data-oper="list" class="btn btn-default">목록</button>
					</div>
					<div class="MyQnAGetAnswer">
						<label for="QnAGetAnswer">답변 내용</label>
						<textarea class="form-control" id="QnAGetAnswer" placeholder="내용" style="resize: none" readonly="readonly">${qna.qnaAnswer}</textarea>
					</div>
					<form id="operForm" action="/loginCommon/modify" method="get">
						<input type="hidden" id="qnaIndex" name="qnaIndex" value="${qna.qnaIndex}">
					</form>
					
					<form id="deleteForm" action="/loginCommon/remove" method="post">
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"><!-- 보안토큰 -->
						<input type="hidden" id="qnaIndex" name="qnaIndex" value="${qna.qnaIndex}">
					</form>
				</div>
			</div><!-- inner -->
		</div><!-- container -->
		<%@ include file="../common/footer.jsp" %>
	</div><!-- wrap -->
<script>
$(function() {
	var operForm = $("#operForm");
	
	//modify
	$('button[data-oper="modify"]').on("click", function(e){
		$("#operForm").submit();
	});
	
	//list
	$('button[data-oper="list"]').on("click", function(e){
		location.href = "/loginCommon/list";
	});
	
	//remove
	$('button[data-oper="remove"]').on("click", function(e){
		
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