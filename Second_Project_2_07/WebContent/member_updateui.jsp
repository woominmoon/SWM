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
  <h1>ȸ������ �����ϱ�</h1>
</div>

<div class="container">
	<form role="form" action="member_update.do" method="post">
			<div class="row">
				<label class="col-xs-1" for="id">���̵�</label>
				<div class="col-xs-4">
					<input required type="text" class="form-control" id="id" name="c_member_id" value="${login.c_member_id}"><span id="idmsg"></span>
				</div>
				<div class="col-xs-1">
					
				</div>
			</div>
			<br>
			<div class="row">
				<label class="col-xs-1" for="pw">��й�ȣ</label>
				<div class="col-xs-5">
					<input required type="password" class="form-control" id="pw" name="c_member_password" placeholder="��й�ȣ�� �Է��ϼ���">
					<span id="pwmsg"></span>
				</div>
			</div>
			<br>
			<div class="row">
				<label class="col-xs-1" for="pwck">��й�ȣȮ��</label>
				<div class="col-xs-5">
					<input required type="password" class="form-control" id="pwck" name="pwcheck" placeholder="��й�ȣ Ȯ��">
					<span id="pwcheckmsg"></span>
				</div>
			</div>
			<br>
			<div class="row">
				<label class="col-xs-1" for="name">�̸�</label>
				<div class="col-xs-5">
					<input required type="text" class="form-control" id="name" name="c_member_name" placeholder="�̸��� �Է��ϼ���">
				</div>
			</div>
			<br>
			<div class="row">
				<label class="col-xs-1" for="gender">����</label>
				<div class="col-xs-5">
					<input type="radio" id="gender" name="c_member_gender" value="m" checked>����
					<input type="radio" id="gender" name="c_member_gender" value="f">����
				</div>
			</div>
			<br>
			<div class="row">
				<label class="col-xs-1" for="birth">�������</label>
				<div class="col-xs-5">
					<input required type="date" class="form-control" id="birth" name="c_member_birth">
					
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-xs-4">
					<button type="submit" class="btn btn-danger btn-lg">
						<span class="glyphicon glyphicon-edit"></span>�����ϱ�
					</button>
				</div>
				<div class="col-xs-6">
					<a href="homelist.do" class="btn btn-info btn-lg">
						<span class="glyphicon glyphicon-repeat"></span> ���ư���
					</a>
				</div>
			</div>
		
	</form>



   
	
</div>		
</body>
</html>