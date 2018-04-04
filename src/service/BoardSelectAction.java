package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.Session;

import dao.BoardScheduleDao;
import dao.BoardScheduleDto;

public class BoardSelectAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String email = request.getParameter("email");
			BoardScheduleDao dao = BoardScheduleDao.getInstance();
			List<BoardScheduleDto> list = dao.selectList(email);
			request.setAttribute("list", list);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "planUpdate.jsp";
	}

}
