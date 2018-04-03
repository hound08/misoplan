package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardScheduleDao;
import dao.BoardScheduleDto;

public class BoardCheckAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			String email = request.getParameter("email");
			
			BoardScheduleDao dao = BoardScheduleDao.getInstance();
			int ck = dao.checkList(email);
			
			if(ck==1){
				
			}else{
				
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return null;
	}

}
