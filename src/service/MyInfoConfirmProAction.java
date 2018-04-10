package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import security.SecurityUtil;
import dao.MemberDao;

public class MyInfoConfirmProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		
		// 사용자 비밀번호 암호화 (SHA-256)
		SecurityUtil securityUtil = new SecurityUtil();
		String password = securityUtil.encryptSHA256(request.getParameter("password"));
		
		int result = 0;
		
		try {
			MemberDao dao = MemberDao.getInstance();
			result = dao.myInfoLogin(email, password);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		request.setAttribute("result", result);

		return "myInfoConfirmPro.jsp";
	}

}
