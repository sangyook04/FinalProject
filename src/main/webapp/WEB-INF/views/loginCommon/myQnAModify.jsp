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
   <link rel="stylesheet" type="text/css" href="../../../resources/css/leastuQnA.css">
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

		});//ready
   </script>
</head>
<body>
	<div id="wrap">
		<%@ include file="../common/header.jsp" %>
		<div id="container">
			<div class="inner">
				<h1>내 문의 수정</h1>
				<div class="QnAWrap">
					<form class="QnAModifyForm" action="/qna/mymodify" method="post">
					  <div class="form-group">
					    <label for="QnAModifyGetNo">번호</label>
					    <input type="text" class="form-control" id="QnAModifyGetNo" name="qnaIndex" placeholder="번호" readonly="readonly" value="${qna.qnaIndex}">
					  </div>
					  <div class="form-group">
					    <label for="QnAModifyTitle">제목</label>
					    <input type="text" class="form-control" id="QnAModifyTitle" name="qnaTitle" placeholder="제목" value="${qna.qnaTitle}">
					  </div>
					  <div class="form-group">
					    <label for="QnAModifyDate">날짜</label>
					    <input type="text" class="form-control" id="QnAModifyDate" name="qnaDate" placeholder="날짜" readonly="readonly" value="${qna.qnaDate}">
					  </div>
					  <div class="form-group">
					    <label for="QnAModifyDate">작성자</label>
					    <input type="text" class="form-control" id="QnAModifyDate" name="qnaWriter" placeholder="작성자" readonly="readonly" value="${qna.qnaWriter}">
					  </div>
					  <div class="form-group">
					    <label for="QnAModifyContent">내용</label>
					    <textarea class="form-control" id="QnAModifyContent" name="qnaContent" placeholder="내용" style="resize: none">${qna.qnaContent}</textarea>
					  </div>
					  <button type="submit" data-oper="modify" id="modifyOK" class="btn btn-default">확인</button>
					  <button type="button" id="cancel" class="btn btn-default">취소</button>
					</form>
				</div>
			</div><!-- inner -->
		</div><!-- container -->
		<%@ include file="../common/footer.jsp" %>
	</div><!-- wrap -->
</body>
<script>

	$("#cancel").on("click", function(e){
		
		var QnAModifyGetNo = $("#QnAModifyGetNo").val();
		location.href = "/qna/get?qnaIndex="+QnAModifyGetNo;
	});

</script>
</html>