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
				<h1>QnA 등록</h1>
				<div class="QnAWrap">
					<form role="form" method="post" action="/qna/register">
					  <div class="form-group">
					    <label for="mainQnARegisterTitle">제목</label>
					    <input type="text" name="qnaTitle" class="form-control" id="mainQnARegisterTitle" placeholder="제목">
					  </div>
					  <div class="form-group">
					    <label for="mainQnARegisterWriter">작성자</label>
					    <input type="text" name="qnaWriter" value="<sec:authentication property="principal.username"/>" readonly="readonly" class="form-control" id="mainQnARegisterWriter" placeholder="작성자">
					  </div>
					  <!-- <div class="form-group registerpwd">
					    <label for="mainQnARegisterPwd">비밀번호</label>
					    <input type="password" name="qnaPassword" class="form-control" id="mainQnARegisterPwd" placeholder="비밀번호" readonly="readonly">
					  </div>
					  <div class="pwdOKWrap">
					  	<label for="pwdCheck">비밀번호 여부</label>
					  	<input id="pwdCheck" type="checkbox" name="pwdOK" value="pwdOK">
					  </div> -->
					  <div class="form-group">
					    <label for="mainQnARegisterContent">내용</label>
					    <textarea name="qnaContent" class="form-control" id="mainQnARegisterContent" placeholder="내용" style="resize: none"></textarea>
					  </div>
					  <button type="submit" class="btn btn-default">확인</button>
					  <button type="button" id="cancel" class="btn btn-default">취소</button>
					</form>
				</div>
			</div><!-- inner -->
		</div><!-- container -->
		<%@ include file="../common/footer.jsp" %>
	</div><!-- wrap -->
<script>
	$("#cancel").on("click", function(e){
		location.href = "/list";
	});
</script>
</body>
</html>