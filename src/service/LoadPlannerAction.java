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

public class LoadPlannerAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int status = 1;
		String email = request.getParameter("email");
		String sl_code = "";
		if (request.getParameter("sl_code") != null) {
			sl_code = request.getParameter("sl_code");
			status = 1;
			ScheduleDao sdao = ScheduleDao.getInstance();
			ScheduleLargeDto largeDto = sdao.selectLarge(sl_code);
			ArrayList<ScheduleLoadDto> loadArr = sdao.selectPlan(sl_code);
			request.setAttribute("status", status);
			request.setAttribute("ldto", largeDto);
			request.setAttribute("loadArr", loadArr);
			return "makePlan.do";
		}
		String deleteId = "";
		if (request.getParameter("deleteId") != null) {
			deleteId = request.getParameter("deleteId");
			status = 2;
			request.setAttribute("deleteId", deleteId);
			return "deletePlan.do";
		}
		return "main.jsp";
		
	}

}
