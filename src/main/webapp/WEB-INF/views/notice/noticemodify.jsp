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
			<h1 class="page-header">공지 사항</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	
<form role="form" action="/notice/noticemodify" method="post">
	
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	
	<div class="form-group">
		<label>번호</label>
		<input class="form-control" name='board_no' value='<c:out value="${notice.board_no}"/>' readonly="readonly">
	</div>
	
	<div class="form-group">
		<label>제목</label>
		<input class="form-control" name='board_title' value='<c:out value="${notice.board_title }"/>'>
	</div>
	
	<div class="form-group">
		<label>내용</label>
		<textarea class="form-control" rows="20" name='board_content' ><c:out value="${notice.board_content}"/></textarea>
	</div>
	
	<div class="form-group">
		<label>작성자</label>
		<input class="form-control" name='mem_id' value='<c:out value="${notice.mem_id}"/>' readonly="readonly">
	</div>
	
	<div class="form-group">
		<label>작성일</label>
		<input class="form-control" name='board_date' value='<fmt:formatDate pattern="yyyy/MM/dd" value="${notice.board_date }"/>' readonly="readonly">
	</div>
	
	<div class="form-group">
		<label>수정일</label>
		<input class="form-control" name='board_updatedate' value='<fmt:formatDate pattern="yyyy/MM/dd" value="${notice.board_updatedate}"/>' readonly="readonly">
	</div>
	
	<sec:authentication property="principal" var="pinfo"/>
	
	<sec:authorize access="isAuthenticated()">
	
	<c:if test="${pinfo.username eq notice.mem_id }">
	
	<button type="submit" data-oper='noticemodify' class="btn btn-default">수정</button>
	<button type="submit" data-oper='noticeremove' class="btn btn-danger">삭제</button>
	</c:if>
	</sec:authorize>
	<button type="submit" data-oper='noticelist' class="btn btn-info">목록</button>

</form>

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
				<div class="form-group uploadDiv">
					<input type="file" name='uploadFile' multiple="multiple">
				</div>
			
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
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	var formObj = $("form[role = 'form']");
	
	var csrfHeaderName ="${_csrf.headerName}"; // 시큐리티 접근제한 해제용 중요!!!!!!!!!!!!!!!!!!!!!!!!!
  	var csrfTokenValue="${_csrf.token}";	// 시큐리티 접근제한 해제용 중요!!!!!!!!!!!!!!!!!!!!!!!!!
	
	$("button[type = 'submit']").on("click", function(e){
	
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation === 'noticeremove'){
			formObj.attr("action", "/notice/noticeremove");
			
		}else if(operation === 'noticelist'){
				
			formObj.attr("action", "/notice/noticelist").attr("method", "get");
			formObj.empty();
			
		}else if(operation === 'noticemodify') {
			
			console.log("submit clicked");
			
			var jobj = $(obj);
			
			console.dir(jobj);
			
			str += "<input type='hidden' name='attachList["+i+"].attach_name' value='"+jobj.data("attach_name")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].attach_uuid' value='"+jobj.data("attach_uuid")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].attach_path' value='"+jobj.data("attach_path")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].attach_Type' value='"+jobj.data("attach_Type")+"'>";
			
			//formObj.attr("action", "/notice/noticelist").attr("method", "post");
		});
  		formObj.append(str).submit();	
  	
	}
		formObj.submit();
});
		
		$.ajax({
			url: 'uploadAjaxAction',
			processData: false,
			contentType: false,
			beforeSend: function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			data:formData,
			type: 'POST',
			dataType:'json',
			success: function(result){
				console.log(result);
				showUploadResult(result);
			}
			
		});	
		
	});
})
</script>

<script>

