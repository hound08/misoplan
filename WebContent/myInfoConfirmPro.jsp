<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int result = (int)request.getAttribute("result");
		String email = (String)session.getAttribute("email");
	%>
	
	<c:if test="<%=result > 0 %>">
		<script type="text/javascript">
			location.href="myInfoForm.do?email=${email}";
		</script>
	</c:if>
	<c:if test="<%=result <= 0 %>">
		<script type="text/javascript">
			alert("비밀번호가 일치하지 않습니다.");
			location.href="myInfoConfirmForm.do";
		</script>
	</c:if>
</body>
</html>