<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="dao.ApplicantsDto"%>
<%@page import="dao.ApplicantsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
	
	int post_num = Integer.parseInt(request.getParameter("post_num"));
//	int post_num = 1;
	ApplicantsDao appdao = ApplicantsDao.getInstance();
	
		
	
	
	List<ApplicantsDto> applist = appdao.youappselect(post_num);
	
	JSONObject json= new JSONObject();
	JSONArray jsonArray = new JSONArray();
	
	 for(int i=0;i < applist.size() ; i++){
		 JSONObject obj = new JSONObject();
		 obj.put("message", applist.get(i).getMessage());
		 obj.put("nickname", applist.get(i).getNickname());
		 obj.put("status", applist.get(i).getStatus());
		 String dateString = "" + applist.get(i).getApplicants_date();
		 obj.put("applicants_date", dateString);
		 obj.put("kakao_id", applist.get(i).getKakao_id());
		 obj.put("num_people", applist.get(i).getNum_people());
		 obj.put("post_num", applist.get(i).getPost_num());
		 obj.put("is_closed", applist.get(i).getIs_closed());
		 jsonArray.add(obj);
		 System.out.println("ajax jsonArray = "+ jsonArray);
	 }
	 out.print(jsonArray);
	%>


