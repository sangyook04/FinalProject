<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link rel="stylesheet" type="text/css" href="../../resources/css/headerfooter.css">

   
   <script>
	$(document).ready(function() {

		$('nav .one').hover(function() {
			if ($(".callsenterSub").css("display") == "none") {
				$('.callsenterSub').slideDown();
				$("headerA").css("color", "#f15b6d");
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
	         <h1><b>내 정보 보기</b></h1>
            <div class="content">
               <div class="info">아이디</div>
               <div class="userInfo">${stuMyInfo.stuId}</div>
               <div class="info">이름</div>
               <div class="userInfo">${stuMyInfo.stuName}</div>
               <div class="info">성별</div>
               <div class="userInfo">${stuMyInfo.stuGender}</div>
               <div class="info">주소</div>
               <div class="userInfo">${stuMyInfo.stuAddress}</div>
               <div class="info">연락처</div>
               <div class="userInfo">${stuMyInfo.stuPhonenum}</div>
               <div class="info">이메일</div>
               <div class="userInfo">${stuMyInfo.stuEmail}</div>
                <div class="info">레벨</div>
               <div class="userInfo">${stuMyInfo.stuLevel}</div>
              
               <button data-oper="studentInfoMod" id="modBtn">수정</button> 				
               
            </div>
           	
           	
           	  <form id="operForm" action="/student/studentInfoMod" method="get">
					<input type="hidden" id="stuId" name="stuId"
						value="${stuMyInfo.stuId }">
				</form> 
           	
           
         </div>
		</div><!-- container -->
	<%@ include file="../common/footer.jsp" %>


	</div><!-- wrap -->
	<script>
		$(function() {
			var operForm = $("#operForm");
		
			

			//modify
			
			$('button[data-oper="studentInfoMod"]').on("click", function(e) {
				operForm.attr("action", "/student/studentInfoMod").submit();
			});
			
			
			
			
		});
		
		
		
		//페이지 이동하기
		var actionForm = $("#actionForm");

		$(".paginate_button a").on("click", function(e) {
			e.preventDefault();

			actionForm.find("input[name='pageNum']").val($(this).attr("href"));

			actionForm.submit();
		});
	</script>
	
	
	
</body>
</html>