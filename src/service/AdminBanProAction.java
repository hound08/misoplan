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
			String emailBanCancle = request.getParameter("hiddenBanCancle");
			String emailAdmin = request.getParameter("hiddenAdmin");
			String emailAdminCancle = request.getParameter("hiddenAdminCancle");
			MemberDao dao = MemberDao.getInstance();
			int result = 0;
			
			if (emailBan != null && !emailBan.equals("")) {
				String[] arrayEmail = emailBan.split(",");
				
				for (String strEmail : arrayEmail) {
					result = dao.updateMemberBan(1, strEmail);
				}
			} else if (emailBanCancle != null && !emailBanCancle.equals("")) {
				String[] arrayEmail = emailBanCancle.split(",");
				
				for (String strEmail : arrayEmail) {
					result = dao.updateMemberBan(0, strEmail);
				}
			} else if (emailAdmin != null && !emailAdmin.equals("")) {
				String[] arrayEmail = emailAdmin.split(",");
				
				for (String strEmail : arrayEmail) {
					result = dao.updateMemberAdmin(1, strEmail);
				}
			} else if (emailAdminCancle != null && !emailAdminCancle.equals("")) {
				String[] arrayEmail = emailAdminCancle.split(",");
				
				for (String strEmail : arrayEmail) {
					result = dao.updateMemberAdmin(0, strEmail);
				}
			}
			
			request.setAttribute("result", result);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "adminBanPro.jsp";
	}

}
