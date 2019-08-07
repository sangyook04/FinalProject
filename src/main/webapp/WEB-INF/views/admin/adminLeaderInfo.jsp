<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,user-scalable=no,initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Final Project_leaderInfo</title>
<!-- CSS -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<script src="../../../resources/lib/jquery/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/common.css">
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/adminMain2.css">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700"
	rel="stylesheet">
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

<script>
	$(function(){
		var operForm = $("#operForm");
		
		$("button[data-oper='modify']").on("click", function(e){
			operForm.attr("action", "/admin/adminLeaderModify").submit();
		});
		
		var formObj = $("form");
	})
</script>

</head>
<body>
	<div id="wrap">
		<%@ include file="../common/adminheader.jsp" %>
		<div id="container">			
			<%@ include file="../common/adminaside.jsp" %>
			<div class="inner">
				<div class="content">
					<div class="infoContent">
						<div class="img"><img src="../../../resources/img/GumonMain/user123.jpg"></div>
						<div class="info">아이디</div>
						<div class="userInfo"><c:out value="${ leader.leaId }"/></div>
						<div class="info">이름</div>
						<div class="userInfo"><c:out value="${ leader.leaName }"/></div>
						<div class="info">성별</div>
						<div class="userInfo"><c:out value="${ leader.leaGender }"/></div>
						<div class="info">국적</div>
						<div class="userInfo">추가하자~~</div>
						<div class="info">주소</div>
						<div class="userInfo"><c:out value="${ leader.leaAddress }"/></div>
						<div class="info">연락처</div>
						<div class="userInfo"><c:out value="${ leader.leaPhonenum }"/></div>
						<div class="info">이메일</div>
						<div class="userInfo"><c:out value="${ leader.leaEmail }"/></div>
						<div class="info">계좌번호</div>
						<div class="userInfo"><c:out value="${ leader.leaBank }"/> <c:out value="${ leader.leaAccount }"/></div>
						<div class="info">자기소개</div>
						<div class="userInfo"><c:out value="${ leader.leaIntroduce }"/></div>
						
						<button data-oper='modify' id="modBtn">변경</button><button id="withdBtn">비활성화</button><button data-oper='list' onclick="location.href='/admin/adminLeader'" id="listBtn">목록</button>
						
						<%-- <form role="form" id="BtnForm" action="/leader/adminLeaderInfo" method="post">
						<input type="hidden" id="leaId" name="leaId" value='<c:out value="${leader.leaId }"/>'>
						<button type="submit" data-oper="accept" id="apprBtn">승인</button><button type="submit" data-oper="reject" id="refBtn">거부</button>
						</form> --%>
						
						<form role="form" id="operForm" action="/leader/adminLeadermodify" method="get">
							<input type="hidden" id="leaId" name="leaId" value='<c:out value="${leader.leaId }"/>'>
							<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
							<input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>'>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- container -->
		<%@ include file="../common/adminfooter.jsp" %>
	</div>
	<!-- wrap -->
</body>
</html>