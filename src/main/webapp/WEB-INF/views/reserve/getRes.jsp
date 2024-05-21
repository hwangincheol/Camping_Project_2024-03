<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@include file="../includes/header.jsp" %>
<style>
    table {
        border-collapse: collapse;
        margin: 0 auto; /* 테이블을 수평 가운데 정렬합니다. */
        width: 1240px;
        height: 510px;
        border: 1px solid #25a4ff;
    }

    tr {
        text-align: center;
    }

    td {
        border: 0px solid #dddddd;
        padding: 8px;
    }

    th {
        padding: 8px;
        width: 50%;
        border-right: 2px solid #25a4ff;
        text-align: center;
    }

    a {
        color: inherit; /* 링크의 색을 부모 요소의 색으로 상속 */
        text-decoration: none; /* 링크의 밑줄 제거 */
    }

    a:hover {
        color: inherit; /* hover 시 색상을 부모 요소의 색으로 상속하여 색상이 변하지 않도록 함 */
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

</style>
<!-- <img src="/resources/assets/img/main.jpg" class="img-fluid" alt="..."> -->
<div style="padding-top: 70px;">
    <div style="background-image: url('/resources/assets/img/main.jpg'); background-size: cover; background-position: center; height: 270px; display: flex; flex-direction: column; justify-content: center; align-items: center; text-align: center; padding-top: 30px;">
        <h1 class="text-white" style="font-family: 'Nanum Gothic'; font-weight: bold;">예약 확인</h1>
    </div>
</div>

<div id="slideshow-container-1">
    <section class="about">
        <div class="container">
            <div class="section-title">
                <h2>예약 상세 보기</h2>
            </div>
        </div>
    </section>
    <hr/>
    <section>
        <form action="/reserve/remove" method="get"> <!-- 버튼을 클릭하면 이동할 주소, 메소드 -->
            <table>
                <tr>
                    <th>
                        <strong>예약 번호</strong>
                    </th>
                    <td>
                        <c:out value="${reserve.reserve_no}"/> <!-- 선택한 예약의 대한 예약번호 -->
                    </td>
                </tr>
                <tr>
                    <th>
                        <strong>사이트</strong>
                    </th>
                    <td>
                        <c:out value="${reserve.camp_no}"/> <!-- 선택한 예약시 선택한 사이트 번호 -->
                    </td>
                </tr>
                <tr>
                    <th>
                        <strong>예약날짜</strong>
                    </th>
                    <td>
                        <c:set var="startDate" value="${fn:substring(reserve.reserve_startDate, 0, 11)}"/> <!-- 날짜를 시간을 제외해 저장 -->
                        <c:set var="endDate" value="${fn:substring(reserve.reserve_endDate, 0, 11)}"/> <!-- 날짜를 시간을 제외해 저장 -->
                        <p><c:out value="${startDate}"/> ~ <c:out value="${endDate}"/></p>  <!-- 입실일 ~ 퇴실일 출력 -->
                    </td>
                </tr>
                <tr>
                    <th>
                        <STRONG>인원</STRONG>
                    </th>
                    <td>
                        <p><c:out value="${reserve.reserve_people}"/> 명</p> <!-- 선택한 예약의 입실 인원 -->
                    </td>
                </tr>
                <tr>
                    <th>
                        <strong>가격</strong>
                    </th>
                    <td>
                        <p>₩ <c:out value="${reserve.reserve_price}"/></p> <!-- 선택한 예약의 일수에 따른 가격 -->
                    </td>
                </tr>
            </table>
            <br/>
            <br/>
            <br/>
            <input type="hidden" id="inputValue_reserve_no" name="reserve_no" value="${reserve.reserve_no}">
            <input type="hidden" id="inputValue_mem_id" name="mem_id" value="<c:out value='${reserve.mem_id}'/>">
            <!-- 리다이렉션 오류로 임시 처리 -->

            <div align="center">
            <a href="/reserve/getMem"><button type="button">목록</button></a>
            <a href="/reserve/modify?reserve_no=${reserve.reserve_no}"><button type="button">수정</button></a>
            <%-- 버튼을 클릭하면 메소드를 실행해 경고창을 띄우고 확인버튼을 눌렀을시에만 삭제 진행--%>
            <button type="button" onclick="showAlertAndRedirect()">예약 취소</button>
            <a href="#" class="review"><button type="button">후기 작성</button></a> <!-- 버튼을 누르면 후기를 작성하는 모달을 띄움 -->
            </div>
        </form>
    </section>
    <br/>
    <br/>
    <hr/>
    <br/>
    <br/>

<%-- 장비 렌탈 내역--%>
<%--    <section>--%>
<%--        <div align="center">--%>
<%--            <h2>장비 렌탈 내역</h2>--%>
<%--        </div>--%>
<%--        <div>--%>
<%--            &lt;%&ndash; if를 사용해 장비에 렌탈 내역이 있으면 내역을 보여주고, 없으면 장비 렌텔 내역이 없습니다. 보여주기&ndash;%&gt;--%>
<%--        </div>--%>
<%--    </section>--%>

</div>

<%-- 예약한 사이트의 후기글 작성 --%>

<div class="modal-box" id="modal-box2">
    <div class="modal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">후기 게시판 글 작성 하기</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form id="regForm" action="/review/register" method="post">
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
                            <input type="text" class="form-control" id="mem_id" name="mem_id" value="${reserve.mem_id}" required readonly>
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


	$(document).ready(function() {
		
		$(".review").on("click", function(event) {
			event.preventDefault(); // 링크의 기본 동작 방지
			
			$("#modal-box2").show(); // 모달 표시
			
		});
	});



	    function showAlertAndRedirect() {
	        // confirm 창 띄우기
	        var confirmation = confirm("정말 예약을 취소하시겠습니까?");
	        var reserve_no = document.getElementById("inputValue_reserve_no").value; // 입력된 값 가져오기
	        var mem_id = document.getElementById("inputValue_mem_id").value; // 입력된 값 가져오기
	
	        // 확인 버튼을 클릭한 경우에만 페이지 이동
	        if (confirmation) {
	            // 다른 페이지로 이동하기
	            window.location.href = "/reserve/remove?reserve_no=" + reserve_no + "&mem_id=" + mem_id;
	        }
	    }

</script>

<%@include file="../includes/footer.jsp" %>
