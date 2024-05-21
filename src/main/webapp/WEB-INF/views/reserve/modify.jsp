<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


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
        text-align: center;
    }

    th {
        padding: 8px;
        width: 50%;
        border-right: 2px solid #25a4ff;
    }

    a {
        color: inherit; /* 링크의 색을 부모 요소의 색으로 상속 */
        text-decoration: none; /* 링크의 밑줄 제거 */
    }

    a:hover {
        color: inherit; /* hover 시 색상을 부모 요소의 색으로 상속하여 색상이 변하지 않도록 함 */
    }


</style>
<!-- <img src="/resources/assets/img/main.jpg" class="img-fluid" alt="..."> -->
<div style="padding-top: 70px;">
    <div style="background-image: url('/resources/assets/img/main.jpg'); background-size: cover; background-position: center; height: 270px; display: flex; flex-direction: column; justify-content: center; align-items: center; text-align: center; padding-top: 30px;">
        <h1 class="text-white" style="font-family: 'Nanum Gothic'; font-weight: bold;">예약 수정</h1>
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
        <form action="/reserve/modify" method="post"> <!-- 버튼을 눌렀을 시 이동할 페이지, 메소드 -->
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> <!-- 보안 토크 -->
            <table>
                <tr>
                    <th>
                        <strong>예약 번호</strong>
                    </th>
                    <td>
                        <!-- 예약 번호를 수정할 수 없도록 읽기 전용으로 표시 -->
                        <input type="text" name="reserve_no" value="<c:out value='${reserve.reserve_no}'/>" readonly/>
                    </td>
                </tr>
                <tr>
                    <th>
                        <strong>사이트</strong>
                    </th>
                    <td>
                        <!-- 사이트 번호를 수정할 수 없도록 읽기 전용으로 표시 -->
                        <input type="text" value="<c:out value='${reserve.camp_no}'/>" readonly>
                    </td>
                </tr>
                <tr>
                    <th>
                        <strong>예약날짜</strong>
                    </th>
                    <td>
                        <!-- 입실일, 퇴실일을 시간을 제외한 날짜형식으로 저장 -->
                        <c:set var="startDate" value="${fn:substring(reserve.reserve_startDate, 0, 11)}"/>
                        <c:set var="endDate" value="${fn:substring(reserve.reserve_endDate, 0, 11)}"/>
                        <!-- 저장한 날짜 형식의 입실일, 퇴실일을 읽기 전용으로 표시 -->
                        <input type="text" value="<c:out value='${startDate}'/>" readonly> ~
                        <input type="text" value="<c:out value='${endDate}'/>" readonly><br/>
                        <span>예약 날짜를 변경하시려면 예약 취소 후 다시 예약해주세요.</span> <!-- 안내문 -->
                    </td>
                </tr>
                <tr>
                    <th>
                        <STRONG>인원</STRONG>
                    </th>
                    <td>
                        <!-- 입실 인원 만을 수정 가능 -->
                        <p><input type="number" name="reserve_people" min="1"
                                  max="4" value="<c:out value='${reserve.reserve_people}'/>"> 명</p>
                    </td>
                </tr>
                <tr>
                    <th>
                        <strong>가격</strong>
                    </th>
                    <td>
                        <!-- 예약시 설정된 가격을 변경할 수 없도록 읽기 전용으로 표시 -->
                        <p>₩ <input type="text" value="<c:out value='${reserve.reserve_price}'/>" readonly></p>
                    </td>
                </tr>
            </table>
            <br/>
            <br/>
            <br/>
            <div align="center">
                <!-- 목록 페이지로 이동 버튼 -->
                <a href="/reserve/getMem?mem_id=<c:out value='${reserve.mem_id}'/>"><button>목록</button></a>
                <button type="submit" onclick="showAlert()">수정 완료</button>
                <button type="reset">초기화</button>
            </div>
        </form>
    </section>
    <br/>
    <br/>
    <hr/>
    <br/>
    <br/>

</div>

<script>
    // alert 띄우기
    function showAlert() {
        // alert 창 띄우기
        alert("수정이 완료되었습니다.");
        document.querySelector("form").submit(); // 폼 제출
    }
</script>


<%@include file="../includes/footer.jsp" %>
