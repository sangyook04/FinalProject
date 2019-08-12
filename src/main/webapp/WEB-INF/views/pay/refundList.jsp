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
			<h2>환불 요청 목록</h2>
			<a href="https://admin.iamport.kr/payments" class="btn btn-danger pull-right">결제 취소 처리</a>
			<div class="paymentList">
				<table class="table table-striped table-bordered">
					<thead>
		            	<tr>
		                  <th>환불 번호</th>
		                  <th>결제 번호</th>
		                  <th>요청 날짜</th>
		                  <th>환불</th>
		            	</tr>
		            </thead>
		            <tbody>
		            <c:forEach items="${list}" var="refund">
		            	<tr>
		            		<td>${refund.refIndex }</td>
		            		<td>${refund.payIndex }</td>
					        <td>${refund.refRequest }</td>
					        <td>
					        	<a data-oper="refundBtn" href="${refund.refIndex }" class="btn btn-danger">환불</a>
					        	<a data-oper="payIndex" href="${refund.payIndex }"></a>
					        </td>
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
				<form id="actionForm" action="/pay/refundList" method="get">
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"><!-- 보안토큰 -->
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
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
var refundBtn = $('a[data-oper="refundBtn"]');
var payIndex = $('a[data-oper="payIndex"]');

//페이지 이동
$(".paginate_button a").on("click", function(e){
	e.preventDefault();

	actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	
	actionForm.submit();
});

refundBtn.on("click", function(e){
	e.preventDefault();
	actionForm.append("<input type='hidden' name='refIndex' value='"+ $(this).attr('href')+"'>'"); 
	actionForm.append("<input type='hidden' name='payIndex' value='"+ payIndex.attr('href')+"'>'");
	actionForm.attr("action", "/pay/refundAccept").attr("method", "post");
	actionForm.submit();
});

</script>
</body>
</html>