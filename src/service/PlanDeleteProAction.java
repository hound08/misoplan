package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardScheduleDao;

public class PlanDeleteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int bs_num = Integer.parseInt(request.getParameter("hiddenDelete"));
			BoardScheduleDao dao = BoardScheduleDao.getInstance();
			int result = dao.deleteAdmin(bs_num);
			
			request.setAttribute("result", result);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "planDeletePro.jsp";
	}

}
