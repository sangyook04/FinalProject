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
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<script src="../../../resources/lib/jquery/jquery-3.4.1.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/common.css">
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/adminQnA.css">
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/adminheaderfooter.css">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700"
	rel="stylesheet">

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
			<div class="containerContent">
				<h1>QnA 답변</h1>
				<div class="QnAWrap">
					<form action="/admin/QnAmodify" method="post">
						<div class="form-group">
					   		<label for="QnAModifyGetNo">번호</label>
					  		<input type="text" class="form-control" id="QnAModifyGetNo" name="qnaIndex" placeholder="번호" readonly="readonly" value="${qna.qnaIndex}">
					 	</div>
						<div class="form-group">
							<label for="QnAGetTitle">제목</label> <input type="text"
								class="form-control" id="QnAGetTitle" name="qnaTitle" placeholder="제목"
								readonly="readonly" value="${qna.qnaTitle}">
						</div>
						<div class="form-group">
							<label for="QnAGetWriter">작성자</label> <input type="text"
								class="form-control" id="QnAGetWriter" name="qnaWriter" placeholder="작성자"
								readonly="readonly" value="${qna.qnaWriter}">
						</div>
						<div class="form-group">
							<label for="QnAGetDate">날짜</label> <input type="text"
								class="form-control" id="QnAGetDate" name="qnaDate" placeholder="날짜"
								readonly="readonly" value="${qna.qnaDate}">
						</div>
						<div class="form-group">
							<label for="QnAGetContent">내용</label>
							<textarea class="form-control" id="QnAGetContent" name="qnaContent"
								placeholder="내용" style="resize: none" readonly="readonly">${qna.qnaContent}</textarea>
						</div>
						<div class="form-group">
							<label for="QnAGetAnswer">답변</label>
							<textarea class="form-control" id="QnAGetAnswer" name="qnaAnswer"
								placeholder="미답변 상태" style="resize: none">${qna.qnaAnswer}</textarea>
						</div>
						<input type="hidden" name="qnaAnsState" value="답변 완료">
						<button type="submit" data-oper="modify" id="modifyOK" class="btn btn-default">확인</button>
					 	<button type="button" id="cancel" class="btn btn-default">취소</button>
					</form>
				</div>
				<!-- QnAWrap -->
			</div>
		</div>
		<!-- container -->
		<%@ include file="../common/adminfooter.jsp" %>
	</div>
	<!-- wrap -->
<script>
	$("#cancel").on("click", function(e){
		
		var QnAModifyGetNo = $("#QnAModifyGetNo").val();
		location.href = "/admin/QnAget?qnaIndex="+QnAModifyGetNo;
	});	
</script>
</body>
</html>