<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="../includes/header.jsp"%>
<br>
<br>
<br>
<br>
<!-- 검색스타일 -->
<style>
#searchForm button {
    float: right;
    margin-left: 5px;
}


#searchForm {
    text-align: right;
    margin-right: 10px;
}
</style>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">자유게시판</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="col-lg-12" style="padding-left: 10px; padding-right: 10px;"><div class="col-lg-12" style="padding-left: 10px; padding-right: 10px;">
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<button id='regBtn' type="button" class="btn btn-primary btn-xs pull-right">등록</button>
			</div>
			<br>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>수정일</th>
							<th>조회수</th>
						</tr>
					</thead>
			<tbody>
          <c:forEach items="${list}" var="board">
            <tr>
              <td><c:out value="${board.board_no}" /></td>
               <td>
                  <a class='move' href='<c:out value="${board.board_no}"/>' style="text-decoration: none;">
                  <c:out value="${board.board_title}" />  
                  </a>
              <td><c:out value="${board.mem_id}" /></td>
              <td><fmt:formatDate pattern="yyyy-MM-dd"
                  value="${board.board_date}" /></td>
              <td><fmt:formatDate pattern="yyyy-MM-dd"
                  value="${board.board_updateDate}" /></td>
               <td><c:out value="${board.board_hit}" /></td>
            </tr>
          </c:forEach>
			</tbody>

				</table>

</div>
				<div class='row'>
					<div class="col-lg-12">

						<form id='searchForm' action="/free/list" method='get'>
							<select name='type'>
								<option value=""
									<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
								<option value="TC"
									<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목+내용</option>
								<option value="TW"
									<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목+작성자</option>
								<option value="TWC"
									<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목+내용+작성자</option>
							</select> <input type='text' name='keyword'
								value='<c:out value="${pageMaker.cri.keyword}"/>' /> <input
								type='hidden' name='pageNum'
								value='<c:out value="${pageMaker.cri.pageNum}"/>' /> <input
								type='hidden' name='amount'
								value='<c:out value="${pageMaker.cri.amount}"/>' />
							<button class='btn btn-primary'>검색</button>
						</form>
					</div>
				</div>


				<div class='pull-right'>
					<ul class="pagination">

			<c:if test="${pageMaker.prev}">
    <li class="page-item">
        <a class="page-link" href="?pageNum=${pageMaker.startPage - 1}" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
            <span class="sr-only">Previous</span>
        </a>
    </li>
</c:if>

<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
    <li class="page-item ${pageMaker.cri.pageNum == num ? 'active' : ''}">
        <a class="page-link" href="?pageNum=${num}">${num}</a>
    </li>
</c:forEach>

<c:if test="${pageMaker.next}">
    <li class="page-item">
        <a class="page-link" href="?pageNum=${pageMaker.endPage + 1}" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
            <span class="sr-only">Next</span>
        </a>
    </li>
</c:if>

					</ul>
				</div>
				<!--  end Pagination -->
			</div>

			<form id='actionForm' action="/free/list" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>

				<input type='hidden' name='type'
					value='<c:out value="${ pageMaker.cri.type }"/>'> <input
					type='hidden' name='keyword'
					value='<c:out value="${ pageMaker.cri.keyword }"/>'>


			</form>


			<!-- Modal  추가 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">^0^d</h4>
						</div>
						<div class="modal-body">처리가 완료되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">닫기</button>
						
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->


		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>
</div>
<!-- /.row -->






<script type="text/javascript">
	$(document).ready(function() {

						var result = '<c:out value="${result}"/>';

						checkModal(result);

						history.replaceState({}, null, null);

						function checkModal(result) {

							if (result === '' || history.state) {
								return;
							}

							if (parseInt(result) > 0) {
								$(".modal-body").html(
										"게시글 " + parseInt(result)
												+ " 번이 등록되었습니다.");
							}

							$("#myModal").modal("show");
						}

						$("#regBtn").on("click", function() {

							self.location = "/free/register";

						});

						var actionForm = $("#actionForm");

						$(".paginate_button a").on(
								"click",
								function(e) {

									e.preventDefault();

									console.log('click');

									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									actionForm.submit();
								});
						

						$(".move").on("click", function(e) {
											e.preventDefault();
											actionForm
													.append("<input type='hidden' name='board_no' value='"
															+ $(this).attr(
																	"href")
															+ "'>");
											actionForm.attr("action",
													"/free/get");
											actionForm.submit();

										});

						var searchForm = $("#searchForm");

						$("#searchForm button").on(
								"click",
								function(e) {

									if (!searchForm.find("option:selected")
											.val()) {
										alert("검색종류를 선택하세요");
										return false;
									}

									if (!searchForm.find(
											"input[name='keyword']").val()) {
										alert("키워드를 입력하세요");
										return false;
									}

									searchForm.find("input[name='pageNum']")
											.val("1");
									e.preventDefault();

									searchForm.submit();

								});
						  // 모달 닫기 버튼
				        $(".modal-footer button[data-dismiss='modal']").on("click", function() {
				            $("#myModal").modal("hide");
				        });

						  // 검색
				        $("#searchForm button").on("click", function(e) {
				            if (!searchForm.find("option:selected").val()) {
				                alert("검색종류를 선택하세요");
				                return false;
				            }

				            if (!searchForm.find("input[name='keyword']").val()) {
				                alert("키워드를 입력하세요");
				                return false;
				            }

				            searchForm.find("input[name='pageNum']").val("1");
				            e.preventDefault();

				            searchForm.submit();
				        });

					});
</script>






<%@include file="../includes/footer.jsp"%>
