<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@include file="../includes/header.jsp"%>

<style>
	.div-2{
	    background:#eee;    
	}
	.main-box.no-header {
	    padding-top: 20px;
	}
	.main-box {
	    background: #FFFFFF;
	    -webkit-box-shadow: 1px 1px 2px 0 #CCCCCC;
	    -moz-box-shadow: 1px 1px 2px 0 #CCCCCC;
	    -o-box-shadow: 1px 1px 2px 0 #CCCCCC;
	    -ms-box-shadow: 1px 1px 2px 0 #CCCCCC;
	    box-shadow: 1px 1px 2px 0 #CCCCCC;
	    margin-bottom: 16px;
	    -webikt-border-radius: 3px;
	    -moz-border-radius: 3px;
	    border-radius: 3px;
	}
	.table a.table-link.danger {
	    color: #e74c3c;
	}
	.label {
	    border-radius: 3px;
	    font-size: 0.875em;
	    font-weight: 600;
	}
	.user-list tbody td .user-subhead {
	    font-size: 0.875em;
	    font-style: italic;
	}
	.user-list tbody td .user-link {
	    display: block;
	    font-size: 1.25em;
	    padding-top: 3px;
	    margin-left: 60px;
	}
	a {
	    color: #3498db;
	    outline: none!important;
	}
	.user-list tbody td>img {
	    position: relative;
	    max-width: 50px;
	    float: left;
	    margin-right: 15px;
	}
	
	.table thead tr th {
	    text-transform: uppercase;
	    font-size: 0.875em;
	}
	
	.table thead tr th {
	    border-bottom: 2px solid #e7ebee;
	}
	.table tbody tr td:first-child {
	    font-size: 1.125em;
	    font-weight: 300;
	}
	.table tbody tr td {
	    font-size: 0.875em;
	    vertical-align: middle;
	    border-top: 1px solid #e7ebee;
	    padding: 12px 8px;
	}
	
	a:hover{
	text-decoration:none;
	}
	
	.modal {
    	display :flex; 
		justify-content:center;
		align-items :center;
	}
	
	.modal-box {
	    position: fixed;
	    top: 0;
	    left: 0;
	    bottom: 0;
	    right: 0;
	    background: rgba(0, 0, 0, 0.7);
	    justify-content: center;
	    align-items: center;
	    display: none;
	    z-index: 9999; /* 다른 요소 위에 표시되도록 z-index 추가 */
	}
	
	.modal-dialog {
		margin: auto;
	}
	
	.modal-content {
    margin: auto;
    width: 800px;
    height: auto;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}
	
</style>

<div style="padding-top: 70px;">
    <div style="background-image: url('/resources/assets/img/main.jpg'); background-size: cover; background-position: center; height: 270px; display: flex; flex-direction: column; justify-content: center; align-items: center; text-align: center; padding-top: 30px;">
        <h1 class="text-white">커뮤니티</h1>
    </div>
</div>

