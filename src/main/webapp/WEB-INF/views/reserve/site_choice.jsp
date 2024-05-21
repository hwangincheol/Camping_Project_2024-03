<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../includes/header.jsp" %>
<style>
    /* 버튼 스타일 */
    .button-large {
        padding: 10px 20px;
        font-size: 16px;
    }

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

    .slideshow-container {
        width: 620px;
        height: 510px;
        position: relative;
        margin: auto;
    }

    .mySlide1, .mySlide2, .mySlide3 {
        display: none;
    }

    .prev, .next {
        cursor: pointer;
        position: absolute;
        top: 50%;
        width: auto;
        padding: 16px;
        margin-top: -22px;
        color: white;
        font-weight: bold;
        font-size: 18px;
        transition: 0.6s ease;
        border-radius: 0 3px 3px 0;
        user-select: none;
    }

    .next {
        right: 0;
        border-radius: 3px 0 0 3px;
    }

    .prev {
        left: 0;
        border-radius: 3px 0 0 3px;
    }

    .prev:hover, .next:hover {
        background-color: rgba(0, 0, 0, 0.8);
    }

</style>

<div style="padding-top: 70px;">
    <div style="background-image: url('/resources/assets/img/main.jpg'); background-size: cover; background-position: center; height: 270px; display: flex; flex-direction: column; justify-content: center; align-items: center; text-align: center; padding-top: 30px;">
        <h2 class="text-white">예약 하기</h2>
    </div>
</div>

<!-- 캠핑 섹션 전환 버튼 추가 -->
<section>
    <div align="center">
        <h2 class="font-h2">캠핑 섹션 선택</h2>
        <div align="center">
            <button onclick="changePage('page1')">캠핑동</button>
            <button onclick="changePage('page2')">글램핑동</button>
            <button onclick="changePage('page3')">카라반동</button>
            <button onclick="changePage('pageAll')">전체 보기</button>
        </div>
        <br/><hr/>
    </div>
</section>


