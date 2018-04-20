package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ScheduleDao;

public class DeletePlanAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String deleteId = (String)request.getAttribute("deleteId");
		ScheduleDao sdao = ScheduleDao.getInstance();
		int result = sdao.deletePlan(deleteId);
		if(result == 1) {
			return "scheduleForm.do";
		}
		return "main.jsp";
	}

}
