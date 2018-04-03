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
		MemberDto dto = new MemberDto();
		dto.setEmail(request.getParameter("email"));
		
		// 사진 업로드 관련 코드
		request.setCharacterEncoding("utf-8");
		int maxSize = 5 * 1024 * 1024;
		String fileSave = "/upload";
		String realPath = request.getServletContext().getRealPath(fileSave);
		MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
		Enumeration en = multi.getFileNames();
		
		while (en.hasMoreElements()) {	// 여러개의 파일을 올릴 때 이런 방식으로 사용
			String filename1 = (String)en.nextElement();
			String filename = multi.getFilesystemName(filename1);
			String original = multi.getOriginalFileName(filename1);
			String type = multi.getContentType(filename1);
			File file = multi.getFile(filename1);
			System.out.println("real Path : " + realPath + "<br>");
			System.out.println("파라메타 이름 : " + filename1 + "<br>");
			System.out.println("실제 파일 이름 : " + original + "<br>");
			System.out.println("저장된 파일 이름 : " + filename + "<br>");
			System.out.println("파일 타입 : " + type + "<br>");
			
			if (file != null) {
				System.out.println("크기 : " + file.length() + "<br>");
			}
		}
		
		return "main.do";
	}

}
