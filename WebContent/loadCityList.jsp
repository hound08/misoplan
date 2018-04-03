<%@page import="org.json.simple.JSONObject"%>
<%@page import="jdk.nashorn.internal.ir.debug.JSONWriter"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.SigunParser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
		String areaCode = request.getParameter("areaCode");
		SigunParser sigunParser = new SigunParser();	
		ArrayList<HashMap<String, String>> sigunList = sigunParser.getSigun(areaCode);
		JSONObject obj = new JSONObject();
		for(int i =0; i < sigunList.size(); i++){
			HashMap<String, String> sigunMap = sigunList.get(i);
			obj.put(sigunMap.get("code"), sigunMap.get("name"));
		}
		out.print(obj);	
	%>
