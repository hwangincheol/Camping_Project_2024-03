<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp"%>
<br>
<br>
<br>
<!-- ======= My & Family Section ======= -->
<section id="about" class="about">
	<div class="container">
		<div class="section-title">
			<h2>My & Family</h2>
		</div>
	</div>
	
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">공지 사항</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

	
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading"></div>
				<div class="d-flex justify-content-end">
				<button id='regBtn' type="button" class="btn btn-sm">공지등록</button>
				</div>
				<br>
				<br>
					<div class="panel-boby">
						<table class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>#번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>수정일</th>
									<th>조회수</th>
								</tr>
							</thead>
							
							<c:forEach items="${noticelist}" var="notice">
							<tr>
								<td><c:out value="${notice.board_no}"/></td>
								<td><a href='/notice/noticeget?board_no=<c:out value="${notice.board_no}" />'>
								<c:out value="${notice.board_title }" /></a></td>
								<td><c:out value="${notice.mem_id }" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.board_date }" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${noitce.board_updatedate }" /></td>
								<td><c:out value="${notice.board_hit }" /></td>
							</tr>	
							</c:forEach>
							
						</table>
<!-- Modal 추가 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">공지 사항</h4>
            </div>
            <div class="modal-body">등록이 완료되었습니다.</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="confirmButton" >확인</button>
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

<script type="text/javascript">

$(document).ready(function() {
		
	var result = '<c:out value="${result}"/>';
	
	checkModal(result);
	
	history.replaceState({},null,null);
	
	function checkModal(result) {
		
		if (result === '' || history.state) {
			return;
		}
		
		if (parseInt(result) > 0) {
			
			$(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
			$("#myModal").modal("show");
		}
	}
	
	$("#regBtn").on("click", function() {
		
		self.location ="/notice/noticeregister";
	});
	
	$("#confirmButton").on("click", function(){
		$("#myModal").modal("hide");	// 모달 창 닫기
		
	});
});
</script>