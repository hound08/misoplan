package service;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.BoardScheduleDao;
import dao.BoardScheduleDto;

public class BoardInsertAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int maxSize = 5 * 1024 * 1024;
		String filename = "";
		String fileSave = "/upload";
		String realPath = request.getServletContext().getRealPath(fileSave);
		MultipartRequest multi = new MultipartRequest(request, realPath,
				maxSize, "utf-8", new DefaultFileRenamePolicy());
		Enumeration en = multi.getFileNames();
		while (en.hasMoreElements()) { // 여러개의 파일을 올릴 때 이런 방식으로 사용
			String filename1 = (String) en.nextElement();
			filename = multi.getFilesystemName(filename1);
			String original = multi.getOriginalFileName(filename1);
			String type = multi.getContentType(filename1);
			File file = multi.getFile(filename1);
			System.out.println("real Path : " + realPath);
			System.out.println("파라메타 이름 : " + filename1);
			System.out.println("실제 파일 이름 : " + original);
			System.out.println("저장된 파일 이름 : " + filename);
			System.out.println("파일 타입 : " + type);
			
			if (file != null) {
				System.out.println("크기 : " + file.length() + "<br>");
			}
		}
		BoardScheduleDto dto = new BoardScheduleDto();
		dto.setTitle(multi.getParameter("title"));
		dto.setTag(multi.getParameter("tag"));
		dto.setNickname(multi.getParameter("nickname"));
		dto.setContent(multi.getParameter("content"));
		dto.setLocal_names(multi.getParameter("local"));
		
		if(multi.getFile("image_url") !=null ) {
			dto.setImage_url("/J20180403/upload/" + filename);
			
		} else {
			dto.setImage_url("/J20180403/images/no_profile_image.png");
			
		}
		try {
			BoardScheduleDao dao = BoardScheduleDao.getInstance();
			String nickname = request.getParameter("nickname");
			int result = dao.insertPlan(dto, nickname);
			
			if (result > 0) {
				request.setAttribute("result", result);
			}
		} catch (Exception e ) {
			System.out.println(e.getMessage());
		}
		return "boardPro.jsp";
	}

}
