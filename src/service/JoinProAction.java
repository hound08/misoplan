package service;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.MemberDao;
import dao.MemberDto;

public class JoinProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 사진 업로드 관련 코드
		request.setCharacterEncoding("utf-8");
		int maxSize = 5 * 1024 * 1024;
		String filename = "";
		String fileSave = "/upload";
		String realPath = request.getServletContext().getRealPath(fileSave);
		MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
		Enumeration en = multi.getFileNames();
		
		while (en.hasMoreElements()) {	// 여러개의 파일을 올릴 때 이런 방식으로 사용
			String filename1 = (String)en.nextElement();
			filename = multi.getFilesystemName(filename1);
			String original = multi.getOriginalFileName(filename1);
			String type = multi.getContentType(filename1);
			File file = multi.getFile(filename1);
		}
		
		// 회원 정보 관련 코드
		MemberDto dto = new MemberDto();
		dto.setEmail(multi.getParameter("email"));
		dto.setNickname(multi.getParameter("nickname"));
		dto.setPassword(multi.getParameter("password"));
		dto.setPhone(multi.getParameter("phone"));
		dto.setProfile_url("/J20180403/upload/" + filename);
		
		try {
			MemberDao dao = MemberDao.getInstance();
			int result = dao.insertMember(dto);
			
			if (result > 0) {
				request.setAttribute("result", result);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "main.do";
	}

}
