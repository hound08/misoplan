<%@page import="email.EmailConfirm"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 인증</title>
</head>
<body>
	<%
		String email = request.getParameter("email");

		EmailConfirm confirm = new EmailConfirm();
		String authNum = confirm.connectEmail(email, 0);
		out.println("authNum:" + authNum);
	%>
</body>
</html>