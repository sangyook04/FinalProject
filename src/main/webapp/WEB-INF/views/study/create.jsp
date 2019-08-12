<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<script src="../../resources/lib/jquery/jquery-3.4.1.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	
   <link rel="stylesheet" type="text/css" href="../../resources/css/common.css">
   <link rel="stylesheet" type="text/css" href="../../resources/css/main.css">
   <link rel="stylesheet" type="text/css" href="../../resources/css/study.css">
   <link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700" rel="stylesheet">
   
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
   
   
</head>
<body>
	<div id="wrap">
		<%@ include file="../common/header.jsp" %>
<script>
	
	$(".LogOut").on("click", function(e){
		e.preventDefault();
		$("#LogOutForm").submit();
	});
		

	$('nav .myPage').hover(function() {
		if ($(".myPageContent").css("display") == "none") {
			$('.myPageContent').slideDown();
			$("headerA").css("color", "#f15b6d");
			//stopPropagation();
		} else {
			$('.myPageContent').css("display", "none");
			event.stopPropagation();
			event.preventDefault();
		}
	});
</script>

		<div id="container">
		
		<div class="inner">
		<h1 class="creh1">스터디 개설</h1>
		
		<form method="post" action="/study/create" id="createform" name="createform" >
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"><!-- 보안토큰 -->
  			<div class="form-group">
   			 <label for="studytitle">스터디 제목</label>
   			 <input type="text" class="form-control" name="studyName" id="studyName" 
   			 required="required" placeholder="스터디 제목을 입력하세요" maxlength="30">
 			 </div>
 			 <div class="form-group">
 			 <label>인원 수</label>
 			 <select class="form-control" name="studyPeople" id="studyPeople">
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
			<option value="8">8</option>
			</select>
			</div>
			<div class="form-group">
				<label>스터디 레벨을 입력해주세요</label>
				<select class="form-control" name="studyLevel" id="studyLevel">
				<option value="초급">초급</option>
				<option value="중급">중급</option>
				<option value="고급">고급</option>
				</select>
			</div>
			 <div class="form-group">
 			 <label>시작 시간</label>
 			 <select class="form-control" name="studySTime" id="studySTime">
			<option value="08:00">08:00</option>
			<option value="09:00">09:00</option>
			<option value="10:00">10:00</option>
			<option value="11:00">11:00</option>
			<option value="12:00">12:00</option>
			<option value="13:00">13:00</option>
			<option value="14:00">14:00</option>
			<option value="15:00">15:00</option>
			<option value="16:00">16:00</option>
			<option value="17:00">17:00</option>
			<option value="18:00">18:00</option>
			<option value="19:00">19:00</option>
			<option value="20:00">20:00</option>
			<option value="21:00">21:00</option>
			<option value="22:00">22:00</option>
			<option value="23:00">23:00</option>
			<option value="24:00">24:00</option>
			</select>
			</div>
			
			 <div class="form-group">
 			 <label>종료 시간</label>
 			 <select class="form-control" name="studyETime" id="studyETime">
			<option value="08:00">08:00</option>
			<option value="09:00">09:00</option>
			<option value="10:00">10:00</option>
			<option value="11:00">11:00</option>
			<option value="12:00">12:00</option>
			<option value="13:00">13:00</option>
			<option value="14:00">14:00</option>
			<option value="15:00">15:00</option>
			<option value="16:00">16:00</option>
			<option value="17:00">17:00</option>
			<option value="18:00">18:00</option>
			<option value="19:00">19:00</option>
			<option value="20:00">20:00</option>
			<option value="21:00">21:00</option>
			<option value="22:00">22:00</option>
			<option value="23:00">23:00</option>
			<option value="24:00">24:00</option>
			</select>
			</div>
			
			<div class="form-group">
 			 <label>지역</label>
 			 <select class="form-control" name="studyPlace" id="studyPlace">
				<option value="마포구">마포구</option>
				<option value="영등포구">영등포구</option>
				<option value="양천구">양천구</option>
				<option value="강서구">강서구</option>
				<option value="동작구">동작구</option>
				<option value="용산구">용산구</option>
				<option value="중구">중구</option>
				<option value="서대문구">서대문구</option>
				<option value="종로구">종로구</option>
				<option value="성동구">성동구</option>
				<option value="강남구">강남구</option>
				<option value="서초구">서초구</option>
				<option value="관악구">관악구</option>
				<option value="금천구">금천구</option>
				<option value="구로구">구로구</option>
			</select>
			</div>

  			<div class="form-group">
  			  <label for="studyprice">가격</label>
  			  <input type="number" class="form-control" id="studyPrice"
  			  required="required" name="studyPrice"  placeholder="가격을 입력해주세요" min="0" maxlength="7">
  			</div>
  				
  			
  			<div class="form-group">
  			<label>시작 날짜</label>
  			  <input type="date" class="form-control" name="studyStartdate"
  			  id="studyStartdate" required="required" >
  			</div>
  			
  				<div class="form-group">
  			  <label>종료 날짜</label>
   			 <input type="date" class="form-control" name="studyEnddate" id="studyEnddate" required="required">
  			</div>
  			 	
  			<div class="form-group">
  			  <label>스터디 소개</label><br>
   			 <textarea id="textarea" class="form-control" name="studyIntroduce"  id="studyIntroduce"
   			 required="required" rows="10" maxlength="1500"></textarea>
  			</div>
  			<input type="hidden" value="예정" name="studyState" id="studyState">

  			<input type="hidden" name="leaId" id="leaId"> 
  			<button class="btn btn-primary" id="ssllistbtn">스터디 개설</button>
  			
</form>	

	

<script>
$("#ssllistbtn").on("click",function(e){
	e.preventDefault();
});



var studyEnddate = $("#studyEnddate");
var studyStartdate = $("#studyStartdate");

   	$("#studyEnddate").on("change", function(e){
 	   if(studyStartdate.val() == ""){
 	      alert("시작 날짜를 입력해주세요.");
 	   }
 	   else if(studyStartdate.val() > studyEnddate.val()){
 	      alert("날짜 선택이 잘못되었습니다.");
 	     studyStartdate.val(""); //시작날짜칸 비우기
 	    studyEnddate.val(""); //종료날짜칸 비우기
 	   }
 	});	  
 	

var studySTime = $("#studySTime");
var studyETime = $("#studyETime");

studyETime.on("change", function(e){
	if(studySTime.val() ==""){
		alert("시작 시간을 선택해줘");
	} else if(studySTime.val() > studyETime.val()){
		alert("시간 선택이 잘못되었어");
		studySTime.val("");
		studyETime.val("");
	}
	
});
	

</script>


		</div>

		</div><!-- container -->
		
<%@ include file="../common/footer.jsp" %>
	</div><!-- wrap -->
</body>
</html>