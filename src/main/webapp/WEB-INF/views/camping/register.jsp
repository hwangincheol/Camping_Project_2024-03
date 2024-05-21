<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@include file="../includes/header.jsp"%>

<style>
    body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
    .container-2 {
        width: 80%;
        margin: 20px auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    th, td {
        padding: 10px;
        border-bottom: 1px solid #ddd;
        text-align: left;
    }
    th {
        background-color: #f2f2f2;
    }
    tr:hover {
        background-color: #f5f5f5;
    }
    /* 모달 스타일 */
    .modal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0,0,0,0.4);
    }
    .modal-content {
        background-color: #fefefe;
        margin: 10% auto;
        padding: 20px;
        border: 1px solid #888;
        width: 80%;
    }
    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }
    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }
    
    /* 수정하기 버튼 스타일 */
    .edit-button {
        float: right; /* 우측으로 이동 */
        font-size: smaller; /* 작은 글꼴 크기 */
        margin-top: 5px; /* 상단 여백 추가 */
    }
    
    /* 버튼 텍스트 길이에 따라 크기 조정 */
    .text-ellipsis {
        display: inline-block;
        width: 100%;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
</style>

<div style="padding-top: 70px;">
    <div style="background-image: url('/resources/assets/img/main.jpg'); background-size: cover; background-position: center; height: 270px; display: flex; flex-direction: column; justify-content: center; align-items: center; text-align: center; padding-top: 30px;">
        <h1 class="text-white">커뮤니티</h1>
    </div>
</div>
<!-- -->
<section id="about" class="about">

<div class="container-2">

    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <form role="form" action="/camping/register" method="post">
                    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <div class="form-group">
                            <label for="title">제목</label>
                            <input type="text" class="form-control" id="board_title" name="board_title">
                        </div>
                        <div class="form-group">
                            <label for="content">내용</label>
                            <textarea class="form-control" id="board_content" rows="5" name='board_content'></textarea>
                        </div>
                        <div class="form-group">
                            <label for="writer">작성자</label>
                            <input type="text" class="form-control" id="mem_id" name='mem_id'>
                        </div>
                        <button type="submit" class="btn btn-primary">저장</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</section>


<div class="container-2">
    <div class="row">
        <div class="col-lg-6 offset-lg-6 col-md-6 offset-md-6 col-sm-6 offset-sm-6 col-6 offset-6">
            <a href="/camping/list" class="btn btn-primary btn-block text-ellipsis">문의 게시판 돌아가기</a>
        </div>
    </div>
</div>


<%@ include file="../includes/footer.jsp" %>
