<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp"%>
<br>
<br>
<br>
<!-- ======= My & Family Section ======= -->
<section id="about" class="about">
	<div class="section">
		<div class="container">
			<form class="content" action="/member/pw_auth.me" method="post">
				<div class="title">
					<span class="yogi">비밀번호 찾기</span>
				</div>
				<div class="center">
					<div class="card-3d-wrap mx-auto">
						<div class="card-3d-wrapper">
							<div class="card-front find-card">
								<div class="center-wrap">
									<div class="section text-center">
									<div class="generate-form">
										<div class="form-groups textbox" id="textbox_name">
											<input id="myNameForOTP" name=myNameForOTP
												required="required" type="text" class="form-styles" /> <label
												class="myNameForOTP yogi yo" for="text">이름</label>
										</div>
										<div class="form-groups textbox" id="textbox_email">
											<input id="myEmailForOTP" name=myEmailForOTP
												class="form-styles"
												required="/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)?$/i"
												type="email" /> <label class="myEmailForOTP yogi yo"
												for="email">이메일</label>
										</div>
										<div class="form-groups textbox" id="textbox_tel">
											<input id="myTelForOTP" name=myTelForOTP required="required"
												pattern="[0-9]{3}-[0-9]{3,4}-[0-9]{4}" type="text"
												class="form-styles" /> <label class="myTelForOTP yogi yo"
												for="tel">휴대폰</label>
										</div>
										</div>
										<br>
										<br> <input type="submit" id="btn-sendOTP" value="임시 비밀번호 발급" class="btn-OTP yogi yo">
										<input type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token}" />
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>


	<script>
		$("#check").on("click", function() {
			var error = '<c:out value="${error}"/>';
			if (error != null) {
				alert(error);
			}
		})
	</script>


</section>

<%@include file="../includes/footer.jsp"%>
