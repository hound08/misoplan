package service;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AccompanyBoardDto;
import dao.AccompanyDao;

public class writeActionAB implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8"); //encode to UTF-8
		
		HttpSession session = request.getSession();
		String email = String.valueOf(session.getAttribute("email"));
		
		String title = request.getParameter("title");
		int minimum_num = Integer.parseInt(request.getParameter("minimum_num"));
		
		String String_date = request.getParameter("closing_date");
		Date util_date = null;
		try {
			util_date = new SimpleDateFormat("yyyy/MM/dd").parse(String_date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		java.sql.Date closing_date = new java.sql.Date(util_date.getDate());
		
		String tag = request.getParameter("tag");
		String content = request.getParameter("content");
		String image_url = request.getParameter("image_url");
		
		AccompanyBoardDto accompanyDto = new AccompanyBoardDto();
		accompanyDto.setEmail(email);
		accompanyDto.setTitle(title);
		accompanyDto.setClosing_date(closing_date);
		accompanyDto.setTag(tag);
		accompanyDto.setContent(content);
		accompanyDto.setImage_url(image_url);
		accompanyDto.setMinimum_number(minimum_num);

		AccompanyDao accompanyDao = AccompanyDao.getInstance();
		int result = accompanyDao.insert(accompanyDto);
		
		return "writeFormAB2.jsp";
	}//writeFormAction.requestPro

}
