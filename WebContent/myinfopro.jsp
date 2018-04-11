<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <c:if test="${result > 0 }">
   	  <%
   	  	session.setAttribute("profile_url", request.getAttribute("profile_url"));
   		session.setAttribute("nickname", request.getAttribute("nickname"));
   	  %>
      <script type="text/javascript">
         alert("회원 정보가 정상적으로 수정 되었습니다.");
         location.href = "myInfoForm.do?email=${email }";
      </script>
   </c:if>
   <c:if test="${result == 0}">
      <script type="text/javascript">
         alert("회원 정보 수정이 실패하였습니다.");
         location.href="myInfoForm.do?email=${email}"
      </script>   
   </c:if>
</body>
</html>