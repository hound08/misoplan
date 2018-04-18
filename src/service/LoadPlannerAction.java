package service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.bcel.internal.generic.LALOAD;

import dao.ScheduleDao;
import dao.ScheduleLargeDto;
import dao.ScheduleLoadDto;
import dao.ScheduleMediumDto;
import dao.ScheduleSmallDto;

public class LoadPlannerAction implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String sl_code = request.getParameter("sl_code");
		//System.out.println("sl_code in LoadPlannerAction : " + sl_code);
		
		ScheduleDao sdao = ScheduleDao.getInstance();
		ScheduleLargeDto largeDto = sdao.selectLarge(sl_code);
		ArrayList<ScheduleLoadDto> loadArr = sdao.selectPlan(sl_code);
		
		//System.out.println("loadArr[0] after sdao : " + loadArr.get(0).getArea_code());
		
		int status = 1;
		request.setAttribute("status", status);
		request.setAttribute("ldto", largeDto);
		request.setAttribute("loadArr", loadArr);
		return "makePlan.do";
	}

}
