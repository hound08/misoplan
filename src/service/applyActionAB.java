package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AccompanyApplicantsDao;
import dao.AccompanyApplicantsDto;

public class applyActionAB implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8"); //encode to UTF-8
		HttpSession session = request.getSession();
		AccompanyApplicantsDao dao = AccompanyApplicantsDao.getInstance();
		AccompanyApplicantsDto dto = new AccompanyApplicantsDto();
		dto.setPost_num(Integer.parseInt(request.getParameter("post_num")));
		dto.setEmail((String)session.getAttribute("email"));
		dto.setNickname((String)session.getAttribute("nickname"));
		
		
		return null;
	}

}
