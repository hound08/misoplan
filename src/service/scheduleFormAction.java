package service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.mySchduleDao;
import dao.mySchduleDto;

public class scheduleFormAction implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("@@@@@@scheduleformaction 진입성공");
		try {
			String email = request.getParameter("email");
			mySchduleDao msdao = mySchduleDao.getInstance();
			List<ArrayList<mySchduleDto>> planList = msdao.getMylist(email);
			List<ArrayList<mySchduleDto>> plan = msdao.getMylist(email);
//			List<ArrayList<mySchduleDto>> requestPlanList = null;
//			ArrayList<mySchduleDto> requestPlan = null;
			/*for(int i = 0; i < planList.size(); i++){
				ArrayList<mySchduleDto> plan = planList.get(i);
				for(int j = 0; j < plan.size(); j++){
					mySchduleDto msdto = plan.get(j);
						String s_name = msdto.getS_name();
						String local_name = msdto.getLocal_name();
						Date tour_date = msdto.getTour_date();
						Date regi_date = msdto.getRegi_date();
				}
				
			}*/
			request.setAttribute("planList", planList);
			request.setAttribute("plan", plan);
			request.setAttribute("email", email);
			
		} catch (Exception e ) {
			System.out.println(e.getMessage());
		}
		return "schedule.jsp";
	}
}
