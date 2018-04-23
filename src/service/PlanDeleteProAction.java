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
			String bs_num = request.getParameter("hiddenDelete");
			String[] arrayBs_num = bs_num.split(",");
			int result = 0;
			BoardScheduleDao dao = BoardScheduleDao.getInstance();
			
			for (String str : arrayBs_num) {
				result = dao.deleteAdmin(str);
			}
			
			request.setAttribute("result", result);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "planDeletePro.jsp";
	}

}
