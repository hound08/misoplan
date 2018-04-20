package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardScheduleDao;
import dao.BoardScheduleDto;
import dao.ReplyBoardScheduleDto;
import dao.ScheduleLoadDto;

public class PlanViewAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			System.out.println("planviewaction 진입");
			int bs_num = Integer.parseInt(request.getParameter("bs_num"));
			
			BoardScheduleDao dao = BoardScheduleDao.getInstance();
			BoardScheduleDto dto = dao.planselect(bs_num);
			List<ReplyBoardScheduleDto> list = dao.selectReply(bs_num);
/*			List<ScheduleLoadDto> namelist = dao.selectCodeName(bs_num);*/
			dao.view_count(bs_num);
			
			request.setAttribute("bs_num", bs_num);
			request.setAttribute("dto", dto);
			request.setAttribute("list_reply", list);
			request.setAttribute("list_size", list.size());
			request.setAttribute("namelist", list);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "planview.jsp";
	}
}