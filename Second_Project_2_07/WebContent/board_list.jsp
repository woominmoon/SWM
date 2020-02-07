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
	<div class="container">
		<div class="page-header">
			<h1>�Ϲ� �Խ���</h1>
			<a href="homelist.do" class="btn btn-info btn-lg"> <span
				class="glyphicon glyphicon-home"></span> Home
			</a>
		</div>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>�۹�ȣ</th>
					<th>����</th>
					<th>�ۼ���</th>
					<th>�ۼ���</th>
					<th>��ȸ��</th>
					<th>��õ</th>
					<th>����õ</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${list}" var="dto">
					<tr>
						<td>${dto.c_board_num}</td>
						<td><c:forEach begin="1" end="${dto.c_board_repIndent}">��</c:forEach>
							<a href="board_read.do?c_board_num=${dto.c_board_num}">${dto.c_board_title}</a>
						</td>
						<td>${dto.c_board_author}</td>
						<td>${dto.c_board_writeday}</td>
						<td>${dto.c_board_readcnt}</td>
						<td>${dto.c_board_recom}</td>
						<td>${dto.c_board_decom}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="page-footer" style="text-align: center;">
			<form action="board_search.do" method="post">
				<select name="bool">
					<option value="titlebool">�� ��</option>
					<option value="contentbool">�� ��</option>
					<option value="authorcontenbool">����+����</option>
					<option value="authorbool">�ۼ���</option>
				</select> 
				<input type="text" name="content">
				<input type="submit" value="�˻�" id="search">
			</form>
		</div>
		<hr>

		<div style="text-align: right;">
			<c:choose>
				<c:when test="${empty login}">
					<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">
						<span class="glyphicon glyphicon-pencil"></span> �۾���
					</button>
					<div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>
								<div class="modal-body" style="text-align: center;">
									<h3>�� �� ��</h3>
									<br>
									<form action="member_login.do" method="post">
										<div class="form-group">
											<input type="text" placeholder="���̵�" name="c_member_id" required>
										</div>
										<div class="form-group">
											<input type="password" placeholder="��й�ȣ" name="c_member_password" required>
										</div>
											<input type="submit" class="btn btn-info" value="�α���">
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-danger"
										data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<a href="board_insertui.do" class="btn btn-info btn-lg"> 
						<span class="glyphicon glyphicon-pencil"></span> �۾���
					</a>
				</c:otherwise>
			</c:choose>
		</div>

	</div>

	<jsp:include page="board_page.jsp" />

</body>
</html>