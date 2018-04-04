package service;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.awt.image.renderable.ParameterBlock;
import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.media.jai.JAI;
import javax.media.jai.RenderedOp;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.MemberDao;
import dao.MemberDto;

public class MyInfoProAction implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
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
				System.out.println("real Path : " + realPath);
				System.out.println("파라메타 이름 : " + filename1);
				System.out.println("실제 파일 이름 : " + original);
				System.out.println("저장된 파일 이름 : " + filename);
				System.out.println("파일 타입 : " + type);
				
				if (file != null) {
					System.out.println("크기 : " + file.length() + "<br>");
				}
			}
			request.setCharacterEncoding("UTF-8");
			MemberDto memberdto = new MemberDto();
			String email = request.getParameter("email");
			System.out.println("@@@@@@@@@@@ email = "+ email);
			
			memberdto.setEmail(multi.getParameter("email"));
			memberdto.setNickname(multi.getParameter("Nickname"));	
			memberdto.setPassword(multi.getParameter("password"));
			memberdto.setPhone(multi.getParameter("phone"));
			System.out.println("phone : " + multi.getParameter("phone"));
			memberdto.setProfile_url(multi.getParameter("profile_url"));
			System.out.println("aa : "+ multi.getParameter("Profile_url"));
			MemberDao memberdao = MemberDao.getInstance();
			int result = memberdao.update(memberdto);
			request.setAttribute("result", result);
			request.setAttribute("email", email);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "myinfopro.jsp";
	}
}
