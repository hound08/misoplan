package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AccompanyBoardDto;
import dao.AccompanyDao;
import dao.AccompanyReplyDao;
import dao.AccompanyReplyDto;

public class viewActionAB implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8"); //encode to UTF-8

		HttpSession session = request.getSession();
		AccompanyDao accompanyDao = AccompanyDao.getInstance();
		AccompanyReplyDao accompanyReplyDao = AccompanyReplyDao.getInstance();

		int post_num = Integer.parseInt(request.getParameter("post_num"));
		accompanyDao.view_count(post_num);
		List<AccompanyReplyDto> list = accompanyReplyDao.list(post_num);
		
		AccompanyBoardDto board = accompanyDao.select(post_num);
		String profile_url = accompanyDao.get_profile_url(post_num);
		request.setAttribute("post_num", post_num);
		request.setAttribute("board", board);
		request.setAttribute("tag", board.getTag());
		request.setAttribute("profile_url", profile_url);
		request.setAttribute("list", list);
		return "accompanyBoardView.jsp";
	}

}
