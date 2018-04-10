<%@page import="dao.MemberDao"%>
<%@page import="email.EmailConfirm"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>새 비밀번호 발송</title>
</head>
<body>
	<%
		String email = request.getParameter("email");

		EmailConfirm confirm = new EmailConfirm();
		String password = confirm.connectEmail(email, 1);
		out.println("authNum:" + password);
		
		MemberDao dao = MemberDao.getInstance();
		int result = dao.updatePassword(email, password);
		
		if (result <= 0) {	%>
			<script type="text/javascript">
				alert("비밀번호 변경에 실패하였습니다.");
			</script>	<%
		}
	%>
</body>
</html>