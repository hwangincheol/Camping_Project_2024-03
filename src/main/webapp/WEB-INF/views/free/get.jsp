<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<br>
<br>
<br>
<br>
<br>
<div class="row">
  <div class="col-lg-12">
    <h2 class="page-header">자유게시판</h2>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">자유롭게 글을 올려주세요</div>
      <!-- /.panel-heading -->
      <div class="panel-body">
<br>
<br>
        
        <div class="form-group">
          <label>제목</label> <input class="form-control" name='board_title'
            value='<c:out value="${board.board_title }"/>' readonly="readonly">
        </div>
<br>
        <div class="form-group">
          <label>내용</label>
          <textarea class="form-control" rows="3" name='board_content'
            readonly="readonly"><c:out value="${board.board_content}" /></textarea>
        </div>
<br>
        <div class="form-group">
          <label>작성자</label> <input class="form-control" name='mem_id'
            value='<c:out value="${board.mem_id }"/>' readonly="readonly">
        </div>
<br>        
        <div class="form-group">
         <label>조회수</label>
		  <p class="form-control-static">
		    <c:out value="${board.board_hit}" />
		  </p>
        </div>
        
       

<br>

<div class="btn-group" role="group" aria-label="Basic outlined example">
<button data-oper='modify' class="btn btn-outline-primary">수정</button>
<button data-oper='list' class="btn btn-outline-primary">목록</button>
</div>

<form id='operForm' action="/free/modify" method="get">
  <input type='hidden' id='board_no' name='board_no' value='<c:out value="${board.board_no}"/>'>
  <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
  <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
  <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
  <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>  
 
</form>



      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->






<div class='row'>

  <div class="col-lg-12">

    <!-- /.panel -->
    <div class="panel panel-default">
<!--       <div class="panel-heading">
        <i class="fa fa-comments fa-fw"></i> Reply
      </div> -->
      <br>
      
      
      <!-- /.panel-heading -->
      <div class="panel-body">        
      
        <ul class="chat">

        </ul>
        <!-- ./ end ul -->
      </div>
      <!-- /.panel .chat-panel -->

	<div class="panel-footer"></div>


		</div>
  </div>
  <!-- ./ end row -->
</div>

          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->




























<script type="text/javascript">
$(document).ready(function() {
  
  var operForm = $("#operForm"); 
  
  $("button[data-oper='modify']").on("click", function(e){
    
    operForm.attr("action","/free/modify").submit();
    
  });
  
    
  $("button[data-oper='list']").on("click", function(e){
    
    operForm.find("#board_no").remove();
    operForm.attr("action","/free/list")
    operForm.submit();
    
  });  
});
</script>


<%@include file="../includes/footer.jsp"%>