<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<div class="form-container">
			<h3>로그인</h3>
			<form method="post" action="loginAction.jsp">
				<input class="input-form" type="text" id="userID" name="userID" placeholder="아이디" maxlength="20">
				<input class="input-form" type="password" id="userPassword" name="userPassword" placeholder="비밀번호" maxlength="20">
				<input class="input-form-submit" type="submit" value="로그인">
			</form>
		</div>
	</div>
</body>
</html>