<%-- 캠핑동 -------------------------------------------------------------------------------------------------------------- --%>
<div id="slideshow-container-1">
    <section class="about">
        <div class="container">
            <div class="section-title">
                <h2 class="font-h2">캠핑동</h2>
            </div>
        </div>
    </section>
    <hr/>
    <section>
        <table>
            <tr>

                <%-- 이미지 슬라이드 --%>
                <td rowspan="5">
                    <div class="slideshow-container">
                        <div class="mySlide1">
                            <img src="/resources/assets/img/캠피잉.jpeg" style="width: 620px; height: 510px;">
                        </div>

                        <div class="mySlide1">
                            <img src="/resources/assets/img/캠피잉2.jpeg" style="width: 620px; height: 510px;">
                        </div>

                        <div class="mySlide1">
                            <img src="/resources/assets/img/캠핑장.png" style="width: 620px; height: 510px;">
                        </div>

                        <%-- 이미지 슬라이드 전환 버튼--%>
                        <a class="prev" onclick="plusSlide1(-1)">❮</a>
                        <a class="next" onclick="plusSlide1(1)">❯</a>
                    </div>
                </td>
            </tr>

            <%-- 텐트 정보 확인란 --%>
            <tr style="width: 600px; background-color: palegreen">
                <th colspan="3">텐트 A동</th>
            </tr>
            <tr style="width: 600px">
                <th style="width: 200px">바닥재</th>
                <td colspan="2">전체 파쇄석</td>
            </tr>
            <tr style="background-color: palegreen">
                <th style="width: 200px">소개</th>
                <td colspan="2">다른 동과 강을 기준으로 나뉘어 프라이빗한 캠핑을 할 수 있는 사이트</td>
            </tr>

            <%-- 예약 페이지로 넘어가는 버튼 --%>
            <tr style="width: 600px">
                <td style="width: 200px">
                    <form action="/reserve/enter_info" method="get">
                        <input type="hidden" name="site" value="A1">
                        <button type="submit" class="button-large">A-1 예약</button>
                    </form>
                </td>
                <td style="width: 200px">
                    <form action="/reserve/enter_info" method="get">
                        <input type="hidden" name="site" value="A2">
                        <button class="button-large">A-2 예약</button>
                    </form>
                </td>
                <td style="width: 200px">
                    <form action="/reserve/enter_info" method="get">
                        <input type="hidden" name="site" value="A3">
                        <button class="button-large">A-3 예약</button>
                    </form>
                </td>
            </tr>
        </table>
    </section>
    <hr/>
    <section>
        <table>
            <tr>

                <%-- 이미지 슬라이드 --%>
                <td rowspan="5">
                    <div class="slideshow-container">

                        <div class="mySlide2">
                            <img src="/resources/assets/img/B동.jpeg" style="width: 620px; height: 510px;">
                        </div>

                        <div class="mySlide2">
                            <img src="/resources/assets/img/B동1.jpeg" style="width: 620px; height: 510px;">
                        </div>

                        <div class="mySlide2">
                            <img src="/resources/assets/img/B동2.jpeg" style="width: 620px; height: 510px;">
                        </div>

                        <%-- 이미지 슬라이드 전환 버튼 --%>
                        <a class="prev" onclick="plusSlide2(-1)">❮</a>
                        <a class="next" onclick="plusSlide2(1)">❯</a>
                    </div>
                </td>
            </tr>

            <%-- 사이트 정보 확인란 --%>
            <tr style="width: 600px; background-color: palegreen">
                <th colspan="4">텐트 B동</th>
            </tr>
            <tr style="width: 600px">
                <th style="width: 200px">바닥재</th>
                <td colspan="3">전체 나무 데크</td>
            </tr>
            <tr style="background-color: palegreen">
                <th style="width: 200px">소개</th>
                <td colspan="3">다른 동과 강을 기준으로 나뉘어 프라이빗한 캠핑을 할 수 있는 사이트</td>
            </tr>

             <%-- 예약 페이지 버튼 --%>
            <tr style="width: 600px">
                <td style="width: 150px">
                    <form action="/reserve/enter_info" method="get">
                        <input type="hidden" name="site" value="B1">
                        <button type="submit" class="button-large">B-1 예약</button>
                    </form>
                </td>
                <td style="width: 150px">
                    <form action="/reserve/enter_info" method="get">
                        <input type="hidden" name="site" value="B2">
                        <button type="submit" class="button-large">B-2 예약</button>
                    </form>
                </td>
                <td style="width: 150px">
                    <form action="/reserve/enter_info" method="get">
                        <input type="hidden" name="site" value="B3">
                        <button type="submit" class="button-large">B-3 예약</button>
                    </form>
                </td>
                <td style="width: 150px">
                    <form action="/reserve/enter_info" method="get">
                        <input type="hidden" name="site" value="B4">
                        <button type="submit" class="button-large">B-4 예약</button>
                    </form>
                </td>
            </tr>
        </table>
    </section>
    <hr/>
    <section>
        <table>
            <tr>

                <%-- 이미지 슬라이드 --%>
                <td rowspan="5">
                    <div class="slideshow-container">

                        <div class="mySlide3">
                            <img src="/resources/assets/img/C동.jpg" style="width: 620px; height: 510px;">
                        </div>

                        <div class="mySlide3">
                            <img src="/resources/assets/img/C동1.jpg" style="width: 620px; height: 510px;">
                        </div>

                        <div class="mySlide3">
                            <img src="/resources/assets/img/C동2.jpeg" style="width: 620px; height: 510px;">
                        </div>

                        <%-- 이미지 슬라이드 전환 버튼 --%>
                        <a class="prev" onclick="plusSlide3(-1)">❮</a>
                        <a class="next" onclick="plusSlide3(1)">❯</a>
                    </div>
                </td>
            </tr>

            <%-- 사이트 정보 확인란 --%>
            <tr style="width: 600px; background-color: palegreen">
                <th colspan="5">텐트 C동</th>
            </tr>
            <tr style="width: 600px">
                <th style="width: 200px" colspan="2">바닥재</th>
                <td colspan="3">1, 2, 4, 5구역 파쇄석, 3구역 나무 데크</td>
            </tr>
            <tr style="background-color: palegreen">
                <th style="width: 200px" colspan="2">소개</th>
                <td colspan="3">다른 동과 강을 기준으로 나뉘어 프라이빗한 캠핑을 할 수 있는 사이트</td>
            </tr>

            <%-- 예약 페이지 버튼 --%>
            <tr style="width: 600px">
                <td style="width: 120px">
                    <form action="/reserve/enter_info" method="get">
                        <input type="hidden" name="site" value="C1">
                        <button type="submit" class="button-large">C-1 예약</button>
                    </form>
                </td>
                <td style="width: 120px">
                    <form action="/reserve/enter_info" method="get">
                        <input type="hidden" name="site" value="C2">
                        <button type="submit" class="button-large">C-2 예약</button>
                    </form>
                </td>
                <td style="width: 120px">
                    <form action="/reserve/enter_info" method="get">
                        <input type="hidden" name="site" value="C3">
                        <button type="submit" class="button-large">C-3 예약</button>
                    </form>
                </td>
                <td style="width: 120px">
                    <form action="/reserve/enter_info" method="get">
                        <input type="hidden" name="site" value="C4">
                        <button type="submit" class="button-large">C-4 예약</button>
                    </form>
                </td>
                <td style="width: 120px">
                    <form action="/reserve/enter_info" method="get">
                        <input type="hidden" name="site" value="C5">
                        <button type="submit" class="button-large">C-5 예약</button>
                    </form>
                </td>
            </tr>
        </table>
    </section>
