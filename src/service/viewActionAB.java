package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccompanyBoardDto;
import dao.AccompanyDao;

public class viewActionAB implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		AccompanyDao accompanyDao = AccompanyDao.getInstance();

		int post_num = Integer.parseInt(request.getParameter("post_num"));
		accompanyDao.view_count(post_num);
		AccompanyBoardDto board = accompanyDao.select(post_num);
		
		request.setAttribute("post_num", post_num);
		request.setAttribute("board", board);
		request.setAttribute("tag", board.getTag());
		
		return "accompanyBoardView.jsp";
	}

}
