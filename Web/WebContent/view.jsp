<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.Board" %>
<%@ page import="board.BoardDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/layout.css">
<link rel="stylesheet" href="css/board.css">
<jsp:include page="header.jsp" flush="false"/>
</head>
<body>
	<jsp:include page="top.jsp" flush="false"/>
	
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int boardID = 0;
		if (request.getParameter("boardID") != null) {
			boardID = Integer.parseInt(request.getParameter("boardID"));
		}
		if (boardID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		Board board = new BoardDAO().getBoard(boardID);
	%>
	
	<div class="layout-container">
		<h3><span class="go-board" onclick="location.href='board.jsp'">게시판 &gt;</span></h3>
		<table class="view-table">
			<thead>
				<tr>
					<th class="view-table-shell" colspan="7" align="left"><%= board.getBoardTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="view-table-shell"></td>
					<td class="view-table-shell" align="right" width="10%"><%= board.getUserID() %></td>
					<td class="view-table-shell" align="right" width="20%"><%= board.getBoardDate().substring(0, 11) + board.getBoardDate().substring(11, 13) + ":" + board.getBoardDate().substring(14, 16) %></td>
				</tr>
				<tr>
					<!-- 특수문자 처리 & 보안 문제 해결 -->
					<td class="view-table-content" colspan="7"><%= board.getBoardContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
				</tr>
			</tbody>
		</table>
		<div class="button-write">
			<%
				if(userID != null && userID.equals(board.getUserID())) {
			%>
			<a class="button-style-update" href="update.jsp?boardID=<%= boardID %>">수정</a>
			<a class="button-style-delete" onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?boardID=<%= boardID %>">삭제</a>
			<%
				}
			%>
			<a class="button-style-write" href="board.jsp">목록</a>
		</div>
	</div>
	
</body>
</html>