</div>

<%-- 글램핑동 ------------------------------------------------------------------------------------------------------------ --%>
<div id="slideshow-container-2">
    <section class="about">
        <div class="container">
            <div class="section-title">
                <h2 class="font-h2">글램핑동</h2>
            </div>
        </div>
    </section>
    <hr/>
    <section>
        <table>
            <tr>

                <%-- 이미지 슬라이드 --%>
                <td rowspan="5">
                    <div class="slideshow-container">

                        <div class="mySlide4">
                            <img src="/resources/assets/img/글램핑1.png" style="width: 620px; height: 510px;">
                        </div>

                        <div class="mySlide4">
                            <img src="/resources/assets/img/끌램핑.png" style="width: 620px; height: 510px;">
                        </div>

                        <%-- 이미지 슬라이드 전환 버튼 --%>
                        <a class="prev" onclick="plusSlide4(-1)">❮</a>
                        <a class="next" onclick="plusSlide4(1)">❯</a>
                    </div>
                </td>
            </tr>

            <%-- 사이트 정보 확인란 --%>
            <tr style="width: 600px; background-color: palegreen">
                <th colspan="2">글램핑 D동</th>
            </tr>
            <tr style="width: 600px">
                <th style="width: 200px">바닥재</th>
                <td style="width: 400px">전체 파쇄석</td>
            </tr>
            <tr style="background-color: palegreen">
                <th style="width: 200px">소개</th>
                <td style="width: 400px">다른 동과 강을 기준으로 나뉘어 프라이빗한 캠핑을 할 수 있는 사이트</td>
            </tr>

            <%-- 예약 페이지 버튼 --%>
            <tr style="width: 600px">
                <td style="width: 600px" colspan="2">
                    <form action="/reserve/enter_info" method="get">
                        <input type="hidden" name="site" value="D1">
                        <button type="submit" class="button-large">D-1 예약</button>
                    </form>
                </td>
            </tr>
        </table>
    </section>
    <hr/>
    <section>
        <table>
            <tr>

                <%-- 이미지 슬라이드 --%>
                <td rowspan="5">
                    <div class="slideshow-container">

                        <div class="mySlide5">
                            <img src="/resources/assets/img/끌램핑1.png" style="width: 620px; height: 510px;">
                        </div>

                        <div class="mySlide5">
                            <img src="/resources/assets/img/그으을램핑.png" style="width: 620px; height: 510px;">
                        </div>

                        <div class="mySlide5">
                            <img src="/resources/assets/img/그을램핑.png" style="width: 620px; height: 510px;">
                        </div>

                        <div class="mySlide5">
                            <img src="/resources/assets/img/그을램핑1.png" style="width: 620px; height: 510px;">
                        </div>

                        <%-- 이미지 슬라이드 전환 버튼 --%>
                        <a class="prev" onclick="plusSlide5(-1)">❮</a>
                        <a class="next" onclick="plusSlide5(1)">❯</a>
                    </div>
                </td>
            </tr>

            <%-- 사이트 정보 확인란 --%>
            <tr style="width: 600px; background-color: palegreen">
                <th colspan="2">텐트 E동</th>
            </tr>
            <tr style="width: 600px">
                <th style="width: 200px">바닥재</th>
                <td>전체 나무 데크</td>
            </tr>
            <tr style="background-color: palegreen">
                <th style="width: 200px">소개</th>
                <td>다른 동과 강을 기준으로 나뉘어 프라이빗한 캠핑을 할 수 있는 사이트</td>
            </tr>

            <%-- 예약 페이지 버튼 --%>
            <tr style="width: 600px">
                <td style="width: 300px">
                    <form action="/reserve/enter_info" method="get">
                        <input type="hidden" name="site" value="E1">
                        <button type="submit" class="button-large">E-1 예약</button>
                    </form>
                </td>
                <td style="width: 300px">
                    <form action="/reserve/enter_info" method="get">
                        <input type="hidden" name="site" value="E2">
                        <button type="submit" class="button-large">E-2 예약</button>
                    </form>
                </td>
            </tr>
        </table>
    </section>
