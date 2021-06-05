<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/layout.css">
<link rel="stylesheet" href="css/nav.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		User user = new UserDAO().getUser(userID);
	%>
	<nav class="navbar">
		<div class="navbar-logo">
			<i class="fas fa-seedling"></i>
			<a class="navbar-text" href="main.jsp">코린이의 새싹 웹 사이트</a>
		</div>
		
		<%
			if(userID != null) {
		%>
		
		<div class="navbar-user"><span class="navbar-text"><span><%= user.getUserName() %></span> 님 안녕하세요!</span></div>
		
		<%
			}
		%>
		<div class="navbar-menu">
			<a href="board.jsp"><span class="navbar-text">게시판</span></a>
			<%
				if(userID == null) {
			%>
			<a class="navbar-text" href="login.jsp"><span>로그인</span></a>
			<a class="navbar-text" href="join.jsp"><span>회원가입</span></a>
			<%
				} else {
			%>
			<a class="navbar-text" href="logoutAction.jsp"><span>로그아웃</span></a>
			<%
				}
			%>
		</div>
	</nav>
</body>
</html>