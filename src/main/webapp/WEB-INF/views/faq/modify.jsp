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
         <h2 id="faqh2">FAQ 수정</h2>
         
         <form id= "faqform" action="/faq/modify" method="post">
         <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"><!-- 보안토큰 -->
         <label>FAQ 번호</label>
         <input type="text" name="faqIndex" id="faqIndex" class="form-control" readonly="readonly" value="${faqget.faqIndex }">
         <label>분류 목록</label>
         <select class="form-control" name="faqHeadline" id="faqHeadline">
            <option selected="selected" value="${faqget.faqHeadline}">현재 분류 = ${faqget.faqHeadline}</option>
            <option value="취소 및 환불">취소 및 환불</option>
            <option value="서비스 사용">서비스 사용</option>
            <option value="스터디 진행">스터디 진행</option>
            <option value="결제">결제</option>
         </select>
         <label>FAQ 제목</label>
         <input type="text" name="faqTitle" id="faqTitle" class="form-control" value="${faqget.faqTitle }" >
         
         <label>FAQ 내용</label>
         <textarea name="faqContent" id="faqContent" class="form-control" rows="30" > ${faqget.faqContent }</textarea>
            
         <button  class="btn btn-warning" id="regibtn">수정</button>
         <button data-oper="libtn" class="btn btn-default" id="listbtn">목록</button>
         </form>
         
         
         
<script>
var faqform = $("#faqform");

$('button[data-oper="libtn"]').on("click",function(e){
   faqform.find("#faqContent").remove();
   faqform.find("#faqTitle").remove();
   faqform.find("#faqHeadline").remove();
   faqform.find("#faqIndex").remove();
   faqform.append("<input type='hidden' name='pageNum' value='"+${cri.pageNum}+"'>");
   faqform.append("<input type='hidden' name='amount' value='"+${cri.amount}+"'>");
   faqform.attr("action", "/faq/list");
   faqform.attr("method", "get");
   faqform.submit();
});

</script>         
      
         </div>
            
         </div>
      </div><!-- container -->
   <%@ include file="../common/adminfooter.jsp" %>
   </div><!-- wrap -->
</body>
</html>