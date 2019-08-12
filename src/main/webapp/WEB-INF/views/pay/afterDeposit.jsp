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
   

   
</head>
<body>
	<div id="wrap">
		<%@ include file="../common/adminheader.jsp" %>
		<div id="container">
			<%@ include file="../common/adminaside.jsp" %>
			
			<!-- End Sidebar Start 내용물-->
			
			<div class="inner">
			<h1>입금 완료 목록</h1>
			<!-- <div class="containerContent"> -->
			<div class="afterDepositList">
				<table class="table table-striped ">
					<thead>
		            	<tr>
		                  <th>리더명<!-- Rendering engine --></th>
		                  <th>금액<!-- Engine version --></th>
		                  <th>계좌번호<!-- Engine version --></th>
		            	</tr>
		            </thead>
		            <tbody>
		            <c:forEach items="${list }" var="payment" >
		            	<tr>
		            		<td>${payment.leader.leaName }</td>
					      	<td>${payment.payMoney == null ? "결제 취소" : payment.payMoney}</td>
					        <td>${payment.leader.leaAccount }</td>
		            	</tr>
		            </c:forEach>
		           </tbody>
				</table>
			</div>
			<!-- </div> -->
			</div>
			<!-- End 내용물 -->
			
		</div><!-- container -->
		
			
		<%@ include file="../common/adminfooter.jsp" %>
	</div><!-- wrap -->
</body>
</html>