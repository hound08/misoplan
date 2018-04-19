package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardScheduleDao;
import dao.BoardScheduleDto;

public class PlanSearchAction implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		BoardScheduleDao dao = BoardScheduleDao.getInstance();
		BoardScheduleDto dto = dao.search();
		
		return "plan1.jsp";
	}

}
