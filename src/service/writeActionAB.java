package service;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.AccompanyBoardDto;
import dao.AccompanyDao;

public class writeActionAB implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8"); //encode to UTF-8
		
		HttpSession session = request.getSession();
		
		int maxSize = 5 * 1024 * 1024;
		String filename = "";
		String fileSave = "/upload";
		String realPath = request.getServletContext().getRealPath(fileSave);
		MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
		Enumeration en = multi.getFileNames();
		
		File file = null;
		while (en.hasMoreElements()) {	// 여러개의 파일을 올릴 때 이런 방식으로 사용
			String filename1 = (String)en.nextElement();
			filename = multi.getFilesystemName(filename1);
			String original = multi.getOriginalFileName(filename1);
			String type = multi.getContentType(filename1);
			file = multi.getFile(filename1);
			System.out.println("real Path : " + realPath);
			System.out.println("파라미터 이름 : " + filename1);
			System.out.println("실제 파일 이름 : " + original);
			System.out.println("저장된 파일 이름 : " + filename);
			System.out.println("파일 타입 : " + type);
			
			if (file != null) {
				System.out.println("크기 : " + file.length() + "<br>");
			}
		}
		
		String String_date = multi.getParameter("closing_date");
		java.sql.Date closing_date = java.sql.Date.valueOf(String_date);
		System.out.println(closing_date);
		AccompanyBoardDto accompanyDto = new AccompanyBoardDto();
		accompanyDto.setEmail(String.valueOf(session.getAttribute("email")));
		accompanyDto.setNickname(String.valueOf(session.getAttribute("nickname")));
		accompanyDto.setTitle(multi.getParameter("title"));
		accompanyDto.setClosing_date(closing_date);
		accompanyDto.setTag(multi.getParameter("tag"));
		accompanyDto.setSl_code(multi.getParameter("plan-radio"));
		accompanyDto.setContent(multi.getParameter("content"));
		if(multi.getFile("image") != null)
			accompanyDto.setImage_url("/J20180403/upload/" + filename);
		else
			accompanyDto.setImage_url("/J20180403/upload/default-image.png");
		
		accompanyDto.setMinimum_num(Integer.parseInt(multi.getParameter("minimum_num")));
		
		AccompanyDao accompanyDao = AccompanyDao.getInstance();
		int result = accompanyDao.insert(accompanyDto);
        request.setAttribute("result", result);
        request.setAttribute("tag", accompanyDto.getTag());
		
		return "writeConfirm.jsp";
	}//writeFormAction.requestPro

}
