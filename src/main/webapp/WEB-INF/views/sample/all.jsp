<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>all.jsp</title>
</head>
<body>
	<h1>/sample/all page: 모든 접속자에게 허용되는 페이지</h1>

	<sec:authorize access="isAnonymous()">
		<!-- isAnonymous(): 익명의 사용자(로그인 하지 않은 경우) -->
		<a href="/customLogin">로그인</a>
	</sec:authorize>

	<sec:authorize access="isAuthenticated()">
		<!-- isAuthenticated(): 인증된 사용자 -->
		<!-- <a href="/customLogout">로그아웃</a> -->
		<div class="panel-body">
			<form role="form" method='post' action="/customLogout">
				<fieldset>
					<!-- Change this to a button or input when using this as a form -->
					<input type="submit" class="btn btn-lg btn-success btn-block" value="Logout">
				</fieldset>
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form>
		</div>
	</sec:authorize>


</body>
</html>