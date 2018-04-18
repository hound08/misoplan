package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ApplicantsDao;
import dao.ApplicantsDto;

public class companionFormAction2 implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			String email = request.getParameter("email");
			ApplicantsDao appdao = ApplicantsDao.getInstance();
			List<ApplicantsDto> myapplist = appdao.myappselect(email);
			
			request.setAttribute("myapplist", myapplist);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "companion2.jsp";
	}

}
