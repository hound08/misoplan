package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccompanyBoardDto;
import dao.ApplicantsDao;
import dao.ApplicantsDto;
import dao.mycompanionDao;

public class companionFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			String email = request.getParameter("email");
			mycompanionDao comdao = mycompanionDao.getInstance();
			List<AccompanyBoardDto> list = comdao.select(email);
			
			ApplicantsDao appdao = ApplicantsDao.getInstance();
			List<ApplicantsDto> myapplist = appdao.myappselect(email);
			
			
			
			System.out.println("myapplist"+ myapplist);
			request.setAttribute("list", list);
			request.setAttribute("myapplist", myapplist);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "companion.jsp";
	}

}
