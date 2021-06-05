<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.Board" %>
<%@ page import="java.util.ArrayList" %>
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
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	<div class="layout-container">
		<h3>게시판</h3>
		<table class="board-table">
			<thead>
				<tr>
					<th class="board-table-shell" colspan="2">제목</th>
					<th class="board-table-shell">작성자</th>
					<th class="board-table-shell">작성일</th>
				</tr>
			</thead>
			<tbody>
				<%
					BoardDAO boardDAO = new BoardDAO();
					ArrayList<Board> list = boardDAO.getList(pageNumber);
					for(int i = 0; i < list.size(); i++) {
				%>
				<tr>
					<td class="board-table-shell" align="center" width="5%"><%= list.get(i).getBoardID() %></td>
					<td class="board-table-shell">
						<div class="board-title">
							<a class="board-title-text" href="view.jsp?boardID=<%= list.get(i).getBoardID() %>">
								<%= list.get(i).getBoardTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %>
							</a>
						</div>
					</td>
					<td class="board-table-shell" align="center" width="10%"><%= list.get(i).getUserID() %></td>
					<td class="board-table-shell" align="center" width="25%"><%= list.get(i).getBoardDate().substring(0, 11) + list.get(i).getBoardDate().substring(11, 13) + ":" + list.get(i).getBoardDate().substring(14, 16) %></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		
		<div class="button-page">
			<%
				if(pageNumber != 1) {
			%>
			<a class="button-style-previous" href="board.jsp?pageNumber=<%=pageNumber - 1%>">이전</a>
			<%
				} if(boardDAO.nextPage(pageNumber + 1)) {
			%>
			<a class="button-style-next" href="board.jsp?pageNumber=<%=pageNumber + 1%>">다음</a>
			<%
				}
			%>
		</div>
		
		<%
			if(userID != null) {
		
		%>
		<div class="button-write">
			<a class="button-style-write" href="write.jsp">글쓰기</a>
		</div>
		<%
			}
		%>
	</div>
</body>
</html>