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
<link rel="stylesheet" href="css/form.css">
<jsp:include page="header.jsp" flush="false"/>
</head>
<body>
	<jsp:include page="top.jsp" flush="false"/>
	
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
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
		if (!userID.equals(board.getUserID())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
	%>
	
	<div class="layout-container">
		<h3>글 수정하기</h3>
		<form method="post" action ="updateAction.jsp?boardID=<%= boardID %>">
			<input class="write-form" type="text" placeholder="글 제목" name="boardTitle" maxlength="50" value="<%= board.getBoardTitle() %>">
			<textarea class="write-form-content" placeholder="글 내용" name="boardContent" maxlength="2048"><%= board.getBoardContent() %></textarea>
			<input class="write-form-submit" type="submit" value="수정하기">
		</form>
	</div>
</body>
</html>