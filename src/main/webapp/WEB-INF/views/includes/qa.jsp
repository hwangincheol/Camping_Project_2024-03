<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
    .faq p {
        cursor: pointer;
        font-weight: bold;
        font-size: 1.1em; /* 조절 가능한 크기 */
    }
</style>
<script>
$(document).ready(function() {
    $(".faq p").click(function() {
        $(this).next(".cont").slideToggle();
    });
});
</script>

<div class="faq" style="margin: 0 auto; width: 70%;">
    <ul>
        <li>
            <p>> Q1. 인원 추가비용이 있나요?</p>
            <div class="cont" style="display: none; margin: 0 auto; width: 97%;">인원기준은 숙박객 및 방문객이 모두 포함되며, 안전상의 이유로 각 구역마다 수용인원을 초과하여 예약이 불가능 합니다.<br>
양해 부탁드리며, 많은 인원이 방문하였을경우 더 넓은 구역의 자리를 예약해주시길 바랍니다.</div>
        </li>
        <hr style="width: 100%;">
        <li>
            <p>> Q2. 현장에서 캠핑용품 렌탈이 가능한가요?</p>
            <div class="cont" style="display: none; display: none; margin: 0 auto; width: 97%;">가능합니다. 체크인시 웰컴센터에 문의 부탁드리며, 추후 다양한 캠핑용품이 추가될 예정이니 참고 부탁드립니다.</div>
        </li>
        <hr style="width: 100%;">
        <li>
            <p>> Q3. 예약을 위해 회원가입이 필요한가요?</p>
            <div class="cont" style="display: none; display: none; margin: 0 auto; width: 97%;">네, 예약시스템 이용시에는 회원가입을 하셔야 합니다.<br>해당 사이트 화면 상단에서 진행하실 수 있습니다.</div>
        </li>
        <hr style="width: 100%;">
        <li>
            <p>> Q4. 캠핑장내 편의시설은?</p>
            <div class="cont" style="display: none; display: none; margin: 0 auto; width: 97%;">캠핑장내 편의시설은 화장실, 샤워장, 매점이 있습니다.</div>
        </li>
        <hr style="width: 100%;">
        <li>
            <p>> Q5. 취수대에서 온수가 나오나요?</p>
            <div class="cont" style="display: none; display: none; margin: 0 auto; width: 97%;">취수대, 화장실, 샤워장 모두 온수 제공됩니다.</div>
        </li>
        <hr style="width: 100%;">
        <li>
            <p>> Q6. 캠핑카, 카라반, 캠핑드레일러 이용가능여부는?</p>
            <div class="cont" style="display: none; display: none; margin: 0 auto; width: 97%;">캠핑장 내부의 도로 구조가 대형(또는 길이가 긴) 캠핑차량이 이용하기 어렵기 때문입니다.<br>
한정된 공간에 많은 사이트를 제공하고, 보다 많은 시민께서 안전하게 이용하실 수 있도록 하기 위한 사항이오니 양해를 부탁드립니다.</div>
        </li>
        <hr style="width: 100%;">
        <li>
            <p>> Q7. 캠핑장 내 전기사용이 가능한가요?</p>
            <div class="cont" style="display: none; display: none; margin: 0 auto; width: 97%;">캠핑장의 전 사이트가 전기사용이 가능하며, 600W까지 사용할 수 있습니다.</div>
        </li>
        <hr style="width: 100%;">
        <li>
            <p>> Q8. 예약자 변경 및 양도 가능한가요?</p>
            <div class="cont" style="display: none; display: none; margin: 0 auto; width: 97%;">예약자 변경 및 양도는 불가하며, 예약자 본인이 홈페이지에서 취소 후 다시 예약하셔야 합니다.<br>또한 예약 환불 규정을 홈페이지에서 참조하시어 변경하시기 바랍니다.</div>
        </li>
        <hr style="width: 100%;">
        <li>
            <p>> Q9. 쓰레기와 음식물은 어떻게 처리해야 하나요?</p>
            <div class="cont" style="display: none; display: none; margin: 0 auto; width: 97%;">매표소 오른쪽에 일반, 음식물, 재활용 쓰레기 버리는 공간이 있습니다.</div>
        </li>
        <hr style="width: 100%;">
        <li>
            <p>> Q10. 캠핑장 내 또는 캠핑장 주변에 즐길 거리가 있나요?</p>
            <div class="cont" style="display: none; display: none; margin: 0 auto; width: 97%;">캠핑장 내 수영장이 있으며, 계곡을 이용하셔도 됩니다.<br>또한, 해당 사이트를 참고하시어 주변관광지를 확인하실 수 있습니다.</div>
        </li>
        
    </ul>
</div>
<br><br><br>