<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
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
<link rel="stylesheet" type="text/css" href="../../resources/css/headerfooter.css">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700"
	rel="stylesheet">




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

			<div class="innerNotice">

			
			<div class="inner">
				<h2>
					<b>공지사항</b>
				</h2>
				<div class="noticeTable">
					
						<table class="table table-hover tablenoticeContent">
							<thead>
								<tr>
									
									<th scope="col">번호</th>
									<th scope="col">제목</th>
									<th scope="col">날짜</th>

								</tr>
							</thead>
							  <tbody>
              
                   <c:forEach items="${noticeList }" var="notice">
                   	   <tr>
                   	   <td>${notice.notIndex}</td> 
                   	   	   <td>
                   	   	   	   <a class="move" href="${notice.notIndex}">	${notice.notTitle} </a></td>
                   	   	  
                   	   
                   	   	   
                   	   	   <td> ${notice.notDate} </td>
                   	   </tr>
                   </c:forEach>
                   </tbody>
					
						</table>
						
					</div>
				
				
		
		<!-- 액션폼 -->
					<form id='actionForm' action="/common/noticeList" method="get">
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
						<%-- <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
						<input type="hidden" name="type" value="${pageMaker.cri.type }">
						<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }"> --%>
					</form>
				</div>
		
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
				</div>
			</div>
			<!-- End 내용물 -->
		</div><!-- container -->
		
		
		<%@ include file="../common/footer.jsp" %>
	</div>
	<!-- wrap -->

	<script>
		var actionForm = $("#actionForm");

		/* //등록 이벤트
		$("#regBtn").on("click", function() {
			self.location = "/level/register";
		}); */

		//상세보기 페이지 이동
		$(".move")
				.on(
						"click",
						function(e) {
							e.preventDefault();
							actionForm
									.append("<input type='hidden' name='notIndex' value='"
											+ $(this).attr("href") + "'>");
							actionForm.attr("action", "/common/noticeView");
							actionForm.submit();

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