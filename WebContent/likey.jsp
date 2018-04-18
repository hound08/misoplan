<%@page import="dao.VoteConfirmDto"%>
<%@page import="java.net.InetAddress"%>
<%@page import="dao.AccompanyDao"%>
<%@page import="dao.VoteConfirmDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%
			AccompanyDao dao = AccompanyDao.getInstance();
			VoteConfirmDao voteConfirmDao = VoteConfirmDao.getInstance();
			VoteConfirmDto voteConfirmDto = new VoteConfirmDto();
			
			int post_num = Integer.parseInt(request.getParameter("post_num"));
			String email = (String) session.getAttribute("email");
			if(email != null)
				voteConfirmDto.setEmail(email);
			if(email == null)
				voteConfirmDto.setEmail("null");
			voteConfirmDto.setIp_addr(String.valueOf(InetAddress.getLocalHost()));
			voteConfirmDto.setPost_num(post_num);
			
			int result = voteConfirmDao.check(voteConfirmDto);
			System.out.println("result = " + result);
			if(result == 0) {
				voteConfirmDao.insert(voteConfirmDto);
				dao.vote_up(post_num);
			}
			else {
				voteConfirmDao.delete(voteConfirmDto);
				dao.vote_down(post_num);
			}
			int vote_count = dao.getTotalVote(post_num);
			out.print(vote_count+"명이 좋아해요");
	%>