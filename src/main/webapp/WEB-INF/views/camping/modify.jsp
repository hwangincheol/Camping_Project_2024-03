<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/header.jsp"%>

<style>
    body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
    .container-2 {
        width: 80%;
        margin: 20px auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    th, td {
        padding: 10px;
        border-bottom: 1px solid #ddd;
        text-align: left;
    }
    th {
        background-color: #f2f2f2;
    }
    tr:hover {
        background-color: #f5f5f5;
    }
    /* 모달 스타일 */
    .modal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0,0,0,0.4);
    }
    .modal-content {
        background-color: #fefefe;
        margin: 10% auto;
        padding: 20px;
        border: 1px solid #888;
        width: 80%;
    }
    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }
    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }
    
    /* 수정하기 버튼 스타일 */
    .edit-button {
        float: right; /* 우측으로 이동 */
        font-size: smaller; /* 작은 글꼴 크기 */
        margin-top: 5px; /* 상단 여백 추가 */
    }
</style>

<div style="padding-top: 70px;">
    <div style="background-image: url('/resources/assets/img/main.jpg'); background-size: cover; background-position: center; height: 270px; display: flex; flex-direction: column; justify-content: center; align-items: center; text-align: center; padding-top: 30px;">
        <h1 class="text-white">커뮤니티</h1>
    </div>
</div>
<!-- -->
<section id="about" class="about">

	<div class="container">
	    <div class="section-title">
	        <h2 class="font-h2">문의 게시판</h2>
	        <p></p>
	    </div>
	</div>
	
    <div class="container-2">
		<form role="form" action="/camping/modify" method="post">
		
		<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
		<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
		
		    <div class="form-group">
		        <label>게시물 번호</label>
		        <input class="form-control" name='board_no' value='<c:out value="${camping.board_no}"/>' readonly="readonly">
		    </div>
		    <div class="form-group">
		        <label>제목</label>
		        <input class="form-control" name='board_title' value='<c:out value="${camping.board_title}"/>'>
		    </div>
		    <div class="form-group">
		        <label>내용</label>
		        <textarea class="form-control" rows="3" name='board_content'><c:out value="${camping.board_content}"/></textarea>
		    </div>
		    <div class="form-group">
		        <label>작성일</label>
		        <input class="form-control" name='board_date' value='<fmt:formatDate pattern="yyyy-MM-dd" value="${camping.board_date}"/>' readonly="readonly">
		    </div>
		    <div class="form-group">
		        <label>최종 수정일</label>
		        <input class="form-control" name='board_updateDate' value='<fmt:formatDate pattern="yyyy-MM-dd" value="${camping.board_updateDate}"/>' readonly="readonly">
		    </div>
		    <div class="form-group">
		        <label>작성자</label>
		        <input class="form-control" name='mem_id' value='<c:out value="${camping.mem_id}"/>' readonly="readonly">
		    </div>
		    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		    <button type="submit" data-oper='modify' class="btn btn-default">수정</button>
		</form>
		<form action="/camping/remove" method="get">
			<input type="hidden" name="board_no" value="${camping.board_no}">
			<button type="submit" data-oper='delete' class="btn btn-danger">삭제</button>
		</form>
	</div>
</section>
	
	<script type="text/javascript">
	$(document).ready(function() {
		
		var formObj = $("form");
		
		$('button').on("click", function(e) {
			
			e.preventDefalt();
			
			var operation = $(this).data("oper");
			
			console.log(operation);
			
			if(operation === 'remove') {
				formObj.attr("action","/camping/remove");
			}else if(operation === 'list') {
				
				formObj.attr("action", "/camping/list").attr("method", "get");
				var pageNumTag = $("input[name='pageNum']").clone();
				var pageNumTag = $("input[name='pageNum']").clone();
				
				formObj.empty();
				formObj.append(pageNumTag);
				formObj.append(amountTag);
			}
			formObj.submit();
		});
	});
	</script>
	
<script>
    // 수정 버튼 클릭 시 모달 표시 및 폼 채우기
    const editButton = document.getElementById("editButton");
    const editForm = document.getElementById("editForm");
    const editBoardNo = document.getElementById("editBoardNo");

    editButton.addEventListener("click", function() {
        // 모달 표시
        const modal = document.getElementById("myModal");
        modal.style.display = "block";

        // 폼 채우기
        const modalTitle = document.getElementById("modal-title");
        const modalContent = document.getElementById("modal-content");
        const modalDate = document.getElementById("modal-date");
        const modalHit = document.getElementById("modal-hit");
        const modalMemId = document.getElementById("modal-mem-id");

        // 여기서 선택한 게시물의 정보를 가져와서 모달에 채웁니다.
        const selectedBoardNo = this.getAttribute("data-board-no"); // 선택한 게시물 번호
        const selectedBoardTitle = ""; // 선택한 게시물 제목
        const selectedBoardContent = ""; // 선택한 게시물 내용
        const selectedBoardDate = ""; // 선택한 게시물 작성일
        const selectedBoardHit = ""; // 선택한 게시물 조회수
        const selectedBoardMemId = ""; // 선택한 게시물 작성자

        modalTitle.textContent = selectedBoardTitle;
        modalContent.textContent = selectedBoardContent;
        modalDate.textContent = selectedBoardDate;
        modalHit.textContent = selectedBoardHit;
        modalMemId.textContent = selectedBoardMemId;

        // 수정할 게시물 번호를 폼에 설정
        editBoardNo.value = selectedBoardNo;
    });
    
</script>

<%@ include file="../includes/footer.jsp" %>

