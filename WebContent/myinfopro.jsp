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
   	  <!-- MyInfoProAction.java에서 request에 저장한 이미지 주소를 session에 저장 (헤더에 적용하기 위해서) -->
   	  <% session.setAttribute("profile_url", request.getAttribute("profile_url")); %>
      <script type="text/javascript">
         alert("수정 성공");
         location.href = "myInfoForm.do?email=${email }";
      </script>
   </c:if>
   <c:if test="${result == 0}">
      <script type="text/javascript">
         alert("수정 실패");
         location.href="myInfoForm.do?email=${email}"
      </script>   
   </c:if>
</body>
</html>