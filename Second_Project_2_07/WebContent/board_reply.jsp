<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<div class="page-header">
    	<h1>답글쓰기</h1>  
	</div>
  <form role="form" action="board_reply.do" method="post"> 
  	
  	<input type="hidden" name="c_board_num" value="${c_board_num}">
  	
    <div class="row">
      <label class="col-xs-1" for="title">제목</label>
      <div class="col-xs-6">
        <input required type="text" class="form-control" id="title" name="c_board_title" value="re:${c_board_title}">
      </div>
    </div>
    <div class="row">
      <label class="col-xs-1" for="author">작성자</label>
      <div class="col-xs-6">
        <input readonly type="text" class="form-control" id="author" name="c_board_author" value="${login.c_member_id}">
      </div>
    </div>
    <div class="row">
      <label class="col-xs-12" for="content">내용</label>
    </div>
    <div class="row">
      <div class="col-xs-8">
        <textarea required rows="5" class="form-control" id="content" name="c_board_content"></textarea>
      </div>
    </div>
	<hr>
    <div class="row">
      <div class="col-xs-6">
        <button type="submit" class="btn btn-info btn-lg">작성완료</button>
      </div>
    </div>  
  </form>
</div>	
</body>
</html>