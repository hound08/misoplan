package service;

import java.io.IOException;
import java.util.List;

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
			List<String> list = dao.loginCheck(email, password);
			
			request.setAttribute("email", list.get(0));
			request.setAttribute("nickname", list.get(1));
			request.setAttribute("profile_url", list.get(2));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "loginPro.jsp";
	}

}
