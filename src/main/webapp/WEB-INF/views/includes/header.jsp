<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>별빛 누리 캠핑장</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="/resources/assets/img/favicon.png" rel="icon">
  <link href="/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="/resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="/resources/assets/css/style.css" rel="stylesheet">
  
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  


  <!-- =======================================================
  * Template Name: MeFamily
  * Template URL: https://bootstrapmade.com/family-multipurpose-html-bootstrap-template-free/
  * Updated: Mar 17 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  <style>
  	a {
    	text-decoration: none;
	}
	
    .logo a {
      font-family: 'Yogitae', sans-serif;
	  font-size: 30px; 
	}
	
	.navbar ul li a,
	.navbar ul li ul li a {
	  text-decoration: none;
	}

    #header {
      box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1); 
    }

  /* h2폰트 바꿔버리기 */
    @font-face {
        font-family: 'Yogitae';
        src: url('/resources/assets/fonts/JALNAN2.OTF') format('truetype');
        /* resources 폴더 내의 fonts 폴더에 여기어때.ttf 파일이 있다고 가정합니다. */
        
    }
     .font-h2 {
        font-family: 'Yogitae', sans-serif; 
        font-weight: bold;
     }

    @font-face {
        font-family: 'Gmarket3';
        src: url('/resources/assets/fonts/GMARKETSANSMEDIUM.OTF') format('truetype');
        /* resources 폴더 내의 fonts 폴더에 여기어때.ttf 파일이 있다고 가정합니다. */
        
    }
     .font-h3 {
        font-family: 'YGmarket3', sans-serif; 
        font-weight: bold;
     }


    @font-face {
        font-family: 'Gmarket';
        src: url('/resources/assets/fonts/GMARKETSANSMEDIUM.OTF') format('truetype');
        /* resources 폴더 내의 fonts 폴더에 여기어때.ttf 파일이 있다고 가정합니다. */
    }
    .font-p {
        font-family: 'Gmarket', sans-serif;
        /* "여기어때" 폰트를 사용하고, 사용할 수 없는 경우 sans-serif 폰트로 대체합니다. */
        font-weight: bold;
    }

    @font-face {
        font-family: 'Yogitae';
        src: url('/resources/assets/fonts/JALNAN2.OTF') format('truetype');
        /* resources 폴더 내의 fonts 폴더에 여기어때.ttf 파일이 있다고 가정합니다. */
    }
    .text-white {
        font-family: 'Yogitae', sans-serif;
        /* "여기어때" 폰트를 사용하고, 사용할 수 없는 경우 sans-serif 폰트로 대체합니다. */
    }
    
    .yogi {
        font-family: 'Yogitae', sans-serif;
        font-size: 16px;
    }
    
</style>
 
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center justify-content-between">

      <h1 class="logo"><a href="/">별빛누리캠핑장</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav id="navbar" class="navbar" >
        <ul>
          <li><a class="active" href="/" ><span class="yogi">Home</span></a></li>
          <li class="dropdown"><a href="#"><span class="yogi">캠핑장안내</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="/info/info1">캠핑장 소개</a></li>
              <li><a href="/info/info2">이용수칙</a></li>
              <li><a href="/info/info3">요금정보</a></li>
              <li><a href="/info/info4">오시는길</a></li>
            </ul>
          </li>
          <li class="dropdown"><a href="#"><span class="yogi">시설정보</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="/siseol/siseol1">배치도</a></li>
              <li><a href="/siseol/siseol2">캠핑동</a></li>
              <li><a href="/siseol/siseol3">글램핑동</a></li>
              <li><a href="/siseol/siseol4">카라반동</a></li>
              <li><a href="/siseol/siseol5">주변 시설</a></li>
            </ul>
          </li>
          <li><a href="/reserve/site_choice"><span class="yogi">예약하기</span></a>
          </li>
          <li class="dropdown"><a href="#"><span class="yogi">커뮤니티</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="/notice/noticelist">공지사항</a></li>
              <li><a href="/question">자주하는 질문</a></li>
              <li><a href="/camping/list">문의 게시판</a></li>
              <li><a href="/free/list">자유 게시판</a></li>
              <li><a href="/review/list">후기 게시판</a></li>
            </ul>
          </li>
          <li><a href="/tour/tour1"><span class="yogi">주변 관광지</span></a></li>
		  <sec:authorize access="isAnonymous()">
			<li><a href="/member/customLogin"><span class="yogi">로그인</span></a></li>
		  	<li><a href="/member/join"><span class="yogi">회원가입</span></a></li>
		  </sec:authorize>
		  <sec:authorize access="isAuthenticated()">
		    <sec:authentication property="principal" var="pinfo"/>
		   	<li class="dropdown"><a href="/member/myAccount"><span class="yogi">마이페이지</span> <i class="bi bi-chevron-down"></i></a>
	            <ul>
	            	<p>✅어서오세요, ${ pinfo.member.mem_name }님</p>
	              <li><a href="/reserve/getMem">예약 현황</a></li>
	              <li><a href="/member/myAccount">내 정보 보기</a></li>
	              <li><a href="/member/updateForm">회원정보 수정</a></li>
			      <li>
			        <form id="logoutForm" action="/customLogout" method="post">
			            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			            <a href="#" onclick="document.getElementById('logoutForm').submit();">로그아웃</a>
			        </form>
			      </li>
	            </ul>
            </li>
		  </sec:authorize>
        </ul>
      </nav><!-- .navbar -->
    </div>
  </header><!-- End Header -->
  
  