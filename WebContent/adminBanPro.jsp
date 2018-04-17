<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result > 0}">
		<script type="text/javascript">
			alert("해당 회원이 정지처리 되었습니다.");
			location.href="adminBanForm.do";
		</script>
	</c:if>
	<c:if test="${result <= 0}">
		<script type="text/javascript">
			alert("회원 정지 처리에 실패하였습니다.");
			location.href="adminMainForm.do";
		</script>
	</c:if>
</body>
</html>