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
  <h1>ȸ������ �ڼ��� ����</h1>
</div>

<div class="container">
	<div class="row">
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th colspan="3" style="background-color: #eeeeee; text-align: center;">ȸ�� ����</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="width: 20%;">���̵�</td>
					<td colspan="2" style="text-align: left;">${login.c_member_id}</td>
				</tr>
				<tr>
					<td style="width: 20%;">��й�ȣ</td>
					<td colspan="2" style="text-align: left;">${login.c_member_password}</td>
				</tr>
				<tr>
					<td style="width: 20%;">�̸�</td>
					<td colspan="2" style="text-align: left;">${login.c_member_name}</td>
				</tr>
				<tr>
					<td style="width: 20%;">�������</td>
					<td colspan="2" style="text-align: left;">${login.c_member_birth}</td>
				</tr>
				<tr>
					<td style="width: 20%;">����</td>
					<td colspan="2" style="text-align: left;">${login.c_member_gender}</td>
				</tr>
			</tbody>
		</table>
	</div>
    
	<hr>
	
	<div class="page-footer">
		<a href="homelist.do" class="btn btn-info btn-lg">
          <span class="glyphicon glyphicon-home"></span> Ȩ
        </a>&nbsp;&nbsp;&nbsp;
        <a href="member_updateui.jsp" class="btn btn-info btn-lg">
          <span class="glyphicon glyphicon-edit"></span> ȸ����������
        </a>&nbsp;&nbsp;&nbsp;
        <a href="member_deleteui.do?c_member_id=${login.c_member_id}" class="btn btn-info btn-lg">
          <span class="glyphicon glyphicon-new-window"></span> ȸ�� Ż��
        </a>     
	</div>
	
</div>	
</body>
</html>