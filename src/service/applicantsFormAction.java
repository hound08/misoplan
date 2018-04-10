package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ApplicantsDao;
import dao.ApplicantsDto;

public class applicantsFormAction implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			int post_num = Integer.parseInt(request.getParameter("post_num"));
			ApplicantsDao appdao = ApplicantsDao.getInstance();
			System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			List<ApplicantsDto> applist = appdao.appselect(post_num);
			
			
			request.setAttribute("applist", applist);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return "companion.jsp";
	}

}
