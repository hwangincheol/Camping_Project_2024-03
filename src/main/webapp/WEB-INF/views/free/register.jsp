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
    <h1 class="page-header">게시물 등록</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">게시물을 등록해주세요</div>
      <!-- /.panel-heading -->
      <div class="panel-body">
<br>
        <form role="form" action="/free/register" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
          <div class="form-group">
            <label>제목</label> <input class="form-control" name='board_title'>
          </div>

          <div class="form-group">
            <label>내용</label>
            <textarea class="form-control" rows="3" name='board_content'></textarea>
          </div>

          <div class="form-group">
           <label>작성자</label> <input class="form-control" name='mem_id' value="${pinfo.username}" readonly>
            <br>
			<button type="submit" class="btn btn-outline-success">저장</button>
			<button type="reset" class="btn btn-outline-success">초기화</button>
        </form>



      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->
<%@include file="../includes/footer.jsp"%>