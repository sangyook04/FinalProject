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
<meta name="viewport"
	content="width=device-width,user-scalable=no,initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Final Project</title>
<!-- CSS -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<script src="../../../resources/lib/jquery/jquery-3.4.1.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/common.css">
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/adminQnA.css">
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/adminheaderfooter.css">	
<link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700"
	rel="stylesheet">


</head>
<body>
	<div id="wrap">
		<%@ include file="../common/adminheader.jsp" %>
		<div id="container">
			<%@ include file="../common/adminaside.jsp" %>
			<div class="containerContent">
				<h1>QnA 관리</h1>
				<div class="QnAWrap">
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">제목</th>
								<th scope="col">작성자</th>
								<th scope="col">날짜</th>
								<th scope="col">답변상태</th>
							</tr>
						</thead>
						<tbody>
							<!-- Model 데이터 출력 -->
							<c:forEach items="${list}" var="qna">
								<tr>
									<td><a class="move" href="${qna.qnaIndex}">${qna.qnaIndex}</a></td>
									<td>${qna.qnaTitle}</td>
									<td>${qna.qnaWriter}</td>
									<td>${qna.qnaDate}</td>
									<td>${qna.qnaAnsState}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- 액션폼 -->
					<form id='actionForm' action="/admin/QnAlist" method="get">
						<input type="hidden" name="pageNum"
							value="${pageMaker.cri.pageNum }"> <input type="hidden"
							name="amount" value="${pageMaker.cri.amount }">
					</form>

					<!-- 페이징 -->
					<div class="pull-center">
						<ul class="pagination">
							<!-- previous 버튼 표시 -->
							<c:if test="${pageMaker.prev }">
								<li class="paginate_button previous"><a
									href="${pageMaker.startPage -1}">이전으로</a></li>
							</c:if>

							<!-- 페이지 번호 표시 -->
							<c:forEach var="num" begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }">
								<li
									class='paginate_button ${pageMaker.cri.pageNum == num ? "active":"" } '>
									<a href="${num}"> ${num} </a>
								</li>
							</c:forEach>
							<!-- next 버튼 표시 -->
							<c:if test="${pageMaker.next }">
								<li class="paginate_button next"><a
									href="${pageMaker.endPage +1 }">다음으로</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- container -->
		<%@ include file="../common/adminfooter.jsp" %>
	</div>
	<!-- wrap -->
	<script>
		var actionForm = $("#actionForm");

		//상세보기 페이지 이동
		$(".move")
				.on(
						"click",
						function(e) {
							e.preventDefault();
							actionForm
									.append("<input type='hidden' name='qnaIndex' value='"
											+ $(this).attr("href") + "'>");
							actionForm.attr("action", "/admin/QnAget");
							actionForm.submit();

						});

		//페이지 이동하기
		$(".paginate_button a").on("click", function(e) {
			e.preventDefault();

			actionForm.find("input[name='pageNum']").val($(this).attr("href"));

			actionForm.submit();
		});
	</script>
</body>
</html>