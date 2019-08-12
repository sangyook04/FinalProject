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
   <script src="../../../resources/lib/jquery/jquery-3.4.1.min.js"></script>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
   <link rel="stylesheet" type="text/css" href="../../../resources/css/common.css">
   <link rel="stylesheet" type="text/css" href="../../../resources/css/adminMain.css">
   <link rel="stylesheet" type="text/css" href="../../../resources/css/faq.css">
   <link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700" rel="stylesheet">
   <link rel="stylesheet" type="text/css"
   href="../../../resources/css/adminheaderfooter.css">
  
</head>
<body>
   <div id="wrap">
   <%@ include file="../common/adminheader.jsp" %>
      <div id="container">
      <%@ include file="../common/adminaside.jsp" %>
         <div class="containerContent">
         <!-- 내용  -->
         <div class="inner">
         <h2 id="faqh2">FAQ 관리</h2>
         <button class="btn btn-primary" id="registerbtn">FAQ 등록</button>
         <table class="table table-bordered" id="faqtable">
            <thead>
               <tr>
                  <th>번호</th><th>분류</th><th>제목</th>
               </tr>            
            </thead>
            
            <tbody>
            <c:forEach items="${list}" var="faqlist">
               <tr>
            <td>${faqlist.faqIndex }</td> <td><a class ="move" href="${faqlist.faqIndex }">${faqlist.faqHeadline}</a></td><td>${faqlist.faqTitle }</td>
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
         
                <!-- a 태그 대신 pageNum과 amount 파라미터로 전송 -->
               <form id="actionForm" action="/faq/list">
               <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"><!-- 보안토큰 -->
                     <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
                     <input type="hidden" name="amount"  value="${pageMaker.cri.amount }">
               </form>
         
         
         
         
         </div>
      
         </div>
      </div><!-- container -->
      
<script>

//페이지 번호를 클릭하면 해당 페이지 목록 표시
var actionForm = $("#actionForm");

$(".paginate_button a").on("click", function(e){
   e.preventDefault();   //a 태그 기본 동작 막기
   
   //pageNum의 값을 클릭된 a의 href 값으로 변경
   actionForm.find("input[name='pageNum']")
            .val($(this).attr('href'));
   //폼 전송
   actionForm.submit();
});

//a 태그의 move 클래스 속성을 이용
$(".move").on("click", function(e){
   //a 태그의 기본 동작 막고
   e.preventDefault();   
   
   actionForm.append("<input type='hidden' name='faqIndex' value='"+
                $(this).attr('href')+"'>'");
   actionForm.attr("action", "/faq/get");
   actionForm.submit();
});

$("#registerbtn").on("click", function(){
   self.location = "/faq/register";
});


</script>   

<script>
//잘 돌아가지만 왜 돌아가는지 모름 
//el 사용시 기본 얼럿 출력이 안됨 이유는 모름
//나중에 시간 나면 수정
//하나의 스크립트 안에 쓰면 안됨 이유는 모름
var result = ${result};
 if(result != null){
   alert(result +"등록 되었습니다.");
}
</script>   

<script>
var reresult = ${reresult};
 if(reresult != null){
   alert(reresult + "삭제 되었습니다.");
} 
</script>   

<script>
var moresult = ${moresult};
if(moresult != null){
   alert(moresult + "변경 완료되었습니다. ");
}
</script>
   
      
      
      <%@ include file="../common/adminfooter.jsp" %>
   </div><!-- wrap -->
</body>
</html>