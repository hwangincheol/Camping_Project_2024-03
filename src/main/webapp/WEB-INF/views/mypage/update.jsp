<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp"%>

<style>
    .form-floating input {
        border: 1px solid #ced4da !important;
        border-radius: .25rem;
        transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
    }
</style>

<div style="padding-top: 70px;">
	<div
		style="background-image: url('/resources/assets/img/main.jpg'); background-size: cover; background-position: center; height: 270px; display: flex; flex-direction: column; justify-content: center; align-items: center; text-align: center; padding-top: 30px;">
		<h1 class="text-white"
			style="font-family: 'Nanum Gothic'; font-weight: bold;">마이페이지</h1>
	</div>
</div>
<!-- -->
<section id="about" class="about">

	<div class="container">
		<div class="section-title">
			<h2>회원 정보 수정</h2>
		</div>
	</div>

	<div class="col-lg-8" style="margin: 0 auto; width: 60%">
		<h3 class="mb-2">Send us a message</h3>
		<p class="mb-4">
			The contact form is currently inactive. Get a functional and working
			contact form with Ajax & PHP in a few minutes. Just copy and paste
			the files, add a little code and you're done. <a
				href="https://htmlcodex.com/contact-form">Download Now</a>.
		</p>
		<form action="/member/update" method="post" >
			<div class="row g-3">
				<div class="col-md-12">
					<div class="form-floating">
						<input type="text" class="form-control border-0" id="id" placeholder="Your Name" placeholder="Your ID" value="user1" readonly>
						 <label for="id">Your
							ID</label>
					</div>
				</div>
				<div class="col-md-12">
					<div class="form-floating">
						<input type="text" class="form-control border-0" id="name"
							placeholder="Your Name"> <label for="name">Your
							Name</label>
					</div>
				</div>
				<div class="col-md-12">
					<div class="form-floating">
						<input type="email" class="form-control border-0" id="email"
							placeholder="Your Email"> <label for="email">Your
							Email</label>
					</div>
				</div>
				<div class="col-md-12">
					<div class="form-floating">
						<input type="text" class="form-control border-0" id="tel"
							placeholder="Your Tel"> <label for="tel">Your
							Tel</label>
					</div>
				</div>
				<div class="col-md-12 text-center">
				    <button type="button" class="btn btn-primary">수정하기</button>
				</div>
			</div>
		</form>
	</div>

</section>

<%@include file="../includes/footer.jsp"%>