</div>

<%-- 카라반동 ------------------------------------------------------------------------------------------------------------ --%>
<div id="slideshow-container-3">
    <section class="about">
        <div class="container">
            <div class="section-title">
                <h2 class="font-h2">카라반동</h2>
            </div>
        </div>
    </section>
    <hr/>
    <section>
        <table>
            <tr>

                <%-- 이미지 슬라이드 --%>
                <td rowspan="5">
                    <div class="slideshow-container">

                        <div class="mySlide6">
                            <img src="/resources/assets/img/카라반.jpeg" style="width: 620px; height: 510px;">
                        </div>

                        <div class="mySlide6">
                            <img src="/resources/assets/img/카라반2.jpeg" style="width: 620px; height: 510px;">
                        </div>

                        <%-- 이미지 슬라이드 전환 버튼 --%>
                        <a class="prev" onclick="plusSlide6(-1)">❮</a>
                        <a class="next" onclick="plusSlide6(1)">❯</a>
                    </div>
                </td>
            </tr>

            <%-- 사이트 정보 확인란 --%>
            <tr style="width: 600px; background-color: palegreen">
                <th colspan="2">카라반 F동</th>
            </tr>
            <tr style="width: 600px">
                <th style="width: 200px">바닥재</th>
                <td>전체 파쇄석</td>
            </tr>
            <tr style="background-color: palegreen">
                <th style="width: 200px">소개</th>
                <td>다른 동과 강을 기준으로 나뉘어 프라이빗한 캠핑을 할 수 있는 사이트</td>
            </tr>

            <%-- 예약 페이지 버튼 --%>
            <tr style="width: 600px">
                <td style="width: 300px">
                    <form action="/reserve/enter_info" method="get">
                        <input type="hidden" name="site" value="F1">
                        <button type="submit" class="button-large">F-1 예약</button>
                    </form>
                </td>
                <td style="width: 300px">
                    <form action="/reserve/enter_info" method="get">
                        <input type="hidden" name="site" value="F2">
                        <button type="submit" class="button-large">F-2 예약</button>
                    </form>
                </td>
            </tr>
        </table>
    </section>
</div>



