<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp"%>
<br>
<br>
<br>
<!-- ======= My & Family Section ======= -->
<section id="about" class="about find-page">
	<h2>
		<c:out value="${error}" />
	</h2>
	<h2>
		<c:out value="${logout}" />
	</h2>
	<div class="info" id="info__id">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <!-- 아이디 찾기 -->
                <div class="title"><span class="yogi">아이디 찾기</span></div>
                <div class="center">
                    <div class="card-3d-wrap mx-auto">
                        <div class="card-3d-wrapper">
                            <div class="card-front find-card">
                                <div class="center-wrap">
                                    <div class="section text-center">
                                        <div class="panel-body">
                                            <div id="findId-form">
                                                <form role="form" method='post' action="/member/findId">
                                                    <div class="form-group">
                                                        <input type="text" name="mem_name" class="form-style yogi yo"
                                                            id="myName" autocomplete="off" required="required"
                                                            placeholder="이름"> <i
                                                            class="input-icon uil uil-at"></i>
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="text" name="mem_tel" class="form-style yogi yo"
                                                            id="myTel" autocomplete="off" required="required"
                                                            placeholder="전화번호"> <i
                                                            class="input-icon uil uil-at"></i>
                                                    </div>
                                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                    <button type="submit" id="findButton"
                                                        class="btn btn-lg btn-find btn-block yogi">검색</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <!-- 비밀번호 찾기 -->
                <div class="title"><span class="yogi">비밀번호 찾기</span></div>
                <div class="center">
                    <div class="card-3d-wrap mx-auto">
                        <div class="card-3d-wrapper">
                            <div class="card-front find-card">
                                <div class="center-wrap">
                                    <div class="section text-center">
                                        <div class="panel-body">
                                            <div id="findId-form">
                                                <form role="form" method='post' action="/member/findId">
                                                    <div class="form-groups">
                                                        <a href="/member/generateOTP">
                                                            <input type="button" value="휴대폰으로 찾기" />
                                                        </a>
                                                    </div>
                                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                </form>
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
    </div>
</div>


	<!-- jQuery -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>

	Bootstrap Core JavaScript
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

	Metis Menu Plugin JavaScript
	<script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

	Custom Theme JavaScript
	<script src="/resources/dist/js/sb-admin-2.js"></script>

	<!-- <script src="css/styles.css"></script> -->
	<script>
		$(".btn-find").on(
				"click",
				function(e) {
					e.preventDefault();

					if ($("#myName").val() === null
							|| $("#myName").val() === "") {
						// 빈칸이 있는 상태로 submit을 눌렀을 때
						alert("이름을 입력하세요.");
					} else if ($("#myTel").val() === ""){
						alert("전화번호 입력하세요.");
					} else {
						$("form").submit();
					}
				});
	</script>
	
	<script>
		var myId = '<c:out value="${myId}"/>'
	</script>
</section>

<%@include file="../includes/footer.jsp"%>
