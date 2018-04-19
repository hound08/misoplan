<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="dao.ApplicantsDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.ApplicantsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%	
    	String email = (String) session.getAttribute("email");
    	int post_num = Integer.parseInt(request.getParameter("post_num"));
    	System.out.println("ajax2 email = "+ email);
    	System.out.println("ajax2 post_num = "+ post_num);
    	
    	ApplicantsDao appdao = ApplicantsDao.getInstance();
    	List<ApplicantsDto> applist = appdao.statusselect(post_num);
    	
    	JSONObject json= new JSONObject();
    	JSONArray jsonArray = new JSONArray();
    	
    	for(int i=0; i < applist.size(); i++){
    		JSONObject obj = new JSONObject();
    		obj.put("profile_url", applist.get(i).getProfile_url());
    		obj.put("nickname", applist.get(i).getNickname());
    		obj.put("kakao_id", applist.get(i).getKakao_id());
    		jsonArray.add(obj);    		
    		System.out.println("ajax2 jsonArray = "+ jsonArray);
    	}
    	out.print(jsonArray);
    %>