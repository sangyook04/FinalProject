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
	$(function(){
		var operForm = $("#operForm");
		
		$("button[data-oper='modify']").on("click", function(e){
			operForm.attr("action", "/admin/adminLeaderModify").submit();
		});
		
		var formObj = $("#leaderBtn");
		
		$("button[data-oper='accept']").on("click", function(e){
			var acc = confirm('${leader.leaId}님을 리더 신청을 승인 하시겠습니까?');
			if(acc){
				formObj.attr("action", "/admin/accept").submit();
			}
		});
		
		$("button[data-oper='reject']").on("click", function(e){
			var rej = confirm('${leader.leaId}님의 리더 신청을 거부 하시겠습니까?')
			if(rej){
				formObj.attr("action", "/admin/reject").submit();
			}
		});
	});
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
						<div class="img"></div>
						<div class="info">아이디</div>
						<div class="userInfo"><c:out value="${ leader.leaId }"/></div>
						<div class="info">이름</div>
						<div class="userInfo"><c:out value="${ leader.leaName }"/></div>
						<div class="info">성별</div>
						<div class="userInfo"><c:out value="${ leader.leaGender }"/></div>
						<div class="info">주소</div>
						<div class="userInfo"><c:out value="${ leader.leaAddress }"/></div>
						<div class="info">연락처</div>
						<div class="userInfo"><c:out value="${ leader.leaPhonenum }"/></div>
						<div class="info">이메일</div>
						<div class="userInfo"><c:out value="${ leader.leaEmail }"/>@<c:out value="${ leader.leaEmail2 }"/></div>
						<div class="info">계좌번호</div>
						<div class="userInfo"><c:out value="${ leader.leaBank }"/> <c:out value="${ leader.leaAccount }"/></div>
						<div class="info">자기소개</div>
						<div class="userInfo"><c:out value="${ leader.leaIntroduce }"/></div>
						
						<c:if test="${list == 'a'}">
							<button data-oper='modify' id="modBtn">변경</button><button id="withdBtn">비활성화</button>
							<button type="button" data-oper='list' onclick="location.href='/admin/adminLeader'" id="listBtn">목록</button>
						</c:if>
						
						<c:if test="${list == 'b' or list == 'r'}">
							<form id="leaderBtn" action="/admin/adminLeaderInfo" method="post">
								<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
								<input type="hidden" id="leaId" name="leaId" value='<c:out value="${leader.leaId }"/>'>
								<button type="button" data-oper="accept" id="apprBtn">승인</button><button 
								type="button" data-oper="reject" id="refBtn">거부</button>
								<button type="button" data-oper='list' onclick="location.href='<c:if test="${list == 'b' }">/admin/beforeJoin</c:if><c:if test="${list == 'r' }">/admin/rejectJoin</c:if>'" id="listBtn">목록</button>
							</form>
						</c:if>
						
						<form role="form" id="operForm" action="/admin/adminLeadermodify" method="get">
							<input type="hidden" id="leaId" name="leaId" value='<c:out value="${leader.leaId }"/>'>
							<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
							<input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>'>
							<input type="hidden" name="list" value='<c:out value="${list }"/>'>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- container -->
		<%@ include file="../common/adminfooter.jsp" %>
	</div>
	<!-- wrap -->
	
		<script>
		$(document).ready(function(){
			(function(){
				var leaId = '<c:out value="${ leader.leaId }"/>';
				
				$.getJSON("/admin/getPictureList", {leaId : leaId}, function(arr){
					console.log(arr);
					
					var str = "";
					
					$(arr).each(function(i, picture){
						//image type
						if(picture.fileType){
							var fileCallPath = encodeURIComponent(picture.uploadPath + "/s_" + picture.uuid + "_"+picture.fileName);
							
							str += "<img src='/display?fileName="+fileCallPath+"'>";
						}
						
						$(".img").html(str);
					});
				});
			})();
		});

	</script>
</body>
</html>