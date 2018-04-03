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
			request.setCharacterEncoding("UTF-8");
			MemberDto memberdto = new MemberDto();
			String email = request.getParameter("email");
			
			String imagePath = request.getServletContext().getRealPath("/images");
			
			int size = 2 * 1024 * 1024;
			String filename = "";
			try {
				MultipartRequest multi = new MultipartRequest( request, imagePath, size, "utf-8",
						new DefaultFileRenamePolicy());
				Enumeration files = multi.getFileNames();
				String file = (String)files.nextElement();
				filename = multi.getFilesystemName(file);
			} catch(Exception e){
				e.printStackTrace();
			}
			
			ParameterBlock pb = new ParameterBlock();
			pb.add(imagePath+"/"+filename);
			RenderedOp rOp = JAI.create("fileload", pb);
			BufferedImage bi = rOp.getAsBufferedImage();
			BufferedImage thumb = new BufferedImage(100,100,BufferedImage.TYPE_INT_BGR);
			Graphics2D g = thumb.createGraphics();
			
			// 버퍼사이즈 100 * 100으로 맞춰 그리자
			g.drawImage(bi,0,0,100,100,null);
			// 출력할 위치와 파일이름을 설정하고 섬네일 이미지를 생성한다. 저장하는 타입을 jpg로 설정
			// 그 변형할 파일을 파일명 변경시킨다
			File file = new File(imagePath+"/sm_"+filename);
			// 버퍼공간의 영역에 변경한 이미지 파일명을 불러와 jpg속성으로 출력시킨다.
			System.out.println("filename : " + filename);
			
			
			
			memberdto.setEmail(request.getParameter("email"));
			memberdto.setNickname(request.getParameter("Nickname"));	
			memberdto.setPassword(request.getParameter("password"));
			memberdto.setPhone(request.getParameter("phone"));
			memberdto.setProfile_url(request.getParameter("Profile_url"));
			System.out.println("aa : "+ request.getParameter("Profile_url"));
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
