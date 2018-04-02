package service;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccompanyBoardDto;
import dao.AccompanyDao;

public class writeActionAB implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8"); //encode to UTF-8
		
		String title = request.getParameter("title");
		int minimum_num = Integer.parseInt(request.getParameter("minimum_num"));
		
		String String_date = request.getParameter("closing_date");
		Date closing_date = null;
		try {
			closing_date = new SimpleDateFormat("yyyy/MM/dd").parse(String_date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		String tag = request.getParameter("tag");
		String content = request.getParameter("content");
		String image_url = request.getParameter("image_url");
		
		AccompanyBoardDto accompanyDto = new AccompanyBoardDto();
		accompanyDto.setTitle(title);
		accompanyDto.setMinimum_number(minimum_num);
		accompanyDto.setClosing_date(closing_date);
		accompanyDto.setTag(tag);
		accompanyDto.setContent(content);
		accompanyDto.setImage_url(image_url);
		accompanyDto.setView_count(0);
		accompanyDto.setVote_count(0);
		accompanyDto.setCurrent_number(1);
		accompanyDto.is_closed(true);
		
		AccompanyDao accompanyDao = AccompanyDao.getInstance();
		
		return null;
	}//writeFormAction.requestPro

}
