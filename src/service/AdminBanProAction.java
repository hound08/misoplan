package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;

public class AdminBanProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String emailBan = request.getParameter("hiddenBan");
			String[] arrayEmail = emailBan.split(",");
			int result = 0;
			
			MemberDao dao = MemberDao.getInstance();
			
			for (String strEmail : arrayEmail) {
				result = dao.updateMemberBan(strEmail);
				
				if (result <= 0) {
					System.out.println(strEmail + " 회원 정지 처리에 실패하였습니다.");
				}
			}
			
			request.setAttribute("result", result);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "adminBanPro.jsp";
	}

}
