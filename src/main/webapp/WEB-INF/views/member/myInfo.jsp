<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp"%>
<br>
<br>
<br>
<!-- ======= My & Family Section ======= -->
<section id="about" class="about">
	<div class="container">
		<div class="section-title">
			<h2>My & Family</h2>
			<p>Magnam dolores commodi suscipit. Necessitatibus eius
				consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit.
				Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit
				alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.</p>
		</div>
	</div>
	<!-- 회원용 마이페이지 -->
	<sec:authorize access="hasRole('ROLE_USER')">
	<h2>마이페이지</h2><br/>
	
	<div class="myPage-menu">
		<div class="myAccount">
			<a href="/member/myAccount">내 계정</a>
		</div>
		<div class="reservation">
			<a href="#">예약내역</a>
		</div>
		<div class="payRecord">
			<a href="#">결제내역</a>
		</div>
		<div class="myReview">
			<a href="#">내가 쓴 리뷰</a>
		</div>
	</div>
	</sec:authorize>
	
</section>

<%@include file="../includes/footer.jsp"%>
