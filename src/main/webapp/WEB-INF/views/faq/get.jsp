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
         <h2 id="faqh2">FAQ 상세 정보</h2>
         
         <form id="modifyform" action="/faq/modify" method="get">
         <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"><!-- 보안토큰 -->
         <label>FAQ 번호</label>
         <input type="text"  class="form-control" readonly="readonly" value="${faqget.faqIndex }">
         <label>FAQ 분류</label>
         <input type="text" class="form-control" readonly="readonly" value="${faqget.faqHeadline }">
         <label>FAQ 제목</label>
         <input type="text" class="form-control" readonly="readonly" value="${faqget.faqTitle }">
         <label>FAQ 내용</label>
         <textarea class="form-control" rows="30" disabled="disabled">${faqget.faqContent }</textarea>
         </form>
         
         <button data-oper="libtn"  class="btn btn-default" id="listbtn">목록</button>
         <button data-oper="modibtn"  class="btn btn-warning" id="regibtn">수정</button>
         <button data-oper="delbtn"  class="btn btn-danger" id="delbtn">삭제</button>
         
         
         <form id="listform" action="/faq/list" method="get">
         <input type="hidden" id="faqIndex"   name="faqIndex" value="${faqget.faqIndex }">
         <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"><!-- 보안토큰 -->
                  <!-- 페이지 번호와 페이지 당 표시 개수 파라미터 추가 -->
         <input type="hidden" name="pageNum" value="${cri.pageNum }">
         <input type="hidden" name="amount" value="${cri.amount }">   
         </form>
         
         
         
      
         </div>
            
         </div>
<script>
var modifyform = $("#modifyform");
var listform = $("#listform");

$('button[data-oper="libtn"]').on("click",function(e){
   listform.find("#faqIndex").remove();
   listform.submit();
});


$('button[data-oper="modibtn"]').on("click",function(e){
   modifyform.append("<input type='hidden' name='faqIndex' value='"+${faqget.faqIndex }+"'>'");
   modifyform.append("<input type='hidden' name='pageNum' value='"+${cri.pageNum} + "'>'");
   modifyform.append("<input type='hidden' name='amount' value='"+${cri.amount} + "'>'");
   modifyform.submit();
});

$('button[data-oper="delbtn"]').on("click",function(e){
   if(confirm("정말 삭제하시겠습니까?")){
      listform.attr("action", "/faq/remove").attr("method","post").submit();
   } else{
      return false;
   }
   
   
});




</script>         
         
         
      </div><!-- container -->
      <%@ include file="../common/adminfooter.jsp" %>
   </div><!-- wrap -->
</body>
</html>