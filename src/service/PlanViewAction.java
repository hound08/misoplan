package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardScheduleDao;
import dao.BoardScheduleDto;

public class PlanViewAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		try {
			int bs_num = Integer.parseInt(request.getParameter("bs_num"));
			BoardScheduleDao bsd = BoardScheduleDao.getInstance();
		} finally {
			
		}
		
		return "planview.jsp";
	}

}

