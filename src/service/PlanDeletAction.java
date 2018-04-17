package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardScheduleDao;
import dao.BoardScheduleDto;

public class PlanDeletAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			int bs_num = Integer.parseInt(request.getParameter("bs_num"));
			String email = request.getParameter("email");
			BoardScheduleDao dao = BoardScheduleDao.getInstance();
			int result = dao.delete(bs_num, email);
			request.setAttribute("result", result);
			request.setAttribute("bs_num", bs_num);
			System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "delete.jsp";
	}

}
