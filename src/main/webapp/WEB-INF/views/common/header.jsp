<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<header>
	<nav>
		<div class="inner">
			<div class="headerContent">
				<sec:authentication property="principal" var="pinfo"/>
				<div class="mainlogo">
					<a href="/"></a>
				</div>
				<ul class="mainmenu">
					<li><a href="#">스터디 찾기</a></li>
					<li><a href="/level/commonTest?stuId=${principal.username}">레벨 테스트</a></li>
					<li><a href="/common/noticeList">공지사항</a></li>
					<li class="one"><a href="#">고객센터</a>
						<ul class="callsenterSub">
							<li><a href="#">FAQ</a></li>
							<sec:authorize access="isAuthenticated()">
								<li><a href="/loginCommon/list">QnA</a></li>
							</sec:authorize>
						</ul></li>
					</ul>
				<sec:authorize access="isAnonymous()">
					<ul class="gnb">
						<li><a href="/common/login">로그인</a></li>
						<li><a href="/common/studentJoin">학생 회원가입</a></li>
						<li><a href="/common/leaderTest">리더 시작하기</a></li>
					</ul>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_STUDENT')">
					<ul class="gnb">
						<li class="myPage"><a href="#">마이페이지</a>
							<ul class="myPageContent">
								<li><a href="/student/studentMyInfo?stuId=${pinfo.username}">내 정보 출력</a></li>
								<li><a href="/student/studentLevelGet?stuId=${pinfo.username}">레벨테스트 결과</a></li>
								<li><a href="#">내 스터디</a></li>
								<li><a href="#">관심 스터디</a></li>
								<li><a href="/loginCommon/mylist">문의 내역</a></li>
								<li><a href="/student/studentDrop">탈퇴 하기</a></li>
							</ul></li>
						<li><sec:authentication property="principal.username" />
							<!--학생 -->님</li>
						<li><a class="LogOut" href="/logout">로그 아웃</a></li>
					</ul>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_LEADER')">
					<ul class="gnb">
						<li class="myPage"><a href="#">마이페이지</a>
							<ul class="myPageContent">
								<li><a href="/leader/info?leaId=${pinfo.username}">내 정보 출력</a></li>
								<li><a href="#">내 스터디</a></li>
								<li><a href="/pay/incomeList?leaderId=${pinfo.username}">소득 내역</a></li>
								<li><a href="/loginCommon/mylist">문의 내역</a></li>
								<li><a href="#">탈퇴 하기</a></li>
							</ul></li>
						<li><a href="#">스터디 개설</a></li>
						<li><sec:authentication property="principal.username" />
							<!--리더-->님</li>
						<li><a class="LogOut" href="/logout">로그 아웃</a></li>
					</ul>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<ul class="gnb">
						<li class="myPage"><a href="/admin/main">관리자 페이지</a>
						<li><sec:authentication property="principal.username" />
							<!--관리자-->님</li>
						<li><a class="LogOut" href="/logout">로그 아웃</a></li>
					</ul>
				</sec:authorize>
				<form id="LogOutForm" action="/logout" method="POST">
      			  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    			</form>
			</div><!-- headerContent -->
		</div>
	</nav>
</header>
<script>
	
	$(".LogOut").on("click", function(e){
		e.preventDefault();
		$("#LogOutForm").submit();
	});
		

	$('nav .myPage').hover(function() {
		if ($(".myPageContent").css("display") == "none") {
			$('.myPageContent').slideDown();
			$("headerA").css("color", "#f15b6d");
			//stopPropagation();
		} else {
			$('.myPageContent').css("display", "none");
			event.stopPropagation();
			event.preventDefault();
		}
	});
</script>
