<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
	<nav>
		<div class="inner">
			<div class="headerContent">
				<div class="mainlogo">
					<a href="#"></a>
				</div>
				<ul class="gnb">
					<li><sec:authentication property="principal.username"/><!--관리자 -->님</li>
					<li><a class="LogOut" href="#">로그 아웃</a></li>
				</ul>
			</div>
		</div>
	</nav>
</header>