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
<div class="jumbotron text-center">
		<h1>회원 삭제</h1>
</div>

<div class="container">
  <form action="member_delete.do" method="post">
    <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      <input id="id" type="text" class="form-control" name="c_member_id" placeholder="아이디">
    </div>
    <br>
    <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
      <input id="password" type="password" class="form-control" name="c_member_password" placeholder="비밀번호">
    </div>
    <br>
    <br>
    <br>
    <div class="input-group" >
      <button type="submit" class="btn btn-info" onclick="button_delete();">회원 삭제</button>
    </div>
  </form>
</div>

	<script type="text/javascript">
		function button_delete() {
			if (confirm("정말 삭제 하시겠습니까?") == true) { //확인
				document.form.submit();
			} else { //취소
				return;
			}
		}
	</script>


</body>
</html>