$(document).ready(function(){
	(function(){
		
		var board_no = '<c:out value="${notice.board_no}"/>';
		
		$.getJSON("/notice/getAttachList", {board_no: board_no}, function(arr){
			
			console.log(arr);
			
			var str = "";
			
			$(arr).each(function(i, attach){
				
				// image type
				if(attach.attach_Type){
					var fileCallPath = encodeURIComponent(  attach.attach_path+ "/s_"+attach.attach_uuid +"_"+ attach.attach_name);
					

					str += "<li data-path='"+attach.attach_path+"' data-uuid='"+attach.attach_uuid+"' "
					str +=" data-filename='"+attach.attach_name+"' data-type='"+attach.attach_Type+"' ><div>";
					str += "<span> "+ attach_name + "</span>";
					str += "<button type='button' data-file=\'"+ fileCallPath +"\' data-type='image' "
					str += "class='btn btn-warning btn-circle'><i class= 'fa-solid fa-xmark'></i></button><br>";
					str += "<img src='/display?fileName="+fileCallPath+"'>";
					str += "</div>";
					str +"</li>";
				}else{
					
					str += "<li data-path='"+attach.attach_path+"' data-uuid='"+attach.attach_uuid+"' "
					str += "data-filename='"attach.attach_name+"' data-type='"+attach.attach_Type+"' ><div>";
					str += "<span> "+ attach.attach_name+"</span><br/>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' "
					str += " class='btn btn-warning btn-circle'><i class= 'fa-solid fa-xmark'></i></button><br>";
					str += "<img src='/resources/assets/img/apple-touch-icon.png'>";
					str += "</div>";
					str +"</li>";
				}
			});
			
			$(".uploadResult ul").html(str);
			
		});	//	end getjson
		
	})();	//	end function
	
	$(".uploadResult").on("click", "button", function(e){
		
		console.log("delete file");
		
		if(confirm("Remove this file?")){
			
			var targetLi = $(this).closest("li");
			
			targetLi.remove();
		}
	});
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");	// 파일 타입을 저장하는 변수
	var maxSize = 5242880;	// 5MB 파일크기를 지정해주는 변수
	
	function checkExtension(fileName, fileSize){ 
		
		if(fileSize >= maxSize){	// 업로드 파일를 비교
			alert("파일 사이즈 초과");
			return false;
		}
		
		if(regex.test(fileName)){	// 업로드 파일을 비교
			alert("해당 종류의 파일은 업로드 할 수 없습니다.");
			return false;
		}
		return true;
	}
	
var csrfHeaderName="${_csrf.headerName}";
var csrfTokenValue="${_csrf.token}";
	
	$("input[type = 'file']").change(function(e){
		// 타입이 파일이라는 input 실행되면 
		var formData = new FormData();
		
		var inputFile = $("input[name = 'uploadFile']");
		// 상단에 input에 uploadfile을 inputfile에 저장
		var files = inputFile[0].files;
		// 파일 여러개를 담는 배열 변수 
		for(var i = 0; i < files.length; i++){
		// 파일 사이즈와 타입을 for문으로 검사
			if(!checkExtension(files[i].name, files[i].size)	){
				return false;
			}
			formData.append("uploadFile", files[i]);	// true 일때 파일을 formData에 저장
		}
		
		$.ajax({
			url: '/upload/uploadAjaxAction',	// uploadAjaxAction 메서드 실행
			processData: false,	
			contentType: false,
			data: formData,
			type: 'POST',
			dataType: 'json',
			success: function(result){
				console.log(result);
				showUploadResult(result);	// 업로드 결과 처리 함수
			}
		});	// $.ajax
		
		function showUploadResult(uploadResultArr){
			
			if(!uploadResultArr || uploadResultArr.length == 0){return;}
			
			var uploadUL = $(".uploadResult ul");
			// .uploadResult ul 스타일이 실행되며 uploadUL 변수에 저장
			var str = "";
			
			$(uploadResultArr).each(function(i, obj){
				
				// image type
				if(obj.image){	// 이미지파일이 맞으면 섬네일형식으로 이미지를 보여준다.
					var fileCallPath = encodeURIComponent(obj.attach_path + "/s_" + obj.attach_uuid + "_" + obj.attach_name);
					
					str += "<li data-path='"+obj.attach_path+"'";
					str += " data-uuid='"+obj.attach_uuid+"' data-filename='"+obj.attach_name+"' data-type='"+obj.image+"'"
					str += "><div>";
					str += "<span> " + obj.attach_name + "</span>";
					str += "<button type= 'button' data-file=\'" + fileCallPath + "\' "
					str += "data-type='image' class= 'btn btn-warning btn-circle'><i class= 'fa-solid fa-xmark'></i></button><br>";
					str += "<img src ='/display?fileName =" + fileCallPath + "'>";
					str += "</div>";
					str += "</li>";
					
				}else{	// 이미지 파일이 아니면 지정한 아이콘이미지를 보여준다
					var fileCallPath = encodeURIComponent(obj.attach_path + "/" + obj.attach_uuid + "_" + obj.attach_name);
					var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");	// 지정한 파일타입을 확인하는 변수
					
					str += "<li "
					str += "data-path='"+obj.attach_path+"' data-uuid='"+obj.attach_uuid+"' data-filename='"+obj.attach_name+"' data-type='"+obj.image+"'><div>";
					str += "<span> " + obj.attach_name + "</span>";
					str += "<button type = 'button' data-file=\'" + fileCallPath + "\' data-type='file' "
					str += "class = 'btn btn-warning btn-circle'><i class='fa-solid fa-xmark'></i></button><br>";
					str += "<img src = '/resources/assets/img/apple-touch-icon.png'></a>";
					str += "</div>";
					str += "</li>";
					
				}
				
			});
			
			uploadUL.append(str);	// str 누적된 값을 uploadUL 변수에 저장
			
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
});
</script>
<%@include file="../includes/footer.jsp"%>