<!-- ======= 구현부 ======= -->
<section id="about" class="about">
	<div class="container">
		<div class="section-title">
			<h2 class="font-h2">후기 게시판</h2>
			<p>별빛 누리 캠핑장의 후기 게시판에 오신 여러분을 환영합니다! 여러분의 캠핑 여행 이야기와 솔직한 후기를 기대합니다. 함께 캠핑의 매력을 느껴보세요!</p>
		</div>
	</div>
	<!-- <button id='regBtn' type="button" class="btn btn-xs pull-right">등록</button> -->
	<!-- 게시판부분 -->
	<div class="div-2">
		<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
			<br>
		<div class="container bootstrap snippets bootdey">
			<div class="row">
				<div class="col-lg-12">
					<div class="main-box no-header clearfix">
						<div class="main-box-body clearfix">
							<div class="table-responsive">
								<table class="table user-list" style="text-align: center;">
									<thead>
										<tr>
											<th style="width: 10%;"><span>번호</span></th>
											<th style="width: 40%; padding-left: 20%; text-align: left;"><span>제목</span></th>
											<th style="width: 15%;"><span>평점</span></th>
											<th style="width: 15%;"><span>등록일</span></th>
											<th style="width: 10%;"><span>작성자</span></th>
											<th style="width: 10%;">&nbsp;</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${list}" var="board">
											<tr>
												<td><c:out value="${board.board_no}" /></td>
												<td style="text-align: left;">
													<c:set var="randomNumber" value="<%= (int)(Math.random() * 3) + 1 %>" />
													<img src="https://bootdey.com/img/Content/user_${randomNumber}.jpg" alt="">
													<a href='<c:out value="${board.board_no}"/>' class="user-link"><c:out value="${board.board_title}" /> </a> <span class="user-subhead">A1(구역)</span></td>
												<td class="text-center"><span class="label label-default"><c:forEach begin="1" end="${board.board_hit}"> <c:out value="⭐" /> </c:forEach></span></td>
												<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.board_updateDate}" /></td>
												<td><c:out value="${board.mem_id}" /></td>
												<c:if test="${board.mem_id == sessionScope['SPRING_SECURITY_CONTEXT'].authentication.principal.username}">
													<td>
														<a href='<c:out value="${board.board_no}"/>' class="table-link text-info"> 
															<span class="fa-stack">
																<i class="fa fa-square fa-stack-2x"></i>
																<i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
															</span>
														</a> 
														<a href='<c:out value="${board.board_no}"/>' class="table-link danger"> 
															<span class="fa-stack"> 
																<i class="fa fa-square fa-stack-2x"></i> 
																<i class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
															</span>
														</a>
													</td>
												</c:if>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class='row' style="text-align: center;">
							<form id='searchForm' action="/review/list" method='get'>
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
										<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목
										or 내용</option>
									<option value="TW"
										<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목
										or 작성자</option>
									<option value="TWC"
										<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목
										or 내용 or 작성자</option>
								</select> 
								<input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>' /> 
								<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
								<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
								<button class='btn btn-primary'>Search</button>
							</form>
						</div>
						<!-- 페이징 -->
						<div class='pull-right' style="margin-right: 20px;">
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
						
						<form id='actionForm' action="/review/list" method='get'>
							<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
							<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
			
							<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'> 
							<input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	

</section>

