<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,user-scalable=no,initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Final Project</title>
<!--부트스트랩 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- CSS -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<script src="../../../resources/lib/jquery/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/common.css">
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/main3.css">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700"
	rel="stylesheet">

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
	
			<div class="noticeContent">
				
				
			 <h2><b>공지사항</b></h2>
			
				<div class="noticeContenttable">
				<table class="table">
  <thead>
    <tr>
      <th scope="col">제목</th>
      <th scope="col">${view.notTitle}</th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
   


  </tbody>

</table>
 <textarea class="form-control" rows="3" readonly="readonly"> ${view.notContent }  </textarea>
 
 
 </div>	
 
<button data-oper="noticeList" id="listBtn" >목록</button>

<form id="operForm" action="/notice/noticeView" method="get">
						<input type="hidden" id="notIndex" name="notIndex" value="${view.notIndex }">
						<%-- <input type="hidden" name="pageNum" value="${cri.pageNum }">
						<input type="hidden" name="amount" value="${cri.amount }">
						<input type="hidden" name="type" value="${cri.type }">
						<input type="hidden" name="keyword" value="${cri.keyword }"> --%>
					</form>


	</div>
			</div>
		</div><!-- container -->
		
<%@ include file="../common/footer.jsp" %>

	</div>
	<!-- wrap -->
	
	<script>
$(function() {
	var operForm = $("#operForm");
	
	
	//list
	$('button[data-oper="noticeList"]').on("click", function(e){
		operForm.find('#notIndex').remove();
		operForm.attr("action","/notice/noticeList");
		operForm.submit();
	});
	
	
});
</script>
</body>
</html>