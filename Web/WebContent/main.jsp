<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/layout.css">
<link rel="stylesheet" href="css/main.css">
<jsp:include page="header.jsp" flush="false"/>
</head>
<body>
	<jsp:include page="top.jsp" flush="false"/>
	
	<div class="layout-container">
		<div class="main-container">
			<div class="main-info">
				<h3>JSP를 이용한 웹 페이지 만들기!</h3>
				<p>Create, Read, Update, Delete 기능을 구현한 웹 페이지를 만들어 보았다.</p>
			</div>
			<img class="main-image" src="images/1.png">
		</div>
	</div>
</body>
</html>