<!-- 모달 -->
<div class="modal-box" id="modal-box1">
	<div class="modal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">후기 게시판 상세 보기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<!-- 게시글 내용 <div class="modal-body"> -->
				
				<div class="modal-body">
				    <div class="card">
				        <div class="card-body">
				            <h5 class="card-title" id="card-title"></h5>
				            <p class="card-text" id="card-hit"></p>
				        </div>
				    </div>
				    
				    <div class="card mt-3">
				        <div class="card-body">
				            <p class="card-text" id="card-content"></p>
				        </div>
				    </div>
				    <!-- 작성자 정보 -->
				    <div class="card mt-3">
				        <div class="card-body" style="display: flex; justify-content: space-between;">
						    <div>
						        <p class="card-subtitle mb-2 text-muted" id="card-id"></p>
						    </div>
						    <div>
						        <p class="card-subtitle mb-2 text-muted" id="card-date"></p>
						    </div>
						</div>
				    </div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal-box" id="modal-box2">
    <div class="modal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">후기 게시판 글 수정 하기</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form id="modifyForm" action="/review/modify" method="post">
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="board_title" class="form-label">제목</label>
                            <input type="text" class="form-control" id="board_title" name="board_title" required>
                        </div>
                        <div class="mb-3">
                            <label for="board_content" class="form-label">내용</label>
                            <textarea class="form-control" id="board_content" name="board_content" rows="3" required></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="mem_id" class="form-label">작성자</label>
                            <input type="text" class="form-control" id="mem_id" name="mem_id" required readonly>
                        </div>
                        <div class="mb-3">
						    <label for="board_hit" class="form-label">평점</label>
						    <select class="form-select" id="board_hit" name="board_hit" required>
						        <option value="1">⭐</option>
						        <option value="2">⭐⭐</option>
						        <option value="3">⭐⭐⭐</option>
						        <option value="4">⭐⭐⭐⭐</option>
						        <option value="5">⭐⭐⭐⭐⭐</option>
						    </select>
						</div>
                    </div>
                    <input type='hidden' id="board_no" name='board_no'>
                    <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
					<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
					<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'> 
					<input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">등록</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>

	var selectedBoardNo;

	$(document).ready(function() {
		
		$(".table-link.text-info").on("click", function(event) {
			event.preventDefault(); // 링크의 기본 동작 방지
			
			selectedBoardNo = $(this).attr("href");
			
			$.ajax({
	            url: '/review/get', // 데이터를 가져올 서버의 엔드포인트
	            type: 'GET', // HTTP 요청 방식
	            data: { boardNo: selectedBoardNo },
	            success: function(data) {
	                // 서버에서 데이터를 성공적으로 받아왔을 때 실행되는 콜백 함수
	                var board = data;
	                
	             	// 날짜 형식 변환
	                var formattedDate = new Date(board.board_updateDate);
	                var year = formattedDate.getFullYear();
	                var month = String(formattedDate.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작하므로 1을 더하고, 문자열로 변환 후 두 자리로 맞춤
	                var day = String(formattedDate.getDate()).padStart(2, '0'); // 일자는 두 자리로 맞춤
	                var formattedDateString = year + '-' + month + '-' + day;

	                /* switch (board.board_hit) {
					case 1: document.getElementById('card-hit').textContent = '⭐'; 
						break;
					case 2: document.getElementById('card-hit').textContent = '⭐⭐'; 
						break;
					case 3: document.getElementById('card-hit').textContent = '⭐⭐⭐'; 
						break;
					case 4: document.getElementById('card-hit').textContent = '⭐⭐⭐⭐'; 
						break;
					default: document.getElementById('card-hit').textContent = '⭐⭐⭐⭐⭐'; 
					} */
					$("#modifyForm input[name='board_no']").val(board.board_no);
	                $("#modifyForm input[name='board_title']").val(board.board_title);
	                $("#modifyForm textarea[name='board_content']").val(board.board_content);
	                $("#modifyForm input[name='mem_id']").val(board.mem_id);
	                
	            	// 별점 선택 옵션을 가져와서 순회하면서 선택 옵션을 설정
	                $("#board_hit option").each(function() {
	                    if ($(this).val() === board.board_hit.toString()) {
	                        $(this).prop("selected", true); // 일치하는 옵션에 selected 속성 추가
	                    }
	                });
	                
	            },
	            error: function(xhr, status, error) {
	                console.error(error); // 에러 메시지를 콘솔에 출력하여 확인
	            }
	        });
			
			
			$("#modal-box2").show(); // 모달 표시
			
		});
		
		
		$(".table-link.danger").on("click", function(event) {
		    event.preventDefault(); // 링크의 기본 동작 방지
		    
		    selectedBoardNo = $(this).attr("href");
		    
		    // 확인 다이얼로그 표시
		    var result = confirm("정말 삭제하시겠습니까?");
		    
		    // 확인이면 삭제 요청으로 이동
		    if (result) {
		        // 폼 생성
		        var form = $("<form>", {
		            action: "/review/remove",
		            method: "POST"
		        });

		        // 게시물 번호를 폼에 추가
		        var boardNo = $("<input>", {
		            type: "hidden",
		            name: "board_no",
		            value: selectedBoardNo // 게시물 번호를 가져옴
		        });

		        // CSRF 토큰을 폼에 추가
		        var csrfToken = $("<input>", {
		            type: "hidden",
		            name: "${_csrf.parameterName}",
		            value: "${_csrf.token}" // CSRF 토큰 값을 넣어줌
		        });

		        // 폼에 요소 추가
		        form.append(boardNo);
		        form.append(csrfToken);

		        // 폼을 body에 추가하고 자동으로 제출
		        $("body").append(form);
		        form.submit();
		    }
		});
		
		
	});

	$(document).ready(function() {
		
			//게시글 눌렀을때 받아오는 게시판 번호 값
		
		/* $("#regBtn").on("click", function() {

			self.location = "/review/register";

		}); */

		
		// showmodal id를 가진 요소를 클릭했을 때 모달을 표시하는 함수
		$(".user-link").on("click", function(event) {
			event.preventDefault(); // 링크의 기본 동작 방지
			
			// 클릭한 보드의 번호를 가져와서 변수에 저장
	        selectedBoardNo = $(this).attr("href");
			
	     	// AJAX 요청 보내기
	        $.ajax({
	            url: '/review/get', // 데이터를 가져올 서버의 엔드포인트
	            type: 'GET', // HTTP 요청 방식
	            data: { boardNo: selectedBoardNo },
	            success: function(data) {
	                // 서버에서 데이터를 성공적으로 받아왔을 때 실행되는 콜백 함수
	                var board = data;
	                
	             	// 날짜 형식 변환
	                var formattedDate = new Date(board.board_updateDate);
	                var year = formattedDate.getFullYear();
	                var month = String(formattedDate.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작하므로 1을 더하고, 문자열로 변환 후 두 자리로 맞춤
	                var day = String(formattedDate.getDate()).padStart(2, '0'); // 일자는 두 자리로 맞춤
	                var formattedDateString = year + '-' + month + '-' + day;

	                document.getElementById('card-title').textContent = board.board_title;
	                
	                switch (board.board_hit) {
					case 1: document.getElementById('card-hit').textContent = '⭐'; 
						break;
					case 2: document.getElementById('card-hit').textContent = '⭐⭐'; 
						break;
					case 3: document.getElementById('card-hit').textContent = '⭐⭐⭐'; 
						break;
					case 4: document.getElementById('card-hit').textContent = '⭐⭐⭐⭐'; 
						break;
					case 5: document.getElementById('card-hit').textContent = '⭐⭐⭐⭐⭐'; 
						break;
					}
	                
	                document.getElementById('card-content').textContent = board.board_content;
	                document.getElementById('card-id').textContent = '작성자 : ' + board.mem_id;
	                document.getElementById('card-date').textContent = '등록일 : ' + formattedDateString;
	                
	            },
	            error: function(xhr, status, error) {
	                console.error(error); // 에러 메시지를 콘솔에 출력하여 확인
	            }
	        });
			
			
			$("#modal-box1").show(); // 모달 표시
		});

		$(".btn-close").on("click", function() {
			$(".modal-box").hide(); // 모달 닫기
		});

		// 모달 배경 클릭 시 모달 닫기
		$(".modal-box").on("click", function(event) {
			$(".modal-box").hide(); // 모달 닫기
		});

		//모달 내부 전파방지
		$(".modal-content").on("click", function(event) {
			event.stopPropagation(); // 이벤트 전파 막기
		});

		
		
		//
		/* 등록버튼 */
		$("#regBtn").on("click", function() {

			self.location = "/review/register";

		});

		var actionForm = $("#actionForm");

		/* 페이징버튼 */
		$(".paginate_button a").on("click", function(e) {

			e.preventDefault();

			console.log('click');

			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		

		/* $(".move").on("click", function(e) {
			e.preventDefault();
			actionForm
					.append("<input type='hidden' name='board_no' value='"
							+ $(this).attr(
									"href")
							+ "'>");
			actionForm.attr("action",
					"/review/get");
			actionForm.submit();
		
		}); */

		var searchForm = $("#searchForm");

		$("#searchForm button").on("click", function(e) {

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
		
		$(".table-link text-info").on("click", function(e) {
			e.preventDefault();
		});
		
		
		
		
		
	});
	
</script>

<%@include file="../includes/footer.jsp"%> 
