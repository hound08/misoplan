package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			memberdto.setNickname(request.getParameter("Nickname"));	
			memberdto.setPassword(request.getParameter("password"));
			memberdto.setPhone(request.getParameter("phone"));

			
			MemberDao memberdao = MemberDao.getInstance();
			int result = memberdao.update(memberdto);
			request.setAttribute("result", result);
			request.setAttribute("email", email);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "Myinfo.jsp";
	}
}
