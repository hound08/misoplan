package service;

import java.io.IOException;
import java.net.InetAddress;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AccompanyBoardDto;
import dao.AccompanyDao;
import dao.VoteConfirmDao;
import dao.VoteConfirmDto;

public class likeActionAB implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
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
		if(result == 0) {
			voteConfirmDao.insert(voteConfirmDto);
			dao.vote_up(post_num);
		}
		else {
			voteConfirmDao.delete(voteConfirmDto);
			dao.vote_down(post_num);
		}
		request.setAttribute("post_num", post_num);
		return "accompanyViewConfirm.jsp";
	}

}
