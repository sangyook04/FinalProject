<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
         <h2 id="faqh2">FAQ 등록</h2>
         <form action="/faq/register" method="post" id="regform">
         <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"><!-- 보안토큰 -->
         <label>FAQ 제목</label>
         <input type="text" class="form-control" name="faqTitle" id="faqTitle" required="required">
         <label>분류 목록</label>
         <select class="form-control" name="faqHeadline" id="faqHeadline">
            <option value="취소 및 환불">취소 및 환불</option>
            <option value="서비스 사용">서비스 사용</option>
            <option value="스터디 진행">스터디 진행</option>
            <option value="결제">결제</option>
         </select>
         <label>FAQ 내용</label>
         <textarea class="form-control" rows="25" name="faqContent" id="faqContent" required="required"></textarea>
            

         <button class="btn btn-primary" id="regibtn">등록</button>
         <button class="btn btn-default" id="listbtn">목록</button>
         </form>
         
<script>
var regform =$("#regform");

$("#listbtn").on("click", function(){
   regform.find("#faqContent").remove();
   regform.find("#faqTitle").remove();
   regform.find("#faqHeadline").remove();
   regform.attr("method", "get");
   regform.attr("action","/faq/list").submit();
});


</script>         
         
      
         </div>
            
         </div>
      </div><!-- container -->
      <%@ include file="../common/adminfooter.jsp" %>
   </div><!-- wrap -->
</body>
</html>