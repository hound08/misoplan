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
import dao.mySchduleDao;
import dao.mySchduleDto;

public class scheduleFormAction implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String email = request.getParameter("email");
			mySchduleDao msdao = mySchduleDao.getInstance();
			List<ArrayList<mySchduleDto>> planList = msdao.getMylist(email);
			List<ArrayList<mySchduleDto>> requestPlanList = null;
			ArrayList<mySchduleDto> requestPlan = null;
			
			
			for(int i = 0; i < planList.size(); i++){
				ArrayList<mySchduleDto> plan = planList.get(i);
				for(int j = 0; j < plan.size(); j++){
					mySchduleDto msdto = plan.get(j);
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
