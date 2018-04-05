package service;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.Session;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sun.org.apache.bcel.internal.generic.MULTIANEWARRAY;
import com.sun.org.apache.xpath.internal.operations.Mult;

import dao.BoardScheduleDao;
import dao.BoardScheduleDto;

public class BoardSelectAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			try {
				String email = request.getParameter("email");
				BoardScheduleDao dao = BoardScheduleDao.getInstance();
				List<BoardScheduleDto> list = dao.selectList(email);
				
				if (list == null) {
					request.setAttribute("list", list);
					return "BoardError.jsp";
			
				} else {
					request.setAttribute("list", list);
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			
			-------확인버턴
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
			try {
				BoardScheduleDao dao = BoardScheduleDao.getInstance();
				int result = dao.insertPlan(dto);
				
				if (result > 0) {
					request.setAttribute("result", result);
				}
			} catch (Exception e ) {
				System.out.println(e.getMessage());
			}
			
			return "planSelect.jsp";
		}
		
	}


