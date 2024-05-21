<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp"%>
<br>
<br>
<br>
<!-- -->
<section id="about" class="about">
	
	<sec:authorize access="isAuthenticated()">
	<!-- 사이드메뉴 -->
	<div class="myPage-sideMenu">
		<div class="myAccount">
			<button type="button" class="btn-sidebar yogi yo" onclick="window.location.href='/member/myAccount'">내 정보</button>
		</div>
		<div class="reservation">
			<button type="button" class="btn-sidebar yogi yo" onclick="window.location.href='/member/myAccount'">예약내역</button>
		</div>
		<div class="payRecord">
			<button type="button" class="btn-sidebar yogi yo" onclick="window.location.href='/member/myAccount'">결제 정보</button>
		</div>
		<div class="myReview">
			<button type="button" class="btn-sidebar yogi yo" onclick="window.location.href='/member/myAccount'">내가 작성한 글</button>
		</div>
	</div>
	
	<!-- 회원정보 수정 -->
	<br>
	<h2 id="modifyInfo-title" class="yogi yo">회원정보 수정</h2>
	<div class="modify-box">
	<div class="jb-division-line"></div>
	<form role="form" action="/member/updateForm" method="post">
	<input type='hidden' name='mem_id' value='${member.mem_id}' />
	<input type="hidden" name='${_csrf.parameterName}' value='${_csrf.token}' />
		<div class="form-groups">
			<label class="yogi yo">아이디</label>
			<div class="form-controls">${member.mem_id}</div>
		</div>
		
		<div class="form-groups">
			<label class="yogi yo">비밀번호</label>
			<input class="form-controls"  type="password" name="mem_pw" value='${member.mem_pw}'>
		</div>
		
		<div class="form-groups">
			<label class="yogi yo">이름</label>
			<input class="form-controls" name='mem_name' value='${member.mem_name}' readonly="readonly" >
		</div>
		<div class="form-groups">
			<label class="yogi yo">이메일</label>
			<input class="form-controls" type="text" name='mem_email' value='${member.mem_email}'>
		</div>
		<div class="form-groups">
			<label class="yogi yo">전화번호</label>
			<input class="form-controls" type="text" name='mem_tel' value='${member.mem_tel}'>
		</div>
		<div class="form-groups">
			<label class="yogi yo">가입 날짜</label>
			<input class="form-controls" name='mem_date' value='${member.mem_date}' readonly="readonly"/>
		</div>
		
		<div id="modifyCompleted"><button type="submit" class="btn btn-primary">수정</button></div>
	</form>
	</div>
</sec:authorize>

</section>

<%@include file="../includes/footer.jsp"%>
