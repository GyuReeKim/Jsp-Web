<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="header.jsp" flush="false"/>
</head>
<body>
	<%
		session.invalidate();
	%>
	<!-- logoutAction.jsp페이지에 접근한 회원은 session을 빼앗긴다. -->
	<script>
		location.href = 'main.jsp';
	</script>
</body>
</html>