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
   <!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> 
   <!-- CSS -->
   <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<script src="../../../resources/lib/jquery/jquery-3.4.1.min.js"></script>
   <link rel="stylesheet" type="text/css" href="../../../resources/css/common.css">
   <link rel="stylesheet" type="text/css" href="../../../resources/css/adminMain3.css">
   <link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700" rel="stylesheet">
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
</head>
<body>
	<div id="wrap">
			<%@ include file="../common/adminheader.jsp" %>

		<div id="container">
			<%@ include file="../common/adminaside.jsp" %>
	<div class="inner">
	         <h1><b>학생 상세 정보</b></h1>
            <div class="content">
               <div class="info">아이디</div>
               <div class="userInfo">${stuInfo.stuId}</div>
               <div class="info">이름</div>
               <div class="userInfo">${stuInfo.stuName}</div>
               <div class="info">성별</div>
               <div class="userInfo">${stuInfo.stuGender}</div>
               <div class="info">주소</div>
               <div class="userInfo">${stuInfo.stuAddress}</div>
               <div class="info">연락처</div>
               <div class="userInfo">${stuInfo.stuPhonenum}</div>
               <div class="info">이메일</div>
               <div class="userInfo">${stuInfo.stuEmail}</div>
                <div class="info">레벨</div>
               <div class="userInfo">${stuInfo.stuLevel}</div>
              
               <button data-oper="adminStudentMod" id="modBtn">수정</button> 				
               <button data-oper="adminStudentList" id="listBtn" style="background-color: #47C83E; padding: 10px; color: white; border-radius: 5px; margin-left: 10px; margin-top: -100px;">목록</button>
            </div>
           	
           	
           	  <form id="operForm" action="/admin/adminStudentMod" method="get">
					<input type="hidden" id="stuId" name="stuId"
						value="${stuInfo.stuId }">
				</form> 
           	
           	 <form id="operForm" action="/admin/adminStudentList" method="get">
					<input type="hidden" id="stuId" name="stuId"
						value="${stuInfo.stuId }">
				</form> 
        
         </div>
		</div><!-- container -->
		<%@ include file="../common/adminfooter.jsp" %>

	</div><!-- wrap -->
	<script>
		$(function() {
			var operForm = $("#operForm");
		
			

			//modify
			
			$('button[data-oper="adminStudentMod"]').on("click", function(e) {
				operForm.attr("action", "/admin/adminStudentMod").submit();
			});
			
			
			
			
			//list
			$('button[data-oper="adminStudentList"]').on("click", function(e) {
				operForm.find('#stuId').remove();
				operForm.attr("action", "/admin/adminStudentList");
				operForm.submit();
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