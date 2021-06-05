<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
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
	
	<div class="layout-container">
		<h3>글쓰기</h3>
		<form method="post" action ="writeAction.jsp">
			<input class="write-form" type="text" placeholder="글 제목" name="boardTitle" maxlength="50">
			<textarea class="write-form-content" placeholder="글 내용" name="boardContent" maxlength="2048"></textarea>
			<input class="write-form-submit" type="submit" value="글쓰기">
		</form>
	</div>
</body>
</html>