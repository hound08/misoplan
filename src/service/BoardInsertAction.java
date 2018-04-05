package service;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.BoardScheduleDao;
import dao.BoardScheduleDto;

public class BoardInsertAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
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
		}
		BoardScheduleDto dto = new BoardScheduleDto();
		dto.setTitle(multi.getParameter("title"));
		dto.setTag(multi.getParameter("tag"));
		dto.setNickname(multi.getParameter("nickname"));
		dto.setTour_text(multi.getParameter("tour_text"));
		try {
			BoardScheduleDao dao = BoardScheduleDao.getInstance();
			int result = dao.insertPlan(dto);
			
			if (result > 0) {
				request.setAttribute("result", result);
			}
		} catch (Exception e ) {
			System.out.println(e.getMessage());
		}
		
		return "plan1.jsp";
	}

}
