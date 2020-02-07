<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="container" align="center">
	<ul class="pagination">
		<li>
			<c:if test="${(to.curPage)-(to.curPage%10==0?10:to.curPage%10) > 9 }">
				<a href="board_list.do?curPage=${(to.curPage)-(to.curPage%10==0?10:to.curPage%10)}">
					<span class="glyphicon glyphicon-backward"></span>
				</a>
			</c:if>
		</li>
		<li>
			<c:if test="${to.curPage-1 > 1 }">
				<a href="board_list.do?curPage=${to.curPage-1}">
					<span class="glyphicon glyphicon-chevron-left"></span>
				</a>
			</c:if>
		</li>
		<c:forEach var="i" begin="${to.beginPageNum}" end="${to.stopPageNum}">
			<c:choose>
				<c:when test="${to.curPage == i}">
					<li class="active"><a href="board_list.do?curPage=${i}">${i}</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="board_list.do?curPage=${i}">${i}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<li>
			<c:if test="${to.curPage < to.totalPage }">
				<a href="board_list.do?curPage=${to.curPage+1}">
					<span class="glyphicon glyphicon-chevron-right">
				</a>
			</c:if> 
			<c:if test="${(to.curPage+10)-(to.curPage%10==0?10:to.curPage%10) < to.totalPage }">
				<a href="board_list.do?curPage=${(to.curPage+10)-(to.curPage%10==0?10:to.curPage%10)+1}">
					<span class="glyphicon glyphicon-forward"></span>
				</a>
			</c:if>
		</li>
	</ul>
</div>