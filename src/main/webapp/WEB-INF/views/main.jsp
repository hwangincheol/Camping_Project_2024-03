<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="includes/header.jsp"%>

  <!-- ======= Hero Section ======= -->
<section id="hero" style="margin-top: 50px; height: 755px;">
    <div id="heroCarousel" data-bs-interval="3000" class="carousel slide carousel-fade" data-bs-ride="carousel">

      <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

      <div class="carousel-inner" role="listbox">

        <!-- Slide 1 -->
        <div class="carousel-item active" style="background-image: url(/resources/assets/img/slide/main1.jpg); height: 755px;">
        </div>

        <!-- Slide 2 -->
        <div class="carousel-item" style="background-image: url(/resources/assets/img/slide/main2.jpg); height: 755px;">
        </div>

        <!-- Slide 3 -->
        <div class="carousel-item" style="background-image: url(/resources/assets/img/slide/main3.jpg); height: 755px;">
        </div>

      </div>

      <a class="carousel-control-prev" href="#heroCarousel" role="button" data-bs-slide="prev" style="text-decoration: none;">
        <span class="carousel-control-prev-icon bi bi-chevron-left" aria-hidden="true"></span>
      </a>

      <a class="carousel-control-next" href="#heroCarousel" role="button" data-bs-slide="next" style="text-decoration: none;">
        <span class="carousel-control-next-icon bi bi-chevron-right" aria-hidden="true"></span>
      </a>

    </div>
  </section><!-- End Hero -->


  <main id="main">

    <!-- ======= My & Family Section ======= -->
    <section id="about" class="about">
      <div class="container">

        <div class="section-title">
          <h2>밤 하늘 수 놓은 별들에 빠져보세요</h2>
          <p>"별빛누리캠핑장"은 도심의 소란을 떠나, 자연 속에서의 평온한 휴식을 선사하는 곳입니다.<br>넓은 공간과 다양한 활동으로 자연을 만끽하며 새로운 경험을 쌓을 수 있는 곳입니다. 함께 힐링하고 휴식을 취하며 새로운 모험을 시작해보세요!</p>
        </div>

        <div class="row content">
          <div class="col-lg-6">
            <img src="/resources/assets/img/은하수.png" class="img-fluid" alt="..." style="margin-left: 150px;">
          </div>
          <div class="col-lg-6 pt-4 pt-lg-0">
            <p>
            </p>
            <br/><br/>
            <ul>
              <li><i class="ri-check-double-line"></i> 도심에서 벗어나 자연에서의 하루</li>
              <li><i class="ri-check-double-line"></i> 밝은 불빛에 가려 볼 수 없던 쏟아지는 별과의 하루</li>
              <li><i class="ri-check-double-line"></i> 별빛과 함께하는 밤은 도시의 야경과 비교할 수 없는 감정</li>
            </ul>
            <br/><br/>
            <p>
              저희 별빛누리 캠핑장에서 하루를 보내보세요.
              시끄러운 도심에서 지친 시간을 보낸 당신에게 주는 자연의 선물을 확인해보세요.
              우리의 야경은 감히 도시의 야경과 비교할 수 없는 감정을 북돋아 줍니다!
              사랑하는 가족, 연인, 동무와 함께 소중한 시간을 보내세요!!
            </p><br/><br/>
            <a href="/reserve/site_choice" class="btn-learn-more">예약하러 가기!</a>
          </div>
        </div>

      </div>
    </section><!-- End My & Family Section -->

    <!-- ======= Recent Photos Section ======= -->
    <section id="recent-photos" class="recent-photos">
      <div class="container">

        <div class="section-title">
          <h2>다양한 테마를 가진 캠핑존</h2>
        </div>
        <div class="recent-photos-slider swiper">
          <div class="swiper-wrapper align-items-center">
			<div class="swiper-slide"><a href="/resources/assets/img/카라반.jpeg" class="glightbox"><img src="/resources/assets/img/카라반.jpeg" class="img-fluid" alt=""></a></div>
			<div class="swiper-slide"><a href="/resources/assets/img/카라반2.jpeg" class="glightbox"><img src="/resources/assets/img/카라반2.jpeg" class="img-fluid" alt=""></a></div>
			<div class="swiper-slide"><a href="/resources/assets/img/샤워실(1).png" class="glightbox"><img src="/resources/assets/img/샤워실.png" class="img-fluid" alt=""></a></div>
			<div class="swiper-slide"><a href="/resources/assets/img/탈의실.jpeg" class="glightbox"><img src="/resources/assets/img/탈의실.jpeg" class="img-fluid" alt=""></a></div>
          	<div class="swiper-slide"><a href="/resources/assets/img/B동.jpeg" class="glightbox"><img src="/resources/assets/img/B동.jpeg" class="img-fluid" alt=""></a></div>
			<div class="swiper-slide"><a href="/resources/assets/img/B동1.jpeg" class="glightbox"><img src="/resources/assets/img/B동1.jpeg" class="img-fluid" alt=""></a></div>
			<div class="swiper-slide"><a href="/resources/assets/img/C동.jpg" class="glightbox"><img src="/resources/assets/img/C동.jpg" class="img-fluid" alt=""></a></div>
			<div class="swiper-slide"><a href="/resources/assets/img/그으을램핑.png" class="glightbox"><img src="/resources/assets/img/그으을램핑.png" class="img-fluid" alt=""></a></div>
			<div class="swiper-slide"><a href="/resources/assets/img/그으을램핑1.png" class="glightbox"><img src="/resources/assets/img/그으을램핑1.png" class="img-fluid" alt=""></a></div>
          </div>
          <div class="swiper-pagination"></div>
        </div>
      </div>
    </section><!-- End Recent Photos Section -->

	<script>
		var result = '<c:out value="${result}"/>';
		if (result !== ""){
			alert("회원정보 수정이 완료되었습니다.");
		}
	</script>
	
  </main><!-- End #main -->
<%@include file="includes/footer.jsp"%>
  