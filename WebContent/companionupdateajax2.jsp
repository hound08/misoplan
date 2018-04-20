<%@page import="dao.ApplicantsDao"%>
<%@page import="dao.AccompanyBoardDto"%>
<%@page import="dao.ApplicantsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    int post_num = Integer.parseInt(request.getParameter("postnum"));
	String nickname = request.getParameter("nickname");
	int status = Integer.parseInt(request.getParameter("status"));
	int num_people = Integer.parseInt(request.getParameter("num_people"));
    
	ApplicantsDto appdto = new ApplicantsDto();
	
	appdto.setStatus(Integer.parseInt(request.getParameter("status")));
	appdto.setPost_num(post_num);
	appdto.setNickname(nickname);
	appdto.setNum_people(num_people);
		
	System.out.println("ajax :"+ num_people);
	System.out.println("ajax :"+ post_num);
	System.out.println("ajax :"+ nickname); 
	System.out.println("ajax :"+ Integer.parseInt(request.getParameter("status"))); 
	
	ApplicantsDao appdao = ApplicantsDao.getInstance();	  
	int result = appdao.noupdate(appdto);
    %>
    