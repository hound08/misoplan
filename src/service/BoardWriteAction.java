package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardScheduleDao;
import dao.BoardScheduleDto;

public class BoardWriteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			BoardScheduleDao dao = BoardScheduleDao.getInstance();
			BoardScheduleDto dto = dao.writeList();
			request.setAttribute("email", dto.getEmail());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "planUpdate.jsp";
	}

}
