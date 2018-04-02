<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.SigunParser"%>
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
		String areaCode = request.getParameter("areaCode");
		System.out.println(areaCode);

		SigunParser sigunParser = new SigunParser();
		ArrayList<HashMap<String, String>> sigunList = sigunParser.getSigun(areaCode);
		for(int i = 0; i < sigunList.size(); i++){
			HashMap<String, String> sigunMap = sigunList.get(i);
			out.print(sigunMap.get("code"));
			out.println(sigunMap.get("name"));
		}
	%>
</body>
</html>