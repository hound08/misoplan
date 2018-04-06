<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.spanResult {
		color: red;
		font-size: 13px;
	}
</style>
</head>
<body>
	<%
		String email = request.getParameter("email");
		String nickname = request.getParameter("nickname");
		MemberDao dao = MemberDao.getInstance();
		int resultEmail = 0;
		int resultNickname = 0;
		
		if (email != null) {
			resultEmail = dao.emailCheck(email);
		} else if (nickname != null) {
			resultNickname = dao.nicknameCheck(nickname);
		}
	%>
	
	<c:if test="<%=resultEmail == 1 %>">
		<span class="spanResult">※ 이미 가입된 메일 주소입니다.</span>
	</c:if>
	<c:if test="<%=resultEmail != 1 %>">
		<span class="spanResult">　</span>
	</c:if>
	
	<c:if test="<%=resultNickname == 1 %>">
		<span class="spanResult">※ 이미 사용중인 별명입니다.</span>
	</c:if>
	<c:if test="<%=resultNickname != 1 %>">
		<span class="spanResult">　</span>
	</c:if>
</body>
</html>