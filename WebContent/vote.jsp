<%@page import="java.net.InetAddress"%>
<%@page import="dao.VotePlanDto"%>
<%@page import="dao.VotePlanDao"%>
<%@page import="dao.BoardScheduleDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	BoardScheduleDao dao = BoardScheduleDao.getInstance();
	VotePlanDao vdao = VotePlanDao.getInstance();
	VotePlanDto vdto = new VotePlanDto();
	
	int bs_num = Integer.parseInt(request.getParameter("bs_num"));
	String email = (String) session.getAttribute("email");
	if(email != null) vdto.setEmail(email);
	if(email == null) vdto.setEmail("null");
	
	vdto.setIp_addr(String.valueOf(InetAddress.getLocalHost()));
	vdto.setBs_num(bs_num);
	
	int result = vdao.check(vdto);
	if(result ==0) {
		vdao.insert(vdto);
		dao.vote_count(bs_num);
		
	} else {
		vdao.delete(vdto);
		dao.vote_down(bs_num);
	}
	int vote_count = dao.getTotalVote(bs_num);
	out.print(vote_count+"명이 좋아해요!!");
%>
