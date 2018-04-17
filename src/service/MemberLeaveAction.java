package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;

public class MemberLeaveAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			String email = (String)session.getAttribute("email");
			
			MemberDao dao = MemberDao.getInstance();
			int result = dao.updateMemberLeave(email);
			
			if (result <= 0) {
				System.out.println("회원 탈퇴에 실패하였습니다.");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "main.do";
	}

}
