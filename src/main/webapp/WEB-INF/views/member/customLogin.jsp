<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp"%>
<br>
<br>
<br>
<!-- ======= My & Family Section ======= -->
<section id="about" class="about">
	<h2>
		<c:out value="${error}" />
	</h2>
	<h2>
		<c:out value="${logout}" />
	</h2>
	<div class="section">
		<div class="container">
					<div class="title"><span class="yogi">로그인</span></div>
					<div class="center">
						<div class="card-3d-wrap mx-auto">
							<div class="card-3d-wrapper">
								<div class="card-front">
									<div class="center-wrap">
										<div class="section text-center">
											<div class="error-msg">
												<c:if test="${not empty errorMsgName}" >
												<font color="red"> <!-- <p>Your Login attempt was not successful due to <br/> -->
													<p class="yogi yo">${errorMsgName}</p>
												</font>
												</c:if>
											</div>
											
											<div class="panel-body">
											<div id="login-form">
												<form role="form" method='post' action="/login">
													<!-- 3. post 메서드를 통해서 /login URI로 폼 데이터 전달(아이디, 비밀번호(토큰) 전달) -> security-context.xml로 넘어감 -->
													<div class="form-groups">
														<input type="text" name="username" class="form-styles yogi yo"
															id="logusername" autocomplete="off" required="required"
															placeholder="아이디"> <i
															class="input-icon uil uil-at"></i>
													</div>
													<div class="form-groups mt-2">
														<input type="password" name="password" class="form-styles yogi yo"
															placeholder="비밀번호" id="logpass" autocomplete="off" required="required">
														<i class="input-icon uil uil-lock-alt"></i>
													</div>
													<div class="remember">
														<label> <input type="checkbox" id="rememberAccount" class="chk-box-remember yogi yo" name="remember-me" > 아이디 저장
														</label>
													</div>
													<!-- <a href="index.html" class="btn btn-lg btn-success btn-block">submit</a> -->
													<%-- <input type="submit"
														class="btn btn-lg btn-success btn-block" value="Submit" />
													<input type="hidden" name="${_csrf.parameterName}"
														value="${_csrf.token}" /> --%>
												<!-- </form> -->
												<input type="submit" id="loginButton"
														class="btn btn-lg btn-login btn-block yogi" value="로그인">
													<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
												</form>
												</div>
											</div>
											<p class="mb-0 mt-4 text-center">
												<a href="/member/findAccount" class="link findAccount yogi yo">아이디/비밀번호 찾기</a>
											</p>
											<p class="mb-0 mt-4 text-center">
												<a href="/member/join" class="link findAccount yogi yo">회원가입 하러 가기</a>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
		</div>
	</div>

	<script>
		$(".btn-success").on(
				"click",
				function(e) {
					e.preventDefault();

					if ($("#logusername").val() === null
							|| $("#logusername").val() === "") {
						// 빈칸이 있는 상태로 submit을 눌렀을 때
						alert("아이디를 입력하세요.");
					} else if($("#logpass").val() === null || $("#logpass").val() === "") {
						alert("비밀번호를 입력하세요.");
					} else {
						$("form").submit();
					}
				});
	</script>
	
	<script>
		var result = '${result}';
		if(result !== ""){
			alert("회원가입이 성공적으로 완료되었습니다.");
		}
	</script>
	
	<c:if test="${param.logout != null}">
		<script>
			$(document).ready(function() {
				alert("로그아웃하였습니다.");
			});
		</script>
	</c:if>
</section>

<%@include file="../includes/footer.jsp"%>
