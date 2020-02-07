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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="jumbotron text-center">
		<h1>�Խ��� ������Ʈ</h1>
	</div>

	<div class="container">
		<div class="row">
		
			<div class="col-sm-2">
				<hr>
				<form action="member_login.do" method="post">
					<c:choose>
						<c:when test="${empty login}">
							<div class="form-group">
								<input type="text" placeholder="���̵�" name="c_member_id" required>
							</div>
							<div class="form-group">
								<input type="password" placeholder="��й�ȣ" name="c_member_password" required>
							</div>
							<input type="submit" class="btn btn-info" value="�α���">
						</c:when>
						<c:otherwise>
							${login.c_member_name} ��, �ȳ��ϼ���.
							<br>
							<br>
            				<a href="member_logout.do" class="btn btn-warning" role="button">�α׾ƿ�</a>
						</c:otherwise>
					</c:choose>
				</form>
				<hr>
				<c:choose>
					<c:when test="${empty login}">
						<a href="member_insertui.do" class="btn btn-danger" role="button">ȸ������</a>	
					</c:when>
					<c:otherwise>
            			<a href="member_read.jsp" class="btn btn-info" role="button">�� ��������</a>
					</c:otherwise>
				</c:choose>
				<hr>
				<c:choose>
					<c:when test="${login.c_member_id == 'admin'}">
						<a href="member_list.do" class="btn btn-success" role="button">ȸ�����</a>	
					</c:when>
					
				</c:choose>
				
			</div>

			<div class="col-sm-8">
				<h3>�α� ��õ��</h3>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>�۹�ȣ</th>
							<th>����</th>
							<th>�ۼ���</th>
							<th>�ۼ���</th>
							<th>��ȸ��</th>
							<th>��õ</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${recomlist}" var="rcl">
							<tr>
								<td>${rcl.c_board_num}</td>
								<td><a href="board_read.do?c_board_num=${rcl.c_board_num}">${rcl.c_board_title}</a></td>
								<td>${rcl.c_board_author}</td>
								<td>${rcl.c_board_writeday}</td>
								<td>${rcl.c_board_readcnt}</td>
								<td>${rcl.c_board_recom}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<h3>�α� ��ȸ��</h3>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>�۹�ȣ</th>
							<th>����</th>
							<th>�ۼ���</th>
							<th>�ۼ���</th>
							<th>��ȸ��</th>
							<th>��õ</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${cntlist}" var="ctl">
							<tr>
								<td>${ctl.c_board_num}</td>
								<td><a href="board_read.do?c_board_num=${ctl.c_board_num}">${ctl.c_board_title}</a></td>
								<td>${ctl.c_board_author}</td>
								<td>${ctl.c_board_writeday}</td>
								<td>${ctl.c_board_readcnt}</td>
								<td>${ctl.c_board_recom}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="col-sm-2">
				<h3><span class="glyphicon glyphicon-list"></span>&nbsp;&nbsp;�Խ���</h3>
				<br>
				<a href="board_list.do" class="btn btn-default btn-lg" role="button">�Խ��� ����</a>
				<br><br><br>
				<h4>&nbsp;&nbsp;�湮�ڼ�: <%= application.getAttribute("counter") %></h4>
			</div>

		</div>
	</div>
<%
   Integer count = (Integer)application.getAttribute("counter"); 

   if(count == null)
   {
      application.setAttribute("counter",1);   
   }
   else
   {
      count = count + 1;
      application.setAttribute("counter", count);   
   }
%>
 
</body>
</html>