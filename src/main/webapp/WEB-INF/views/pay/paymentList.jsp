<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width,user-scalable=no,initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <title>Final Project</title>
   <!-- CSS -->
   <!-- 부트스트랩 -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
   <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<script src="../../../resources/lib/jquery/jquery-3.4.1.min.js"></script>
   <link rel="stylesheet" type="text/css" href="../../../resources/css/common.css">
   <link rel="stylesheet" type="text/css" href="../../../resources/css/adminMain.css">
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
<style>
.containerContent .inner{
	text-align: center;
	margin-left: 200px;
}
.containerContent .inner h2 {
	text-align: left;
	font-size: 40px;
	font-weight: bold;
	margin-bottom: 50px;
}
.containerContent .inner .calender {
	text-align: left;
}
</style>
</head>
<body>
	<div id="wrap">
		<%@ include file="../common/adminheader.jsp" %>
		<div id="container">
			<%@ include file="../common/adminaside.jsp" %>
			
			<!-- End Sidebar Start 내용물-->
			
			<div class="containerContent">
			<div class="inner">
			<h2>결제 내역</h2>
			<div class="form-group form-inline calender">
				<span class="glyphicon glyphicon-calendar"></span>
				<input type="date" id="start" name="start" class="form-control">
				 ~ 
				<span class="glyphicon glyphicon-calendar"></span>
				<input type="date" id="end" name="end" class="form-control">
			</div>
			<div class="paymentList">
				<table class="table table-striped table-bordered">
					<thead>
		            	<tr>
		                  <th>아이디</th>
		                  <th>스터디 번호</th>
		                  <th>결제 날짜</th>
		                  <th>금액</th>
		            	</tr>
		            </thead>
		            <tbody>
		            <c:forEach items="${list}" var="payment">
		            	<tr>
		            		<td>${payment.stuId }</td>
		            		<td>${payment.studyIndex }</td>
					        <td>${payment.payDate }</td>
					        <td>${payment.payMoney == null ? "결제 취소" : payment.payMoney}</td>
		            	</tr>
		            </c:forEach>
		           </tbody>
				</table>
				
				<!-- 페이징 -->
				<div class="pull-center">
				<ul class="pagination">
				<!-- previous 버튼 표시 -->
				<c:if test="${pageMaker.prev }">	
					<li class="paginate_button previous">
						<a href="${pageMaker.startPage -1}">이전으로</a>
					</li>
				</c:if>
					
				<!-- 페이지 번호 표시 -->
				<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
					<li class='paginate_button ${pageMaker.cri.pageNum == num ? "active":"" } '>
					<a href="${num}"> ${num} </a></li>
				</c:forEach>
				<!-- next 버튼 표시 -->
				<c:if test="${pageMaker.next }">	
					<li class="paginate_button next">
						<a href="${pageMaker.endPage +1 }">다음으로</a>
					</li>
				</c:if>
				</ul>
				</div>
				<!-- END 페이징  -->
				
				<!-- 액션폼 -->
				<%-- <form id='actionForm' action="/pay/paymentList" method="get">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
				</form> --%>
				<!-- 검색폼 -->
				<form id='searchForm' action="/pay/paymentList" method="get">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
					<input type="hidden" name="start" value="${pageMaker.cri.start }">
					<input type="hidden" name="end" value="${pageMaker.cri.end }">
				</form>
				
			</div>
			</div>
			</div>
			<!-- End 내용물 -->
			
		</div><!-- container -->
		
			
		<%@ include file="../common/adminfooter.jsp" %>
	</div><!-- wrap -->
<script>
var actionForm = $("#actionForm");
var searchForm = $("#searchForm");

//페이지 이동
$(".paginate_button a").on("click", function(e){
	e.preventDefault();

	searchForm.find("input[name='pageNum']").val($(this).attr("href"));
	
	searchForm.submit();
});

//end 달력 클릭시 조회
$("#end").on("change", function(e){
	if($("#start").val() == ""){
		alert("시작 날짜를 입력해주세요.");
	}
	else if($("#start").val() > $(this).val()){
		alert("날짜 선택이 잘못되었습니다.");
		$("#start").val(""); //시작날짜칸 비우기
		$(this).val(""); //종료날짜칸 비우기
	}
	else {
		searchForm.find("input[name='start']").val($("#start").val());
		searchForm.find("input[name='end']").val($("#end").val());
		searchForm.submit();
	}
});

</script>
</body>
</html>