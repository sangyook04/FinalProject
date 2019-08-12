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
   <!-- CSS -->
   <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
   <script src="../../resources/lib/jquery/jquery-3.4.1.min.js"></script>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
   <link rel="stylesheet" type="text/css" href="../../resources/css/common.css">
   <link rel="stylesheet" type="text/css" href="../../resources/css/main.css">
   <link rel="stylesheet" type="text/css" href="../../resources/css/faq.css">
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
      <!-- 내용 칸 -->
      <h1 class="viewh1"> FAQ  </h1>
      
   <ul id="viewul">
   <c:forEach items="${list }" var="faq">
        <li>
            <a href="#">{ ${faq.faqHeadline} }    ${faq.faqTitle }</a>
            <p>${faq.faqContent }</p>
        </li>
     </c:forEach>   
   </ul>
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
   
       <!-- a 태그 대신 pageNum과 amount 파라미터로 전송 -->
               <form id="actionForm" action="/faq/view">
               <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"><!-- 보안토큰 -->
                     <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
                     <input type="hidden" name="amount"  value="${pageMaker.cri.amount }">
               </form>
   <script>   
var actionForm = $("#actionForm");

$(".paginate_button a").on("click", function(e){
   e.preventDefault();   //a 태그 기본 동작 막기
   
   //pageNum의 값을 클릭된 a의 href 값으로 변경
   actionForm.find("input[name='pageNum']")
            .val($(this).attr('href'));
   //폼 전송
   actionForm.submit();
});
</script>
   
   
<script>
$(document).ready(function(){
     $("p").hide();
     $("ul li a").click(function(){
       $(this).next().slideToggle(300);
       $("ul li a").not(this).next().slideUp(300);
       return false;
     });
     $("ul li a").eq(0).trigger("click");
   });

</script>   

      </div><!-- container -->
      
<%@ include file="../common/footer.jsp" %>
   </div><!-- wrap -->
</body>
</html>