<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<!-- 만든 class를 가져옴 -->
<%@ page import="java.io.PrintWriter" %>
<!-- JavaScript 문장을 작성하기 위해 가져옴 -->
<% request.setCharacterEncoding("UTF-8"); %>
<!-- 건너오는 모든 데이터를 UTF-8로 받을 수 있도록 한다. -->
<jsp:useBean id="user" class="user.User" scope="page" />
<!-- 현재 페이지에서만 빈즈를 사용함 -->
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="header.jsp" flush="false"/>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		// 이미 로그인 된 사람은 회원가입을 할 수 없다.
		
		if (user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else {
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(user);
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 ID입니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else {
				session.setAttribute("userID", user.getUserID());
				// 회원가입 성공했을 때 session 부여한 후 메인 페이지로 이동
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>