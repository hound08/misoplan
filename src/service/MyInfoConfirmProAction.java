package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;

public class MyInfoConfirmProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = (String)request.getAttribute("email");
		String password = request.getParameter("password");
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
