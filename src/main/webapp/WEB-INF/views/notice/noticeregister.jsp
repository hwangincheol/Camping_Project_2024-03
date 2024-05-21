<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<%@include file="../includes/header.jsp"%>

<br>
<br>
<br>
<br>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">공지 등록</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<style>
.uploadResult {
	width: 100%;
	background-color: gray;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
}

.uploadResult ul li img {
	width: 100px;
}
</style>

<style>
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
}

.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}
</style>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading"></div>
			<!-- /.panel-heading -->
			<div class="panel-body">

				<form role="form" action="/notice/noticeregister" method="post">
				
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
				
					<div class="form-group">
						<label>공지 제목</label> 
						<input class="form-control" name="board_title">
					</div>

					<div class="form-group">
						<label>공지 내용</label>
						<textarea class="form-control" id="board_content" rows="20"	name="board_content"></textarea>
					</div>

					<div class="form-group">
						<label>작성자</label> 
						<input class="form-control" name='mem_id' value='<sec:authentication property="principal.username"/>' readonly="readonly">
					</div>

					<button type="submit" class="btn btn-primary">등록</button>
					<button type="reset" class="btn btn-secondary">취소</button>
				</form>


			</div>
			<!-- end panel-body -->

		</div>
		<!-- end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->

<!-- 첨부파일 부분 -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading">첨부파일</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="form-group uploadDiv">
					<input type="file" name='uploadFile' multiple>
					<!-- 파일을 선택하기 위한 버튼 -->
				</div>
			
				<div class='uploadResult'>	<!-- 파일을 선택하여 업로드한 파일을 보여주는 부분 -->
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
<%@include file="../includes/footer.jsp"%>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>	<!-- 업로드 된 파일을 삭제하는 아이콘 버튼 url주소 -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>

<script>

$(document).ready(function(e){
	
	var formObj = $("form[role = 'form']");	//상단에 폼안에 담은 내용을 formObj에 담는 다.
		
	$("button[type = 'submit']").on("click", function(e){	// submit버튼을 클릭하면  e.prevnentDefault();
		
		e.prevnentDefault();	// 폼에 담겨져 있는 값을 자바스트립트에 우선 동작할 수 있게 하는 메서드
		
		console.log("submit clicked");
		
		var str = "";	// str 객체 생성 
		
		$(".uploadResult ul li").each(function(i, obj){ 
		// .uploadResult클래스에 each메서드를 실행해서 i 현재 인덱스와  obj 현재 요소를 담을 변수
		var jobj = $(obj);
		// obj에 있는 요소를 jobj 변수에 누정 저장
		console.dir(jobj);
		// 콘솔에 jobj에 누적된 값을 출력.
		str += "<input type='hidden' name='attachList["+i+"].attach_name' value='"+jobj.data("attach_name")+"'>";
		
		str += "<input type='hidden' name='attachList["+i+"].attach_uuid' value='"+jobj.data("attach_uuid")+"'>";
			
		str += "<input type='hidden' name='attachList["+i+"].attach_path' value='"+jobj.data("attach_path")+"'>";
			
		str += "<input type='hidden' name='attachList["+i+"].attach_Type' value='"+jobj.data("attach_Type")+"'>";
		// str 에 파일이름, uuid, 파일 경로, 파일타입을 저장
	});
	
	formObj.append(str).submit();
	// submit 버튼이 클릭이 실행 되면 str에 있는 값을 formObj에 넣는 다.
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
			 beforeSend: function(xhr) {
		          xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		      }, // 시큐리티 토큰
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
		
		$(".uploadResult").on("click", "button", function(e){
			// 버튼을 클릭하면 메서드가 실행 
			console.log("delete file");
			
			var targetFile = $(this).data("file");	// data-file 파일경로
			var type = $(this).data("type");	// data-type 파일 타입
			
			var targetLi = $(this).closest("li");	// 업로드 된 파일 선택시
			
			$.ajax({
				url: '/upload/deleteFile',
				data: {fileName: targetFile, type:type},
				 beforeSend: function(xhr) {
			          xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			      },
				dataType: 'text',
				type: 'POST',
				success: function(result){
					alert(result);
					
					targetLi.remove();	// 업로드된 선택한 파일 삭제 메서드 
				}
				
				
				
				
				
				
			});	//$.ajax
		});
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	});
</script>
