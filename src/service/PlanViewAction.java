package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardScheduleDao;
import dao.BoardScheduleDto;

public class PlanViewAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			int bs_num = Integer.parseInt(request.getParameter("bs_num"));
			BoardScheduleDao dao = BoardScheduleDao.getInstance();
			BoardScheduleDto dto = dao.planselect(bs_num);
			
			request.setAttribute("bs_num", bs_num);
			request.setAttribute("dto", dto);
			
			/*request.setAttribute("sl_code", dto.getSl_code());
			request.setAttribute("nickname", dto.getNickname());
			request.setAttribute("title", dto.getTitle());
			request.setAttribute("content", dto.getContent());
			request.setAttribute("image_url", dto.getImage_url());
			request.setAttribute("vote_count", dto.getVote_count());
			request.setAttribute("view_count", dto.getView_count());
			request.setAttribute("board_date", dto.getBoard_date());
			request.setAttribute("schedule_date", dto.getSchedule_date());
			request.setAttribute("area_name", dto.getArea_name());		
			request.setAttribute("area_names", dto.getArea_names());	*/
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "planview.jsp";
	}
}


