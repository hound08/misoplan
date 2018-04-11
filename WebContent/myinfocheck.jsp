<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String nickname = request.getParameter("nickname");
		MemberDao dao = MemberDao.getInstance();
		int result = dao.nicknameCheck(nickname);
		
		if (result > 0) {
			out.println("이미 사용중인 별명입니다.");
		}
	%>
</body>
</html>