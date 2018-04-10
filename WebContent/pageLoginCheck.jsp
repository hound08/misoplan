<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 체크</title>
</head>
<body>
	<%
		String email = (String)session.getAttribute("email");
	
		if (email == null || email.equals("")) {
			response.sendRedirect("loginForm.do");
		}
	%>
</body>
</html>