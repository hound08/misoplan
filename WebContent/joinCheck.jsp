<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#spanEmail {
		color: red;
		font-size: 13px;
	}
</style>
</head>
<body>
	<%
		String email = request.getParameter("email");
		MemberDao dao = MemberDao.getInstance();
		int result = dao.emailCheck(email);
	%>
	
	<c:if test="<%=result == 1 %>">
		<span id="spanEmail">※ 이미 가입된 메일 주소입니다.</span>
	</c:if>
	
	<c:if test="<%=result != 1 %>">
		<span id="spanEmail">　</span>
	</c:if>
</body>
</html>