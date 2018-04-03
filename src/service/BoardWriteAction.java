package service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sun.security.action.GetLongAction;
import dao.BoardScheduleDao;
import dao.BoardScheduleDto;

public class BoardWriteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			String email = request.getParameter("email");

			BoardScheduleDao dao = BoardScheduleDao.getInstance();
			BoardScheduleDto dto = dao.writeList(email, sl_code);
			
			request.setAttribute("email", dto.getEmail());
			request.setAttribute("bs_num", dto.getBs_num()); 
			request.setAttribute("sl_code", dto.getSl_code());
			request.setAttribute("nickname", dto.getNickname());
			request.setAttribute("title", dto.getTitle());
			request.setAttribute("tag", dto.getTag());
			request.setAttribute("content", dto.getContent());
			request.setAttribute("image_url", dto.getImage_url());
			request.setAttribute("vote_count", dto.getVote_count());
			request.setAttribute("view_conut", dto.getView_count());
			request.setAttribute("board_date", dto.getBoard_date());
			request.setAttribute("local_names", dto.getLocal_names());
			request.setAttribute("sm_code", dto.getSm_code()); 
			request.setAttribute("local_name", dto.getLocal_name());
			request.setAttribute("local_code", dto.getLocal_code());
			request.setAttribute("tour_date", dto.getTour_date());
			request.setAttribute("tour_text", dto.getTour_text());
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "planUpdate.jsp";
	}

}
