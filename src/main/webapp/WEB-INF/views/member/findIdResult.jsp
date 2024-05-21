<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp"%>
<br>
<br>
<br>
<!-- ======= My & Family Section ======= -->
<section id="about" class="about find-page">
	<div class="section">
		<div class="container">
					<div class="center">
					<div class="title"><span class="yogi">아이디 찾기</span></div>
						<div class="card-3d-wrap mx-auto">
							<div class="card-3d-wrapper">
								<div class="card-front find-card">
									<div class="center-wrap">
										<div class="section text-center">
											<div class="panel-body">
											<div id="findId-form">
												<form role="form" method='post' action="/member/findId" class="findId-form2">
												<c:if test="${not empty mem_name}">
												<p class="findId yogi yo"><c:out value="${mem_name}" />님의 아이디</p>
													<div class="cross-line"></div>
													<div class="foundId yogi yo">
														<c:out value="${foundId}" />
													</div>
												</c:if>	
												<c:if test="${empty mem_name}">
												<p class="yogi yo">${error}</p>
												</c:if>	
												</form>
												<button type="submit" onclick="window.location.href='/member/customLogin'" 
												id="loginButton"
												class="btn btn-lg btn-fromFindToLogin btn-block yogi">로그인하기</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
</section>

<%@include file="../includes/footer.jsp"%>
