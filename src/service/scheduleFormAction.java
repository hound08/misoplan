package service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardScheduleDao;
import dao.BoardScheduleDto;

public class scheduleFormAction implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String email = request.getParameter("email");
			BoardScheduleDao bsdao = BoardScheduleDao.getInstance();
			List<ArrayList<BoardScheduleDto>> planList = bsdao.getMylist(email);
			List<ArrayList<BoardScheduleDto>> requestPlanList = null;
			ArrayList<BoardScheduleDto> requestPlan = null;
			
			
			for(int i = 0; i < planList.size(); i++){
				ArrayList<BoardScheduleDto> plan = planList.get(i);
				for(int j = 0; j < plan.size(); j++){
					BoardScheduleDto bsdto = plan.get(j);
					/*if(j == 1){
						String s_name = bsdto.getS_name();
						Date regi_Date = bsdto.getRegi_date();
					}
					if(j == plan.size()){
						
					}*/
					
				}
			}
			
			
		} catch (Exception e ) {
			System.out.println(e.getMessage());
		}
		return "schedule.jsp";
	}
}
