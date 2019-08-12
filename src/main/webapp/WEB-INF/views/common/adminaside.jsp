<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<script src="../../../resources/lib/jquery/jquery-3.4.1.min.js"></script>
   <link rel="stylesheet" type="text/css" href="../../../resources/css/common.css">
   <link rel="stylesheet" type="text/css" href="../../../resources/css/adminMain.css">
   <link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700" rel="stylesheet">
   <link rel="stylesheet" type="text/css"
	href="../../../resources/css/adminheaderfooter.css">
<script>
	$(document).ready(function() {

		$('.first').hover(function() {
			if ($(".firstSub").css("display") == "none") {
				$('.firstSub').css("display", "block");
				event.preventDefault();
			} else {
				$('.firstSub').css("display", "none");
			}
		});

		$('.firstSub2').hover(function() {
			if ($(".asideSubmenu2").css("display") == "none") {
				$('.asideSubmenu2').css("display", "block");
				event.preventDefault();
			} else {
				$('.asideSubmenu2').css("display", "none");
			}
		});

		$('.second').hover(function() {
			if ($(".secondSub").css("display") == "none") {
				$('.secondSub').css("display", "block");
				event.preventDefault();
			} else {
				$('.secondSub').css("display", "none");
			}
		});

		$('.third').hover(function() {
			if ($(".thirdSub").css("display") == "none") {
				$('.thirdSub').css("display", "block");
				event.preventDefault();
			} else {
				$('.thirdSub').css("display", "none");
			}
		});

		$('.fourth').hover(function() {
			if ($(".asideSubmenu3").css("display") == "none") {
				$('.asideSubmenu3').css("display", "block");
				event.preventDefault();
			} else {
				$('.asideSubmenu3').css("display", "none");
			}
		});

	});//ready
</script>
<aside>
	<ul class="asdieMainMenu">
		<li class="Mainli first">매출 관리
			<ul class="asideSubmenu firstSub">
				<li><a href="/pay/paymentList">결제 내역</a></li>
				<li class="firstSub2">입금 관리
					<ul class="asideSubmenu2">
						<li><a href="/pay/beforeDeposit">입금 전 목록</a></li>
						<li><a href="/pay/afterDeposit">입금 완료 목록</a></li>
					</ul>
				</li>
				<li><a href="/pay/manageList">통계 관리</a></li>
				<li><a href="/pay/refundList">환불 요청 목록</a></li>
			</ul>
		</li>
		<li class="Mainli"><a href="/level/list">레벨테스트 관리</a></li>
		<li class="Mainli"><a href="/admin/adminNoticeManage">공지사항 관리</a></li>
		<li class="Mainli second">고객센터 관리
			<ul class="asideSubmenu secondSub">
				<li><a href="/admin/QnAlist">QnA 관리</a></li>
				<li><a href="/faq/list">FAQ 관리</a></li>
			</ul>
		</li>
		<li class="Mainli third">회원 관리
			<ul class="asideSubmenu thirdSub">
				<li><a href="/admin/adminStudentList">회원 관리</a></li>
				<li><a href="/admin/adminLeader">리더 관리</a></li>
			</ul>
		</li>
		<li class="Mainli fourth">리더가입 관리
			<ul class="asideSubmenu3 forthSub">
				<li><a href="/admin/beforeJoin">가입 대기 리더 목록</a></li>
				<li><a href="/admin/rejectJoin">리더 가입 거부 목록</a></li>
			</ul>
		</li>
	</ul>
</aside>