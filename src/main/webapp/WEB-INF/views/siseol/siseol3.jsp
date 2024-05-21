<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp"%>
<!-- <img src="/resources/assets/img/main.jpg" class="img-fluid" alt="..."> -->
<div style="padding-top: 70px;">
	<div style="background-image: url('/resources/assets/img/main.jpg'); background-size: cover; background-position: center; height: 270px; display: flex; flex-direction: column; justify-content: center; align-items: center; text-align: center; padding-top: 30px;">
    	<h1 class="text-white">시설정보</h1>
	</div>
</div>

<!-- 시설관리 꾸미기 -->
<style>
    .resized-img {
        width: 300px; /* 가로 크기를 조정 */
        height: 300px; /* 세로 크기를 가로 크기와 동일하게 설정 */
        object-fit: cover; /* 이미지를 화면에 꽉 채우도록 설정 */
        cursor: pointer; /* 포인터 커서로 변경하여 사용자에게 클릭 가능함을 보여줌 */
    }

    .modal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.8); /* 검은색 배경, 투명도 조절 */
	    z-index: 999; /* 모달보다 앞에 위치하도록 z-index 설정 */
	    display: none; /* 기본적으로는 숨김 */
    }
    .modal.active {
	    display: block; /* 모달이 열릴 때만 표시 */
	}

    .modal-content {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        max-width: 500px;
        max-height: 500px;
        cursor: pointer;
        background-color: rgba(0, 0, 0, 0.9); /* 모달 내용의 배경색을 지정 */
    }

    .close {
        position: absolute;
        top: 15px;
        right: 35px;
        color: #fff;
        font-size: 30px;
        font-weight: bold;
        cursor: pointer;
    }

    .close:hover,
    .close:focus {
        color: #bbb;
        text-decoration: none;
        cursor: pointer;
    }
</style>

<script>
    // 모달 열기
    function openModal(modalId, imgSrc) {
        var modal = document.getElementById(modalId);
        var backdrop = document.getElementById('myModalBackdrop'); // 모달의 뒷 배경 요소
        var img = modal.querySelector('img');
        img.src = imgSrc;
        modal.style.display = "block";
        backdrop.style.display = "block"; // 뒷 배경 표시
        document.body.style.overflow = "hidden"; // 모달이 열릴 때 스크롤 방지

        // 모달 외부 영역을 클릭했을 때 닫히도록 이벤트 리스너 추가
        modal.addEventListener('click', function(event) {
            if (event.target === modal) {
                closeModal(modalId);
            }
        });
    }

    // 모달 닫기
    function closeModal(modalId) {
        var modal = document.getElementById(modalId);
        var backdrop = document.getElementById('myModalBackdrop'); // 모달의 뒷 배경 요소
        modal.style.display = "none";
        backdrop.style.display = "none"; // 뒷 배경 숨김
        document.body.style.overflow = "auto"; // 모달이 닫힐 때 스크롤 재개
    }
</script>
<!-- 시설관리 꾸미려고 여기까지 만드럿슴 -->

<!-- -->
<section id="about" class="about">
    <div class="container">
        <div class="section-title">
           <h2 class="font-h2">글램핑동</h2>
            <br>
            <br>
            <h3 class="font-h3">글램핑 D1호</h3>
              <img src="/resources/assets/img/글램핑1.png" class="img-fluid resized-img" alt="..." onclick="openModal('modal10', '/resources/assets/img/글램핑1.png')">
              <img src="/resources/assets/img/끌램핑.png" class="img-fluid resized-img" alt="..." onclick="openModal('modal11', '/resources/assets/img/끌램핑.png')">
             <br>
            <br>
            <h3 class="font-h3">글램핑 E1호</h3>
              <img src="/resources/assets/img/끌램핑1.png" class="img-fluid resized-img" alt="..." onclick="openModal('modal12', '/resources/assets/img/끌램핑1.png')">
              <img src="/resources/assets/img/그으을램핑.png" class="img-fluid resized-img" alt="..." onclick="openModal('modal13', '/resources/assets/img/그으을램핑.png')"> 
             <br>
            <br>
            <h3 class="font-h3">글램핑 E2호</h3>
              <img src="/resources/assets/img/그을램핑.png" class="img-fluid resized-img" alt="..." onclick="openModal('modal14', '/resources/assets/img/그을램핑.png')">
              <img src="/resources/assets/img/그을램핑1.png" class="img-fluid resized-img" alt="..." onclick="openModal('modal15', '/resources/assets/img/그을램핑1.png')">
            <!-- 모달 -->
      <div id="modal10" class="modal">
                <div class="modal-content">
                    <span class="close" onclick="closeModal('modal10')">&times;</span>
                    <img class="img-fluid" id="img10">
                </div>
            </div>
            
            <div id="modal11" class="modal">
                <div class="modal-content">
                    <span class="close" onclick="closeModal('modal11')">&times;</span>
                    <img class="img-fluid" id="img11">
                </div>
            </div>
            
            <div id="modal12" class="modal">
                <div class="modal-content" onclick="closeModal('modal12')">
                    <span class="close" onclick="closeModal('modal12')">&times;</span>
                    <img class="img-fluid" id="img12">
                </div>
            </div>
            
            <div id="modal13" class="modal">
                <div class="modal-content">
                    <span class="close" onclick="closeModal('modal13')">&times;</span>
                    <img class="img-fluid" id="img13">
                </div>
            </div>
            
            <div id="modal14" class="modal">
                <div class="modal-content">
                    <span class="close" onclick="closeModal('modal14')">&times;</span>
                    <img class="img-fluid" id="img14">
                </div>
            </div>
            
            <div id="modal15" class="modal">
                <div class="modal-content">
                    <span class="close" onclick="closeModal('modal15')">&times;</span>
                    <img class="img-fluid" id="img15">
                </div>
            </div>
            
        </div>
    </div>
    
</section>


<%@include file="../includes/footer.jsp"%>






