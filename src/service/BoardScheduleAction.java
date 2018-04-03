package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardScheduleDao;
import dao.BoardScheduleDto;
import dao.ScheduleDao;
import dao.ScheduleLargeDto;

public class BoardScheduleAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			BoardScheduleDao bsd = BoardScheduleDao.getInstance();
			List<BoardScheduleDto> list = bsd.list();
			request.setAttribute("list", list);
		} catch (Exception e ) {
			System.out.println(e.getMessage());
		}
		return "plan1.jsp";
	}

}

