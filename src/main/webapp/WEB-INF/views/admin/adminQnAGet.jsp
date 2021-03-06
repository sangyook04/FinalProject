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


</head>
<body>
	<div id="wrap">
		<%@ include file="../common/adminheader.jsp" %>
		<div id="container">
			<%@ include file="../common/adminaside.jsp" %>
			<div class="containerContent">
				<h1>QnA 상세정보</h1>
				<div class="QnAWrap">
					<div class="form-group">
						<label for="QnAGetTitle">제목</label> <input type="text"
							class="form-control" id="QnAGetTitle" placeholder="제목"
							readonly="readonly" value="${qna.qnaTitle}">
					</div>
					<div class="form-group">
						<label for="QnAGetWriter">작성자</label> <input type="text"
							class="form-control" id="QnAGetWriter" placeholder="작성자"
							readonly="readonly" value="${qna.qnaWriter}">
					</div>
					<div class="form-group">
						<label for="QnAGetDate">날짜</label> <input type="text"
							class="form-control" id="QnAGetDate" placeholder="날짜"
							readonly="readonly" value="${qna.qnaDate}">
					</div>
					<div class="form-group">
						<label for="QnAGetContent">내용</label>
						<textarea class="form-control" id="QnAGetContent" placeholder="내용"
							style="resize: none" readonly="readonly">${qna.qnaContent}</textarea>
					</div>
					<div class="form-group">
						<label for="QnAGetAnswer">답변</label>
						<textarea class="form-control" id="QnAGetAnswer" placeholder="미답변 상태"
							style="resize: none" readonly="readonly">${qna.qnaAnswer}</textarea>
					</div>
					<button data-oper="answer" class="btn btn-default">답변</button>
					<button data-oper="remove" class="btn btn-default">삭제</button>
					<button data-oper="list" class="btn btn-default">목록</button>
				</div>
				
				<form id="operForm" action="/admin/QnAmodify" method="get">
					<input type="hidden" id="qnaIndex" name="qnaIndex"
						value="${qna.qnaIndex}">
				</form>

				<form id="deleteForm" action="/admin/QnAremove" method="post">
					<input type="hidden" id="qnaIndex" name="qnaIndex"
						value="${qna.qnaIndex}">
				</form>
				<!-- QnAWrap -->
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
			$('button[data-oper="answer"]').on("click", function(e) {
				$("#operForm").submit();
			});

			//list
			$('button[data-oper="list"]').on("click", function(e) {
				location.href = "/admin/QnAlist";
			});

			//remove
			$('button[data-oper="remove"]').on("click", function(e) {

				var conf = confirm("삭제 하시겠습니까?");
				alert(conf);

				if (conf == true) {
					$("#deleteForm").submit();
				}
			});
		});
	</script>
</body>
</html>