<script>
    // 이미지 슬라이드 조작부 ------------------------------------------------------------------

    <%-- 1 --%>
    var slideIndex1 = 1;
    showSlide1(slideIndex1);

    function plusSlide1(n) {
        showSlide1(slideIndex1 += n);
    }

    function currentSlide1(n) {
        showSlide1(slideIndex1 = n);
    }

    function showSlide1(n) {
        var i;
        var slides = document.getElementsByClassName("mySlide1");
        if (n > slides.length) {
            slideIndex1 = 1
        }
        if (n < 1) {
            slideIndex1 = slides.length
        }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slides[slideIndex1 - 1].style.display = "block";
    }

    // 2
    var slideIndex2 = 1;
    showSlide2(slideIndex2);

    function plusSlide2(n) {
        showSlide2(slideIndex2 += n);
    }

    function currentSlide2(n) {
        showSlide2(slideIndex2 = n);
    }

    function showSlide2(n) {
        var i;
        var slides = document.getElementsByClassName("mySlide2");
        if (n > slides.length) {
            slideIndex2 = 1
        }
        if (n < 1) {
            slideIndex2 = slides.length
        }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slides[slideIndex2 - 1].style.display = "block";
    }

    // 3
    var slideIndex3 = 1;
    showSlide3(slideIndex3);

    function plusSlide3(n) {
        showSlide3(slideIndex3 += n);
    }

    function currentSlide3(n) {
        showSlide3(slideIndex3 = n);
    }

    function showSlide3(n) {
        var i;
        var slides = document.getElementsByClassName("mySlide3");
        if (n > slides.length) {
            slideIndex3 = 1
        }
        if (n < 1) {
            slideIndex3 = slides.length
        }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slides[slideIndex3 - 1].style.display = "block";
    }

    // 4 - 글램핑
    var slideIndex4 = 1;
    showSlide4(slideIndex4);

    function plusSlide4(n) {
        showSlide4(slideIndex4 += n);
    }

    function currentSlide4(n) {
        showSlide4(slideIndex4 = n);
    }

    function showSlide4(n) {
        var i;
        var slides = document.getElementsByClassName("mySlide4");
        if (n > slides.length) {
            slideIndex4 = 1
        }
        if (n < 1) {
            slideIndex4 = slides.length
        }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slides[slideIndex4 - 1].style.display = "block";
    }

    // 5 - 글램핑
    var slideIndex5 = 1;
    showSlide5(slideIndex5);

    function plusSlide5(n) {
        showSlide5(slideIndex5 += n);
    }

    function currentSlide5(n) {
        showSlide5(slideIndex5= n);
    }

    function showSlide5(n) {
        var i;
        var slides = document.getElementsByClassName("mySlide5");
        if (n > slides.length) {
            slideIndex5 = 1
        }
        if (n < 1) {
            slideIndex5 = slides.length
        }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slides[slideIndex5 - 1].style.display = "block";
    }


    // 6 - 카라반
    var slideIndex6 = 1;
    showSlide6(slideIndex6);

    function plusSlide6(n) {
        showSlide6(slideIndex6 += n);
    }

    function currentSlide6(n) {
        showSlide6(slideIndex6 = n);
    }

    function showSlide6(n) {
        var i;
        var slides = document.getElementsByClassName("mySlide6");
        if (n > slides.length) {
            slideIndex6 = 1
        }
        if (n < 1) {
            slideIndex6 = slides.length
        }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slides[slideIndex6 - 1].style.display = "block";
    }

    // 페이지 전환 섹션 컨트롤러 -------------------------------------------------------------------

    function changePage(page) {
        var page1Content = document.getElementById("slideshow-container-1");
        var page2Content = document.getElementById("slideshow-container-2");
        var page3Content = document.getElementById("slideshow-container-3");

        if (page === 'page1') { // 캠핑동만 보이기
            page1Content.style.display = "block";
            page2Content.style.display = "none";
            page3Content.style.display = "none";
        } else if (page === 'page2') { // 글램핑동만 보이기
            page1Content.style.display = "none";
            page2Content.style.display = "block";
            page3Content.style.display = "none";
        } else if (page === 'page3') { // 카라반 동만 보이기
            page1Content.style.display = "none";
            page2Content.style.display = "none";
            page3Content.style.display = "block";
        } else if (page === 'pageAll') { // 전체 보기
            page1Content.style.display = "block";
            page2Content.style.display = "block";
            page3Content.style.display = "block";
        }
    }
</script>

<%@include file="../includes/footer.jsp"%>
