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
		<div id="container">
		<!-- 내용 입력 칸 -->
		
		<div class="inner">
		<h1 class="studyingh1">시작 예정 스터디 </h1>	
		<table class="table table-striped">
			<thead class="studyingthead">
				<tr>
					<th class="th1">이름</th><th class="th2">기간</th>
					<th class="th3">레벨</th><th class="th4">장소</th>
					<th class="th5">가격</th>
				</tr>
			</thead>
			<tbody class="studyingtbody">
			
			<c:forEach items="${list}" var="list">
				<tr>
					<td class="td1"><a class="move" href="${list.studyIndex }">${list.studyName }</a></td>
					<td class="td2">${list.studyStartdate } ~ ${list.studyEnddate } </td>
					<td class="td3">${list.studyLevel }</td><td class="td4">${list.studyPlace }</td>
					<td class="td5">${list.studyPrice } 원</td>
					<td class="td7"><a data-oper="mobtn" class="btn btn-primary" href="${list.studyIndex }">수정</a></td>
					<td class="td8"><a data-oper="rebtn" class="btn btn-danger" href="${list.studyIndex }">삭제</a></td>
				</tr>
			</c:forEach>
				
			</tbody>
		</table>
		
		
		 <!-- 페이지 번호 출력 -->
				   <div class="pull-right">
				   		<ul class="pagination">
				   		<c:if test="${pageMaker.prev }"><!-- previous 버튼 표시 -->
				   			<li class="paginate_button previous">
				   				<a href="${pageMaker.startPage - 1 }">
				   					Previous</a></li>
				   		</c:if>
				   						   		
				   		<!-- 페이지 번호 표시 -->
				   		<c:forEach begin="${pageMaker.startPage }"
				   				   end="${pageMaker.endPage }" var="num">
				   			<li class="paginate_button
				   			           ${pageMaker.cri.pageNum == num ? 'active': '' }">
				   				<a href="${num }">${num }</a></li>
				   		</c:forEach>
				   		
				   		<c:if test="${pageMaker.next }"><!-- next 버튼 표시 -->
				   			<li class="paginate_button next">
				   				<a href="${pageMaker.endPage + 1 }">Next</a></li>
				   		</c:if>
				   		</ul>
				   </div>
				   
			<form id=actionForm action="/study/scheduleList" method="post">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"><!-- 보안토큰 -->
			  <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
		      <input type="hidden" name="amount"  value="${pageMaker.cri.amount }">	
			</form>
				
	
		</div>
		
<script>
//페이지 번호를 클릭하면 해당 페이지 목록 표시
var actionForm = $("#actionForm");


$(".paginate_button a").on("click", function(e){
	e.preventDefault();	//a 태그 기본 동작 막기
	
	//pageNum의 값을 클릭된 a의 href 값으로 변경
	actionForm.find("input[name='pageNum']").val($(this).attr('href'));
	actionForm.attr("method", "get");
	//폼 전송
	actionForm.submit();
});

//a 태그의 move 클래스 속성을 이용
 $(".move").on("click", function(e){
	//a 태그의 기본 동작 막고
	e.preventDefault();	
	
	actionForm.append("<input type='hidden' name='studyIndex' value='"+
					 $(this).attr('href')+"'>'");
	actionForm.attr("action", "/study/get");
	actionForm.attr("method","get");
	actionForm.submit();
}); 

	
$('a[data-oper="rebtn"]').on("click",function(e){
	e.preventDefault();

	if(confirm("정말 삭제하시겠습니까?")){
		actionForm.append("<input type='hidden' name='studyIndex' value='"+ $(this).attr('href')+"'>'"); 
		actionForm.attr("action", "/study/scheduleRemove");
		actionForm.submit();
	}else {
		return false;
	}
});

$('a[data-oper="mobtn"]').on("click",function(e){
		e.preventDefault();
		actionForm.append("<input type='hidden' name='studyIndex' value='"+ $(this).attr('href')+"'>'"); 
		actionForm.attr("action", "/study/scheduleModify").attr("method","get");
		actionForm.submit();
});




</script>
		 
		
		</div><!-- container -->
		<%@ include file="../common/footer.jsp" %>
	</div><!-- wrap -->
</body>
</html>