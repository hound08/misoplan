<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String title = request.getParameter("title");
		String f = request.getParameter("firstDate");
		String l = request.getParameter("lastDate");
		String jsonArr = request.getParameter("jsonString");
		String strDays = request.getParameter("strDays");
		out.println(title);
		out.println(f);
		out.println(l);
		out.println(jsonArr);
		out.println(strDays);
	%>
	
</body>
</html>