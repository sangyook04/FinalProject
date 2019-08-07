<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width,user-scalable=no,initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <title>Final Project_adminLeader</title>
   <!-- CSS -->
   <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<script src="../../../resources/lib/jquery/jquery-3.4.1.min.js"></script>
   <link rel="stylesheet" type="text/css" href="../../../resources/css/common.css">
   <link rel="stylesheet" type="text/css" href="../../../resources/css/adminMain2.css">
   <link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700" rel="stylesheet">
   <link href="../../../resources/css/bootstrap.min.css" type="text/css" rel="stylesheet">
   <link href="../../../resources/css/bootstrap-theme.min.css" type="text/css" rel="stylesheet">
   <link rel="stylesheet" type="text/css" href="../../../resources/css/adminheaderfooter.css">

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
				<div class="content">
					<h1>리더 관리</h1>
						<div class="tableContent">
							<div class="panel panel-default">
							  <!-- Default panel contents -->
							  <!-- Table -->
							  <table class="table table-hover">
								<thead>
								<tr>
									<th>아이디</th><th>리더명</th><th>연락처</th><th>이메일</th>
								</tr>
								</thead>
								<tbody>
									<c:forEach items="${leaderList}" var="leader">
										<tr>
											<td><a class="move" href="<c:out value="${ leader.leaId }"/>"><c:out value="${leader.leaId }"/></a></td>
											<td><c:out value="${leader.leaName }"/></td>
											<td><c:out value="${leader.leaPhonenum }"/></td>
											<td><c:out value="${leader.leaEmail }"/></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						
						<form class="form-inline" id="searchForm" action="/admin/adminLeader" method="get">
						  <div class="form-group">
						    <label for="exampleInputName2">아이디</label>
						    <input type="hidden" name="type" value="I">
						    <input type="text" class="form-control" id="exampleInputName2" name="keyword">
						  </div>
						    <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
						    <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
						  <button type="submit" class="btn btn-default">검색</button>
						</form>
						</div>
						
						<div class="pageBtn">
						  <ul class="pagination">
						  	<c:if test="${pageMaker.prev }">
						  		<li class="paginate_button previous"><a href="${pageMaker.startPage -1}" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
						    </c:if>
						    <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
						    	<li class="paginate_button ${pageMaker.cri.pageNum == num ? 'active' : '' } "><a href="${num}">${num }</a></li>
						    </c:forEach>
						    <c:if test="${pageMaker.next }">
						    	<li class="paginate_button next"><a href="${ pageMaker.endPage +1 }" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
						    </c:if>
						  </ul>
						</div>
						<form id="actionForm" action="/admin/adminLeader" method="get">
							<input type="hidden" name='pageNum' value="${pageMaker.cri.pageNum }">
							<input type="hidden" name='amount' value="${pageMaker.cri.amount }">
						</form>
				</div>
			</div>
		</div><!-- container -->
		<%@ include file="../common/adminfooter.jsp" %>
	</div><!-- wrap -->
	
	<script>
		$(document).ready(function(){
			var actionForm = $("#actionForm");
		
			$(".paginate_button a").on("click", function(e){
				e.preventDefault();
				console.log('click');
				actionForm.find("input[name='pageNum']").val($(this).attr("href"));
				actionForm.submit();
			});
			
			$(".move").on("click", function(e){
				e.preventDefault();
				actionForm.append("<input type='hidden' name='leaId' value='"+ $(this).attr("href")+"'>");
				actionForm.attr("action", "/admin/adminLeaderInfo");
				actionForm.submit();
			});
		});
	</script>
</body>
</html>