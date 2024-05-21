<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp"%>
<br>
<br>
<br>
<!-- ======= My & Family Section ======= -->
<section id="about" class="about">

	<!-- jQuery -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="/resources/dist/js/sb-admin-2.js"></script>
	<!-- hasRole('ROLE_USER') -->
	<!-- user 권한의 페이지 -->
	<sec:authorize access="isAuthenticated()">
	<input type="hidden" name='${_csrf.parameterName}' value='${_csrf.token}' />
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
	
	<!-- 내용 -->
	<div class="parents-contents">
	<div class="contents">
	<div class="main-text yogi yo">
		<h2 class="yogi yo myInformation">내 정보</h2>
	</div>
	<div class="jb-division-line"></div>
	<table class="myInfo yogi yo">
	  <tbody>
	    <tr class="tbtr impossible">
	      <td>아이디</td>
	      <td>${member.mem_id}</td>
	    </tr>
	    <tr class="tbtr impossible">
	      <td>이름</td>
	      <td>${member.mem_name}</td>
	    </tr>
	    <tr class="tbtr" onclick="window.location.href = '/member/updateForm';" >
	      <td>비밀번호</td>
	      <td>😘</td>
	    </tr>
	    <tr class="tbtr" onclick="window.location.href = '/member/updateForm';">
	      <td>이메일</td>
	      <td>${member.mem_email}</td>
	    </tr>
	    <tr class="tbtr" onclick="window.location.href = '/member/updateForm';">
	      <td>전화번호</td>
	      <td>${member.mem_tel}</td>
	    </tr>
	    <tr class="tbtr impossible">
	      <td>가입날짜</td>
	      <td>${member.mem_date}</td>
	    </tr>
	    <tr class="tbtr impossible">
	      <td>회원</td>
	      <c:if test="${not empty member.authList}">
	        <td>일반 회원</td>
	      </c:if>
	    </tr>
	  </tbody>
	</table>
	</div>
	</div>
	<script>
		$(".impossible").on("click", function(){
			alert("수정이 불가한 항목입니다.");
		})
	</script>
	<div class="modifyMyInfo">
		<button id="modifyButton" class="btn btn-modiInfo yogi yo" data-oper="modify">회원정보 수정</button>
		
		<form role="form" method='post' action="/customLogout">
			<!-- logout-url을 form 태그의 action에 설정함 -->
			<fieldset>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<!-- Change this to a button or input when using this as a form -->
				<button type="submit" id="logoutButton" class="btn btn-lg btn-success btn-block yogi yo">로그아웃</button>
			</fieldset>
		</form>
		
		<button type="button" id="deleteButton" onclick="deleteAccount();" class="btn btn-lg btn-delete btn-block yogi yo">회원탈퇴</button>
		<!-- Modal  추가 -->
		<!-- Modal 추가 -->
		</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close yogi yo" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title yogi yo" id="myModalLabel">회원탈퇴</h4>
            </div>
            <div class="modal-body yogi yo">
                <p>정말 탈퇴하실 건가요?😥</p>
                <div class="form-group">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary yogi yo" id="confirmWithdraw" data-dismiss="modal">네</button>
                <button type="button" class="btn btn-default yogi yo" id="cancelWithdraw" data-dismiss="modal">마음을 바꿨어요</button>
            </div>
        </div>
        <!-- modal-content -->
    </div>
    <!-- modal-dialog -->
</div>
<!-- /.modal -->

<script>
    $(document).ready(function(){
        // btn-primary 버튼 클릭 시
        $(".btn-delete").click(function() {
            // 모달 열기
            $("#myModal").modal("show");
        });

        // 회원 탈퇴 확인 버튼 클릭 시
        $("#confirmWithdraw").click(function() {
            // 비밀번호 확인 페이지로 이동
            window.location.href = "/member/checkPassword";
            alert("비밀번호 확인 페이지로 이동합니다.");
        });

        // 회원 탈퇴 취소 버튼 클릭 시
        $("#cancelWithdraw").click(function() {
            alert("휴...오랫동안 함께 해요.");
        });
    });
</script>



	<script>
    // 버튼 클릭 시 이동할 URL
    var url = '/member/updateForm';

    // 버튼 요소 찾기
    var button = document.getElementById('modifyButton');

    // 버튼 클릭 이벤트 처리
    button.addEventListener('click', function() {
        // URL로 이동
        window.location.href = url;
    });
</script>
	</div>
	</sec:authorize>
</section>

<%@include file="../includes/footer.jsp"%>
