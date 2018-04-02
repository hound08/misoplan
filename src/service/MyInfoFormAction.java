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
			String email = request.getParameter("email");
			MemberDao memberdao = MemberDao.getInstance();
			MemberDto memberdto = memberdao.select(email);
			
			
			request.setAttribute("email", email);
			request.setAttribute("memberdto", memberdto);
			
			System.out.println("@@@@@@" + email);
			System.out.println("@@@@@@" + memberdto.getEmail());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "myinfo.jsp";
	}

}
