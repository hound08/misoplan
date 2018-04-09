package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccompanyBoardDto;
import dao.mycompanionDao;

public class companionFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			String email = request.getParameter("email");
			mycompanionDao dao = mycompanionDao.getInstance();
			List<AccompanyBoardDto> list = dao.select(email);
			System.out.println("@@@"+ request.getParameter("email"));
			
			request.setAttribute("list", list);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "companion.jsp";
	}

}
