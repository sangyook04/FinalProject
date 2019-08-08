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
				<div class="mainlogo">
					<a href="/"></a>
				</div>
				<ul class="gnb">
					<li><sec:authentication property="principal.username"/><!--관리자 -->님</li>
					<li><a class="LogOut" href="/common/logout">로그 아웃</a></li>
				</ul>
			</div>
		</div>
	</nav>
</header>