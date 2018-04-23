package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;

public class PartyDeleteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {			
			String post_num = request.getParameter("hiddenDelete");
			String[] arrayPost_num = post_num.split(",");
			int result = 0;
			MemberDao dao = MemberDao.getInstance();
			
			for (String str : arrayPost_num) {
				result = dao.deletePartyAdmin(str);
			}
			
			request.setAttribute("result", result);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "partyDeletePro.jsp";
	}

}
