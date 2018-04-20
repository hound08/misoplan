<%@page import="dao.AccompanyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    		int post_num = Integer.parseInt(request.getParameter("post_num"));
   			System.out.println("companionajax post_num = "+ post_num);
   			AccompanyDao dao = AccompanyDao.getInstance();
   			 
   			int result = dao.closeApplication(post_num);
   			/* out.print(result); */
    %>