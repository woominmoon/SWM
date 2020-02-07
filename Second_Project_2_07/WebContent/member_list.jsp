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
    	<h1>ȸ����������Ʈ</h1>
    	<a href="homelist.do" class="btn btn-success btn-lg">
          <span class="glyphicon glyphicon-home"></span> Home
        </a>   
	</div>	
	<table class="table table-hover">
		<thead>
			<tr>
				<th>���̵�</th>
				<th>��й�ȣ</th>
				<th>�̸�</th>
				<th>�������</th>
				<th>����</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${list}" var="dto">
				<tr>
					<td>${dto.c_member_id}</td>
					<td>${dto.c_member_password}</td>
					<td>${dto.c_member_name}</td>
 					<td>${dto.c_member_birth}</td>
					<td>${dto.c_member_gender}</td>
				</tr>
			</c:forEach>
		</tbody>	
	</table>
	<div class="page-footer" style="text-align: right;">
    	<a href="member_deleteui.do" class="btn btn-success btn-lg">
          <span class="glyphicon glyphicon-trash"></span> ȸ������
        </a>     
	</div>
</div>	
	
<jsp:include page="member_page.jsp"/>

</body>
</html>