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
					<li><a class="LogOut" href="/logout">로그 아웃</a></li>
				</ul>
				<form id="LogOutForm" action="/logout" method="POST">
      			  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    			</form>
			</div>
		</div>
	</nav>
</header>
<script>
	
	$(".LogOut").on("click", function(e){
		e.preventDefault();
		$("#LogOutForm").submit();
	});
	
</script>