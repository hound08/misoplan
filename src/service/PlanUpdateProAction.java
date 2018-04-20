package service;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.BoardScheduleDao;
import dao.BoardScheduleDto;

public class PlanUpdateProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			System.out.println("PlanUpdateProAction");
			request.setCharacterEncoding("utf-8");
			BoardScheduleDto dto = new BoardScheduleDto();
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
			int bs_num = Integer.parseInt(request.getParameter("bs_num"));
			dto.setBs_num(Integer.parseInt(request.getParameter("bs_num")));
			dto.setTitle(multi.getParameter("title"));
			dto.setTag(multi.getParameter("tag"));
			dto.setImage_url(multi.getParameter("image"));
			dto.setContent(multi.getParameter("content"));
			
			System.out.println("@@@@@ bsnum " + dto.getBs_num());
			System.out.println("@@@@@ title " + dto.getTitle());
			System.out.println("@@@@@ setTag " + dto.getTag());
			System.out.println("@@@@@ setImage " + dto.getImage_url());
			System.out.println("@@@@@ setContent " + dto.getContent());
			
			if(multi.getFile("image") !=null ) {
				dto.setImage_url("/J20180403/upload/" + filename);
				request.setAttribute("image", "/J20180403/upload/" + filename);
			} else {
				BoardScheduleDao dao = BoardScheduleDao.getInstance();
				BoardScheduleDto dto1;
				try {
					dto1 = dao.selectUp(bs_num);
					dto.setImage_url(dto1.getImage_url());
					request.setAttribute("image", dto.getImage_url());
					
				}catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			BoardScheduleDao dao = BoardScheduleDao.getInstance();
			int result = dao.update(dto);
			request.setAttribute("bs_num", dto.getBs_num());
			request.setAttribute("result", result);
		
				}
			} catch (Exception e ) {
			System.out.println();
		}
		
		return "planupdatePro.jsp";
	}
}


