package service;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dao.MemberDto;

public class MyInfoFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
<<<<<<< HEAD
			//String email = (String)request.getAttribute("email");
			String email = request.getParameter((String) request.getAttribute("email"));
			System.out.println("!!!!!!!!!!!!!!!!!"+ email);
=======
			String email = request.getParameter("email");
>>>>>>> 1bb60379db8f2c952103f656963ef004f287e543
			MemberDao memberdao = MemberDao.getInstance();
			MemberDto memberdto = memberdao.select(email);
			
			
			request.setAttribute("email", email);
			request.setAttribute("memberdto", memberdto);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "myinfo.jsp";
	}

}
