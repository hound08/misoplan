package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AccompanyDao;
import dao.AccompanyReplyDao;
import dao.AccompanyReplyDto;

public class writeReplyActionAB implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8"); //encode to UTF-8
		HttpSession session = request.getSession();
		AccompanyReplyDao dao = AccompanyReplyDao.getInstance();
		AccompanyReplyDto dto = new AccompanyReplyDto();
		AccompanyDao accompanyDao = AccompanyDao.getInstance();
		
		int post_num = Integer.parseInt(request.getParameter("post_num"));
		dto.setProfile_url(accompanyDao.get_profile_url(post_num));
		dto.setPost_num(post_num);
		dto.setEmail((String)session.getAttribute("email"));
		dto.setNickname((String)session.getAttribute("nickname"));
		dto.setContent(request.getParameter("content"));
		accompanyDao.comment_count(post_num);
		dao.insert(dto);
		
		return "viewActionAB.do?post_num="+request.getParameter("post_num");
	}

}
