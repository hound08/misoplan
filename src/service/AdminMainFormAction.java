package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dao.MemberDto;

public class AdminMainFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<MemberDto> list = null;
		
		try {
			MemberDao dao = MemberDao.getInstance();
			list = dao.selectMemberList();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		request.setAttribute("memberList", list);
		
		return "adminMainForm.jsp";
	}

}
