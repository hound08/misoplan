package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AccompanyBoardDto;
import dao.AccompanyDao;

public class viewActionAB implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		AccompanyDao accompanyDao = AccompanyDao.getInstance();

		int post_num = Integer.parseInt(request.getParameter("post_num"));
		accompanyDao.view_count(post_num);
		AccompanyBoardDto board = accompanyDao.select(post_num);
		String profile_url = accompanyDao.get_profile_url(post_num);
		request.setAttribute("post_num", post_num);
		request.setAttribute("board", board);
		request.setAttribute("tag", board.getTag());
		request.setAttribute("profile_url", profile_url);
		return "accompanyBoardView.jsp";
	}

}
