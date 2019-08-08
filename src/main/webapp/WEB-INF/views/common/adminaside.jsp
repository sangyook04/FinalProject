<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<ul class="asideSubmenu forthSub">
				<li><a href="/admin/beforeJoin">가입 대기 리더 목록</a></li>
				<li><a href="/admin/rejectJoin">리더 가입 거부 목록</a></li>
			</ul>
		</li>
	</ul>
</aside>