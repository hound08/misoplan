package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccompanyDao;

public class CloseActionAB implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int post_num = Integer.parseInt((String)request.getParameter("post_num"));
		AccompanyDao dao = AccompanyDao.getInstance();
		int result = dao.closeApplication(post_num);
	
		return "listAction.do";
	}

}
