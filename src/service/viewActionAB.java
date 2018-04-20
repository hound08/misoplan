package service;

import java.io.IOException;
import java.net.InetAddress;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AccompanyBoardDto;
import dao.AccompanyDao;
import dao.AccompanyReplyDao;
import dao.AccompanyReplyDto;
import dao.ScheduleDao;
import dao.VoteConfirmDao;
import dao.VoteConfirmDto;
import dao.myPlanABDto;

public class viewActionAB implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8"); //encode to UTF-8

		HttpSession session = request.getSession();
		AccompanyDao accompanyDao = AccompanyDao.getInstance();
		VoteConfirmDao voteConfirmDao = VoteConfirmDao.getInstance();
		VoteConfirmDto voteConfirmDto = new VoteConfirmDto();
		AccompanyReplyDao accompanyReplyDao = AccompanyReplyDao.getInstance();
		
		int post_num = Integer.parseInt(request.getParameter("post_num"));
		
		voteConfirmDto.setEmail((String)session.getAttribute("email"));
		voteConfirmDto.setIp_addr(String.valueOf(InetAddress.getLocalHost()));
		voteConfirmDto.setPost_num(post_num);
		int result = voteConfirmDao.check(voteConfirmDto);
		
		accompanyDao.view_count(post_num);
		List<AccompanyReplyDto> list = accompanyReplyDao.list(post_num);
		AccompanyBoardDto board = accompanyDao.select(post_num);
		ScheduleDao sdao = ScheduleDao.getInstance();
		request.setAttribute("planList", sdao.selectPlan(board.getSl_code()));
		String profile_url_writer = accompanyDao.get_profile_url(post_num);
		String profile_url_my = (String) session.getAttribute("profile_url");
		request.setAttribute("email", session.getAttribute("email"));
		request.setAttribute("nickname", session.getAttribute("nickname"));
		request.setAttribute("post_num", post_num);
		request.setAttribute("board", board);
		request.setAttribute("tag", board.getTag());
		request.setAttribute("profile_url_my", profile_url_my);
		request.setAttribute("profile_url_writer", profile_url_writer);
		request.setAttribute("list", list);
		request.setAttribute("result", result);
		
		
		
		return "accompanyBoardView.jsp";
	}

}
