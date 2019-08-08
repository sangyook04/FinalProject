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
   <!-- 부트스트랩 -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
   <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<script src="../../resources/lib/jquery/jquery-3.4.1.min.js"></script>
   <link rel="stylesheet" type="text/css" href="../../resources/css/common.css">
   <link rel="stylesheet" type="text/css" href="../../resources/css/main.css">
   <link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700" rel="stylesheet">
   <link rel="stylesheet" type="text/css" href="../../resources/css/headerfooter.css">
   
   <!-- 아임포트결제 -->
   <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
   <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
   
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
   
    
    
<style>
	#container .inner{
    text-align: center;
    }
    
    #container .inner h1{
    margin: 100px 0px 50px 0px;
    text-align: left;
    }
    
    caption{
    caption-side: bottom;
    }
    
    [type=checkbox] {
    display: inline-block;
    width: 20px; height: 20px;
    }
</style>
</head>
<body>
	<div id="wrap">
		<%@ include file="../common/header.jsp" %>
<!-- End Header -->

		<div id="container">
			<div class="inner">
				<h1>스터디 결제 정보</h1>
					<div class="payInfo">
						<table class="table table-striped table-bordered">
							<thead>
		                       <tr>
		                           <th>스터디명<!-- Rendering engine --></th>
		                           <th>레벨<!-- Browser --></th>
		                           <th>기간<!-- Platform(s) --></th>
		                           <th>금액<!-- Engine version --></th>
		                       </tr>
		                   </thead>
		                   <tbody>
			                   <tr>
			                   	   <td>${study.studyName}</td>
			                   	   <td>${study.studyLevel}</td>
			                   	   <td>${study.studyStartdate} ~ ${study.studyEnddate}</td>
				                   <td>${study.studyPrice}</td>
			                   </tr>
		                   </tbody>
		                <caption>
		                	<strong>- 스터디 시작시 구매 취소는 불가합니다.</strong><br>
		                	<strong>- 같은 상품은 재주문이 불가합니다.</strong>
		                </caption>
						</table>
						
						<!-- 개인정보제공동의 -->
						<div class="panel panel-default">
							<div class="panel-heading">개인정보 제3자 제공</div>
						  	<div class="panel-body">
						    	스콜피온의 회원계정으로 상품 및 서비스를 구매하고자 할 경우, (주)스콜피온는 거래 당사자간 원활한 의사소통 및 배송, 상담 등 거래이행을 위하여 필요한 최소한의 개인정보만을 스콜피온 입점업체 판매자 및 배송업체에 아래와 같이 공유하고 있습니다.
1. (주)스콜피온는 귀하께서 스콜피온 입점업체 판매자로부터 상품 및 서비스를 구매하고자 할 경우, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 제 24조의 2(개인정보 공유동의 등)에 따라 아래와 같은 사항은 안내하고 동의를 받아 귀하의 개인정보를 판매자에게 공유합니다. "개인정보 제3자 공유 동의"를 체크하시면 개인정보 공유에 대해 동의한 것으로 간주합니다.
2. 개인정보를 공유받는자 : 주식회사 레이어 
3. 공유하는 개인정보 항목
- 구매자 정보: 성명, 전화번호, ID, 휴대전화 번호, 메일주소, 상품 구매정보
- 수령자 정보: 성명, 전화번호, 휴대전화 번호, 배송지 주소
4. 개인정보를 공유받는 자의 이용 목적 : 판매자와 구매자의 거래의 원활한 진행, 본인의사의 확인, 고객 상담 및 불만처리, 상품과 경품 배송을 위한 배송지 확인 등
5. 개인정보를 공유받는 자의 개인정보 보유 및 이용 기간 : 개인정보 수집 및 이용 목적 달성 시까지 보관합니다.
6. 동의 거부 시 불이익 : 본 개인정보 공유에 동의하지 않으시는 경우, 동의를 거부할 수 있으며, 이 경우 거래가 제한됩니다.
						  	</div>
						</div>
						
						<input id="agree" type="checkbox"> 위 상품 정보 및 거래 조건을 확인하였으며, 개인정보 제3자 제공에 동의합니다.(필수)
						<br>
						<button type="button" id="paymentBtn" class="btn btn-success">결제하기</button>
					</div>
				<form id="payForm" action="/pay/payment" method="post">
					<input type="hidden" name="stuId" value="${studentId}">
					<input type="hidden" name="leaId" value="${study.leaId}">
					<input type="hidden" name="studyIndex" value="${study.studyIndex}">
					<input type="hidden" name="payMoney" value="${study.studyPrice}">
				</form>
			</div><!-- End inner -->
		</div><!-- container -->
		
<!-- Start Footer -->
		<%@ include file="../common/footer.jsp" %>
	</div><!-- wrap -->
<script>
var IMP = window.IMP; // 생략가능
IMP.init("imp26864706"); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
var payForm = $("#payForm");
var today = new Date();

$("#paymentBtn").on("click", function(e){
	if($("#agree")[0].checked == true){
		IMP.request_pay({
		    pg : 'kakao', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명:결제테스트',
		    amount : '10',
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '강푸른',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456',
		    m_redirect_url : 'redirect:/'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
//		        payForm.find("input[name='payDate']").val(today);
		        payForm.submit();
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		});
	} else if($("#agree")[0].checked == false){
		alert("개인정보 제공에 동의해주세요.");
	}
})
</script>
</body>
</html>