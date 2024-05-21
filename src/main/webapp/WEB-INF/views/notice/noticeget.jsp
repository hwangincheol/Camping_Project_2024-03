<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/header.jsp"%>
<br>
<br>
<br>
<!-- ======= My & Family Section ======= -->


<section id="about" class="about">
	<div class="container">
		<div class="section-title">
			<h2>My & Family</h2>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">공지 사항 내용</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->


	<div class="row">
    <div class="col-lg-12">
        <div class="card">
            <div class="card-header">공지 상세 내용</div>
            <div class="card-body">
                <div class="mb-3">
                    <label for="board_no" class="form-label">번호</label>
                    <input class="form-control" id="board_no" value='<c:out value="${notice.board_no}"/>' readonly="readonly">
                </div>
                <div class="mb-3">
                    <label for="board_title" class="form-label">제목</label>
                    <input class="form-control" id="board_title" value='<c:out value="${notice.board_title}"/>' readonly="readonly">
                </div>
                <div class="mb-3">
                    <label for="board_content" class="form-label">내용</label>
                    <textarea class="form-control" id="board_content" rows="15" readonly="readonly"><c:out value="${notice.board_content}"/></textarea>
                </div>
                <div class="mb-3">
                    <label for="mem_id" class="form-label">작성자</label>
                    <input class="form-control" id="mem_id" value='<c:out value="${notice.mem_id}"/>' readonly="readonly">
                </div>
                
                <div class="mb-3">
                    <label for="mem_id" class="form-label">조회수</label>
                    <input class="form-control" id="board_hit" value='<c:out value="${notice.board_hit}"/>' readonly="readonly">
                </div>
                

                
                <!-- <button type="button" class="btn btn-secondary" onclick="location.href='/notice/noticemodify?board_no=<c:out value="${notice.board_no}"/>'">수정</button> -->
                
                <form id='operForm' action="/notice/noticemodify" method="get">
                <sec:authentication property="principal" var="pinfo"/>
	            <sec:authorize access="isAuthenticated()">
           		<c:if test="${pinfo.username eq notice.mem_id }">
				<button data-oper='noticemodify' class="btn btn-default" value="${notice.board_no}">수정</button>
					</c:if>
				</sec:authorize>
                <button type="button" class="btn btn-primary" onclick="location.href='/notice/noticelist'">목록</button>
                	<input type='hidden' id='board_no' name='board_no' value='<c:out value="${notice.board_no}"/>'>
                </form>

                
            </div>
        </div>
    </div>
</div>

<div class='bigPictureWrapper'>
  <div class='bigPicture'>
  </div>
</div>



<style>
.uploadResult {
  width:100%;
  background-color: gray;
}
.uploadResult ul{
  display:flex;
  flex-flow: row;
  justify-content: center;
  align-items: center;
}
.uploadResult ul li {
  list-style: none;
  padding: 10px;
  align-content: center;
  text-align: center;
}
.uploadResult ul li img{
  width: 100px;
}
.uploadResult ul li span {
  color:white;
}
.bigPictureWrapper {
  position: absolute;
  display: none;
  justify-content: center;
  align-items: center;
  top:0%;
  width:100%;
  height:100%;
  background-color: gray; 
  z-index: 100;
  background:rgba(255,255,255,0.5);
}
.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}

.bigPicture img {
  width:600px;
}

</style>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading">첨부파일</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
			
				<div class='uploadResult'>
					<ul>
					</ul>
				</div>
			</div>
				<!-- end panel-body -->
		</div>
			<!-- end panel-body -->
	</div>
		<!-- end panel -->
</div>
<!-- /.row -->
		
</section>

<%@include file="../includes/footer.jsp"%>
 

<script type="text/javascript">
$(document).ready(function() {
	
	var operForm = $("#operForm");
	
	$("button[data-oper='noticemodify']").on("click", function(e){
	
		operForm.attr("action", "/notice/noticemodify").submit();
		
	});
	
	$("button[data-oper='noticelist']").on("click", function(e){
		
		operForm.find(#board_no).remove();
		operForm.attr("action", "/notice/noticelist")
		operForm.submit();
		
	});
});
</script>

<script>

$(document).ready(function(){
	
	(function(){
		
	var board_no = '<c:out value="${notice.board_no}"/>';	
	
	$.getJSON("/notice/getAttachList", {board_no:board_no}, function(arr){
		
		console.log(arr);
		
		var str = "";
		
		$(arr).each(function(i, attach){
			
			//image type
			if(attach.attach_Type){
				var fileCallPath = encodeURIComponent( attach.attach_path+ "/s_"+attach.attach_uuid +"_"+ attach.attach_name);
				
				str += "<li data-path='"+attach.attach_path+"' data-uuid='"+attach.attach_uuid"'+ data-filename='"+attach.attach_name+"' data-type='"+attach.attach_Type+"' ><div>";
				str += "<img src='/display?fileName="+fileCallPath+"'>";
				str += "</div>";
				str +"</li>";
			}else{
				
				str += "<li data-path='"+attach.attach_path+"' data-uuid='"+attach.attach_uuid+"' data-filename='"attach.attach_name+"' data-type='"+attach.attach_Type+"' ><div>";
				str += "<span> "+ attach.attach_name+"</span><br/>";
				str += "<img src='/resources/assets/img/apple-touch-icon.png'>";
				str += "</div>";
				str +"</li>";
			}
		});
		
		$(".uploadResult ul").html(str);
		
	});	// end getjson
	})();	// end function
	
	$(".uploadResult").on("click", "li", function(e){
		
		console.log("view image");
		
		var liObj = $(this);
		
		var path = encodeURIComponent(liObj.data("path")+"/" + liObj.data("uuid")+"_" + liObj.data("filename"));
		
		if(liObj.data("type")){
			showImage(path.replace(new RegExp(/\\/g), "/"));
		}else {
			//download
			self.location = "/download?fileName="+path
		}
		
	});
	
	function showImage(fileCallPath){
		
		alert(fileCallPath);
		
		$(".bigPictureWrapper").css("display", "flex").show();
		
		$(".bigPicture")
		.html("<img src='/display?fileName="+fileCallPath+"'>")
		.animate({width: '100%', height: '100%'}, 1000);
	}
	
	$(".bigPictureWrapper").on("click", function(e){
		$(".bigPicture").animate({width: '0%', height: '0%'}, 1000);
		setTimeout(function(){
			$('.bigPictureWrapper').hide();
		}, 1000);
	});
});

</script>


















































