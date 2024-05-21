<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>admin.jsp</title>
</head>
<body>
<h1>/sample/admin page: 관리자에게만 허용되는 페이지</h1>
<sec:authentication property="principal" var="pinfo" />
<p>principal : ${pinfo}</p>
<p>MemberVO : ${pinfo.member}</p>
<p>사용자이름 : ${pinfo.member.mem_name}</p>
<p>사용자아이디 : ${pinfo.username}</p>
<p>사용자 권한 리스트 :${pinfo.member.authList}</p>

<a href="/">메인페이지로</a>
<a href="/customLogout">Logout</a>

<!-- <sec:authentication property="principal" />: UserDetailService에서 반환된 객체  -->
<!-- principal: CustomUser -> principal.member: Custom 객체의 getMember() 호출 -->
</body>
</html>