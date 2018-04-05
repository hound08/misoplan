package service;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.awt.image.renderable.ParameterBlock;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
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
			// 사진 업로드 관련 코드
			request.setCharacterEncoding("utf-8");
			
			int maxSize = 5 * 1024 * 1024;
			String filename = "";
			String fileSave = "/upload";
			String realPath = request.getServletContext().getRealPath(fileSave);
			MultipartRequest multi = new MultipartRequest(request, realPath , maxSize, "utf-8", new DefaultFileRenamePolicy());
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
			String email = multi.getParameter("email");
			
			memberdto.setEmail(multi.getParameter("email"));
			memberdto.setNickname(multi.getParameter("Nickname"));	
			memberdto.setPassword(multi.getParameter("password"));
			memberdto.setPhone(multi.getParameter("phone"));
			System.out.println("phone : " + multi.getParameter("phone"));
			if(multi.getFile("profile_url")!=null){
			    File file=multi.getFile("profile_url");
			    memberdto.setProfile_url("/J20180403/upload/" + filename);
			    
			    // 수정된 이미지가 헤더에도 적용되도록 주소를 request에 저장 (이후 jsp에서 받아오기 위해)
			    request.setAttribute("profile_url", "/J20180403/upload/" + filename);
			}else{
				MemberDao memberdao = MemberDao.getInstance();
				MemberDto memberdto2;
				try {
					memberdto2 = memberdao.select(email);
					memberdto.setProfile_url(memberdto2.getProfile_url());
					
					// memberdto에 저장한 주소를 request에 저장 (이후 jsp에서 받아오기 위해)
					request.setAttribute("profile_url", memberdto.getProfile_url());
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
			}
			// memberdto.setProfile_url("/J20180403/upload/" + filename);
			System.out.println("kk aa : "+ "/J20180403/upload/" + filename);
		try {
			MemberDao memberdao = MemberDao.getInstance();
			int result = memberdao.update(memberdto);
			if (result > 0) {
				request.setAttribute("result", result);
				request.setAttribute("email", email);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "myinfopro.jsp";
	}
}
