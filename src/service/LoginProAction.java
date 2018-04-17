package service;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import security.SecurityUtil;
import dao.MemberDao;
import dao.MemberDto;

public class LoginProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String email = request.getParameter("email");
			
			// 사용자 비밀번호 암호화 (SHA-256)
			SecurityUtil securityUtil = new SecurityUtil();
			String password = securityUtil.encryptSHA256(request.getParameter("password"));
			
			MemberDao dao = MemberDao.getInstance();
			MemberDto dto = dao.loginCheck(email, password);
			
			request.setAttribute("email", dto.getEmail());
			request.setAttribute("nickname", dto.getNickname());
			request.setAttribute("profile_url", dto.getProfile_url());
			request.setAttribute("admin", dto.getMember_admin());
			request.setAttribute("ban", dto.getBan());
			request.setAttribute("ban_date", dto.getBan_date());
			request.setAttribute("leave", dto.getLeave());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "loginPro.jsp";
	}

}
