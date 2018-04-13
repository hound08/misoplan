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
		dto.setKakao_id(request.getParameter("kakao_id"));
		dto.setMessage(request.getParameter("message"));
		dto.setNum_people(Integer.parseInt(request.getParameter("num_people")));
		String result = String.valueOf(dao.insert(dto));
		request.setAttribute(result, "result");
		
		return "viewActionAB.do?post_num="+Integer.parseInt(request.getParameter("post_num"));
	}

}
