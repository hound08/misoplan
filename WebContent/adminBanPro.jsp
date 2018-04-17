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
			alert("정보 수정이 완료되었습니다.");
			location.href="adminMainForm.do";
		</script>
	</c:if>
	<c:if test="${result <= 0}">
		<script type="text/javascript">
			alert("정보 수정에 실패하였습니다.");
			location.href="adminMainForm.do";
		</script>
	</c:if>
</body>
</html>