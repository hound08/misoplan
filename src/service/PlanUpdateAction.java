package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardScheduleDao;
import dao.BoardScheduleDto;

public class PlanUpdateAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		try{
			int bs_num = Integer.parseInt(request.getParameter("bs_num"));
			BoardScheduleDao dao = BoardScheduleDao.getInstance();
			BoardScheduleDto dto = dao.select(bs_num);
			request.setAttribute("dto", dto);
		} catch (Exception e ) {
			System.out.println(e.getMessage());
		}
		
		return "planupdate.jsp";
	}

}
