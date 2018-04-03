package service;

import java.io.IOException;
import java.util.ArrayList;

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
			String email = request.getParameter("email");
			BoardScheduleDao dao = BoardScheduleDao.getInstance();
			BoardScheduleDto dto = dao.writeList();
			ArrayList<Integer> smArrayList = new ArrayList<Integer>();
			request.setAttribute("sl_code", dto.getSl_code());
			request.setAttribute("email", dto.getEmail());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "planUpdate.jsp";
	}

}
