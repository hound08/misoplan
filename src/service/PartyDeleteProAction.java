package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardScheduleDao;
import dao.MemberDao;

public class PartyDeleteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int post_num = Integer.parseInt(request.getParameter("hiddenDelete"));
			MemberDao dao = MemberDao.getInstance();
			int result = dao.deletePartyAdmin(post_num);
			
			request.setAttribute("result", result);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "partyDeletePro.jsp";
	}

}
