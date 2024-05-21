<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@include file="../includes/header.jsp" %>
<style>
    table {
        border-collapse: collapse;
        margin: 0 auto; /* 테이블을 수평 가운데 정렬합니다. */
        width: 1240px;
        height: 510px;
    }

    tr {
        text-align: center;
    }

    tr:first-child td:last-child {
        border-right-width: 3px; /* 첫 번째 행의 마지막 열의 오른쪽 선의 굵기를 3px로 변경 */
    }

    td {
        border: 1px solid #dddddd;
        padding: 8px;
    }

    a {
        color: inherit; /* 링크의 색을 부모 요소의 색으로 상속 */
        text-decoration: none; /* 링크의 밑줄 제거 */
    }

    a:hover {
        color: inherit; /* hover 시 색상을 부모 요소의 색으로 상속하여 색상이 변하지 않도록 함 */
    }
</style>
<div style="padding-top: 70px;">
    <div style="background-image: url('/resources/assets/img/main.jpg'); background-size: cover; background-position: center; height: 270px; display: flex; flex-direction: column; justify-content: center; align-items: center; text-align: center; padding-top: 30px;">
        <h2 class="text-white">예약 현황</h2>
    </div>
</div>

<div id="slideshow-container-1">
    <section class="about">
        <div class="container">
            <div class="section-title">
                <h2 class="font-h2">예약 정보</h2>
            </div>
        </div>
    </section>
    <hr/>
    <section>
        <table style="border-collapse: collapse; border: 1px solid royalblue;">
            <thead style="background-color: #00b3ff">
            <%-- 표의 헤드 부분 --%>
            <tr>
                <th>예약 번호</th>
                <th>사이트</th>
                <th>가격</th>
                <th>예약일</th>
                <th>비고</th>
            </tr>
            </thead>
            <%-- 표의 바디 부분 --%>
            <c:forEach items="${reserve}" var="reserve"> <%-- reserve 객체 모두 출력 --%>
                <tr>
                    <td><c:out value="${reserve.reserve_no}"/></td> <!-- 예약 번호 출력 -->
                    <td><c:out value="${reserve.camp_no}"/></td> <!-- 에약한 캠핑장 사이트 번호 -->
                    <td><c:out value="${reserve.reserve_price}"/></td> <!-- 예약한 일수에 따른 가격 -->
                    <td style="width: 30%">
                        <c:set var="startDate" value="${fn:substring(reserve.reserve_startDate, 0, 11)}"/> <!-- 시간은 제외한 날짜로 변환 -->
                        <c:set var="endDate" value="${fn:substring(reserve.reserve_endDate, 0, 11)}"/> <!-- 시간을 제외한 날짜로 변환 -->
                        <c:out value="${startDate}"/> ~ <c:out value="${endDate}"/> <!-- 입실일, 퇴실일 출력 -->
                    </td>
                    <td>
                        <!-- 클릭하면 예약 1건의 대한 상세보기로 이동 -->
                        <a href="/reserve/getRes?reserve_no=${reserve.reserve_no}"><button type="button">상세보기</button></a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </section>
</div>



<%@include file="../includes/footer.jsp" %>