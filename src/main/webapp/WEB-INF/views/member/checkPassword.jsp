<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp"%>
<br>
<br>
<br>
<!-- ======= My & Family Section ======= -->
<section id="about" class="about">
	<h2>비밀번호 확인</h2>
		<form role="form" action="/member/checkPassword" method="post">
			<input type="password" name="password" class="checkingPassword" autocomplete="off" />
			<button type="submit" class="btn btn-checkingPasswordInput btn-block yogi yo">확인</button>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
	<c:if test="${result}">
		<p><c:out value="${result}" /></p>
	</c:if>
	<c:if test="${error}">
		<p><c:out value="${error}" /></p>
	</c:if>
	<p><%= request.getAttribute("success") %></p>
	<!-- Modal  추가 -->
		<div class="modal fades" id="withdrawModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-titles yogi yo" id="withdrawModalLabel">회원탈퇴</h4>
					</div>
					<div class="modal-bodies yogi yo">
						<p>회원탈퇴가 성공적으로 완료되었습니다.
						<p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-close" data-dismiss="modal">Close</button>
						<!-- <button type="button" class="btn btn-primary">Save
								changes</button> -->
					</div>
				</div>
				<!-- modal-content -->
			</div>
			<!-- modal-dialog -->
		</div>
		<!-- /.modal -->
<script type="text/javascript">
	$(document).ready(function(){
		
		$('#withdrawModalLabel').on("click", function(){
			var result = '<c:out value="${result}" />'
				
			if(result != null){
				alert("회원탈퇴가 성공적으로 완료되었습니다.")
			}	
		})
		
	});
</script>
	
</section>

<%@include file="../includes/footer.jsp"%>
