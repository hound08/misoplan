package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dao.MemberDto;

public class LoginProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
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
