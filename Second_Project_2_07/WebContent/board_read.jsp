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
	<h1>글 자세히 보기</h1>
</div>

<div class="container">
	<div class="row">
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글보기</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="width: 20%;">번호</td>
					<td colspan="2" style="text-align: left;">${dto.c_board_num}</td>
				</tr>
				<tr>
					<td style="width: 20%;">글 제목</td>
					<td colspan="2" style="text-align: left;">${dto.c_board_title}</td>
				</tr>
				<tr>
					<td style="width: 20%;">작성자</td>
					<td colspan="2" style="text-align: left;">${dto.c_board_author}</td>
				</tr>
				<tr>
					<td style="width: 20%;">작성일</td>
					<td colspan="2" style="text-align: left;">${dto.c_board_writeday}</td>
				</tr>
				<tr>
					<td style="width: 20%;">조회수</td>
					<td colspan="2" style="text-align: left;">${dto.c_board_readcnt}</td>
				</tr>
				<tr>
					<td style="width: 20%;">추천수</td>
					<td colspan="2" style="text-align: left;"><p id="recom">${dto.c_board_recom}</p></td>
				</tr>
			</tbody>
		</table>
		<div class="well well-lg" style="min-height: 200px; text-align: left;">${dto.c_board_content}</div>
	</div>
	
	<button name="good" type="button" class="btn btn-default btn-lg">
		<span class="glyphicon glyphicon-thumbs-up"></span> Like
	</button>
	
	<hr>
	<div class="page-footer">
		<a href="board_list.do" class="btn btn-info btn-lg">
			<span class="glyphicon glyphicon-list"></span> 목록
		</a>&nbsp;&nbsp;&nbsp;
		
			<c:choose>
				<c:when test="${empty login}">
					<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">
						<span class="glyphicon glyphicon-pencil"></span> 답글쓰기
					</button>&nbsp;&nbsp;&nbsp;
					<div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>
								<div class="modal-body" style="text-align: center;">
									<h3>로 그 인</h3>
									<br>
									<form action="member_login.do" method="post">
										<div class="form-group">
											<input type="text" placeholder="아이디" name="c_member_id" required>
										</div>
										<div class="form-group">
											<input type="password" placeholder="비밀번호" name="c_member_password" required>
										</div>
											<input type="submit" class="btn btn-info" value="로그인">
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
					<a href="board_replyui.do?c_board_num=${dto.c_board_num}&c_board_title=${dto.c_board_title}" class="btn btn-info btn-lg"> 
						<span class="glyphicon glyphicon-pencil"></span> 답글쓰기
					</a>&nbsp;&nbsp;&nbsp;
				</c:otherwise>
			</c:choose>		
		
		<c:choose>
			<c:when test="${login.c_member_id == dto.c_board_author}">
				<a href="board_updateui.do?c_board_num=${dto.c_board_num}" class="btn btn-info btn-lg">
					<span class="glyphicon glyphicon-edit"></span> 수정
				</a>&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">
					<span class="glyphicon glyphicon-trash"></span> 삭제
				</button>
			</c:when>
		</c:choose>
		
	</div>

	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body" style="text-align: center;">
					<h4>정말로 삭제하시겠습니까??</h4>
					<br>
					<br>
					<a href="board_delete.do?c_board_num=${dto.c_board_num}"class="btn btn-default btn-lg">
						<span class="glyphicon glyphicon-ok"></span> 네
					</a>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

</div>

<script type="text/javascript">
         $(document).ready(function(){
            $("button[name='good']").click(function() {
               var number = ${dto.c_board_num};
               var id = '${login.c_member_id}';
               var flag = false;
               $.ajax({
                  type:'post',
                  url   : 'recom.do',      
                  data: {
                        c_board_num : number,
                        c_member_id : id
                  },
                  dataType:'text',
                  success: function(result){   
                     $("#recom").text(result);
                  }
               });
            });
         });
</script>

</body>
</html>