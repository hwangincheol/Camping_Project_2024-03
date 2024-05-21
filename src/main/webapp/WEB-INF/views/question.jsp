<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="includes/header.jsp"%>

<div style="padding-top: 70px;">
    <div style="background-image: url('/resources/assets/img/main.jpg'); background-size: cover; background-position: center; height: 270px; display: flex; flex-direction: column; justify-content: center; align-items: center; text-align: center; padding-top: 30px;">
        <h1 class="text-white">커뮤니티</h1>
    </div>
</div>
<!-- -->
<section id="about" class="about">

	<div class="container">
	    <div class="section-title">
	        <h2 class="font-h2">자주하는 질문</h2>
	        <p></p>
	    </div>
	</div>
    <%@include file="includes/qa.jsp"%>
    
</section>

<%@include file="includes/footer.jsp"%>
