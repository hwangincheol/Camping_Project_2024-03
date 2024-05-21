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
<br>
<br>

<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">수정하기</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading"></div>
      <!-- /.panel-heading -->
      <div class="panel-body">

      <form role="form" action="/free/modify" method="post">
      

      
 
<div class="form-group">
  <label>번호</label> 
  <input class="form-control" name='board_no' 
     value='<c:out value="${board.board_no }"/>' readonly="readonly">
</div>

<div class="form-group">
  <label>제목</label> 
  <input class="form-control" name='board_title' 
    value='<c:out value="${board.board_title }"/>' >
</div>

<div class="form-group">
  <label>내용</label>
  <textarea class="form-control" rows="3" name='board_content' ><c:out value="${board.board_content}"/></textarea>
</div>

<div class="form-group">
  <label>작성자</label> 
  <input class="form-control" name='mem_id'
    value='<c:out value="${board.mem_id}"/>' readonly="readonly">            
</div>

<div class="form-group">
  <label>등록일</label> 
  <input class="form-control" name='board_date'
    value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.board_date}" />'  readonly="readonly">            
</div>

<div class="form-group">
  <label>수정일</label> 
  <input class="form-control" name='board_updateDate'
    value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.board_updateDate}" />'  readonly="readonly">            
</div>

          

  
  
  <button type="submit" data-oper='modify' class="btn btn-info">수정</button>
  <button type="submit" data-oper='remove' class="btn btn-info">삭제</button>
  <button type="submit" data-oper='list' class="btn btn-info">목록</button>
  
  
</form>


      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->

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



<script type="text/javascript">
$(document).ready(function() {


     var formObj = $("form");

     $('button').on("click", function(e){
       
       e.preventDefault(); 
       
       var operation = $(this).data("oper");
       
       console.log(operation);
       
       if(operation === 'remove'){
         formObj.attr("action", "/free/remove");
         
       }else if(operation === 'list'){
         //move to list
         formObj.attr("action", "/free/list").attr("method","get");
         
         var pageNumTag = $("input[name='pageNum']").clone();
         var amountTag = $("input[name='amount']").clone();
         var keywordTag = $("input[name='keyword']").clone();
         var typeTag = $("input[name='type']").clone();      
         
         formObj.empty();
         
         formObj.append(pageNumTag);
         formObj.append(amountTag);
         formObj.append(keywordTag);
         formObj.append(typeTag);          
       }
       
       formObj.submit();
     });

});
</script>



  




<%@include file="../includes/footer.jsp"%>
