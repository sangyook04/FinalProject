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
	href="../../../resources/css/main2.css">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../../resources/css/headerfooter.css">

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

<script>
	$(function(){
		var operForm = $("#operForm");
		
		$("button[data-oper='modify']").on("click", function(e){
			operForm.attr("action", "/leader/modify").submit();
		});
	})
</script>

</head>
<body>
	<div id="wrap">
		<%@ include file="../common/header.jsp" %>
		<div id="container">
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
	
						<button data-oper="modify" id="modBtn">수정하기</button>
						
						<form id="operForm" action="/leader/modify" method="get">
							<input type="hidden" id="leaId" name="leaId" value='<c:out value="${leader.leaId }"/>'>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- container -->
		<%@ include file="../common/footer.jsp" %>
	</div>
	<!-- wrap -->
	<script>
		$(document).ready(function(){
			(function(){
				var leaId = '<c:out value="${ leader.leaId }"/>';
				
				$.getJSON("/leader/getPictureList", {leaId : leaId}, function(arr){
					console.log(arr);
					
					var str = "";
					
					$(arr).each(function(i, picture){
						//image type
						if(picture.fileType){
							var fileCallPath = encodeURIComponent(picture.uploadPath + "/s_" + picture.uuid + "_"+picture.fileName);
							
							str += "<img src='/display?fileName="+fileCallPath+"'>";
						}
						
						$(".img").append(str);
					});
				});
			})();
		});

	</script>
</body>
</html>