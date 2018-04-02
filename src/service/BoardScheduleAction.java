package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardScheduleDao;
import dao.BoardScheduleDto;
import dao.ScheduleDao;
import dao.ScheduleLargeDto;

public class BoardScheduleAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			BoardScheduleDao bsd = BoardScheduleDao.getInstance();
			BoardScheduleDto dto = bsd.bsList();
			request.setAttribute("bs_num", dto.getBs_num());
			request.setAttribute("sl_code", dto.getSl_code());
			request.setAttribute("email", dto.getEmail());
			request.setAttribute("nickname", dto.getNickname());
			request.setAttribute("title", dto.getTitle());
			request.setAttribute("tag", dto.getTag());
			request.setAttribute("content", dto.getContent());
			request.setAttribute("image_url", dto.getImage_url());
			request.setAttribute("vote_count", dto.getVote_count());
			request.setAttribute("view_count", dto.getView_count());
			request.setAttribute("board_date", dto.getBoard_date());
		} catch (Exception e ) {
			System.out.println(e.getMessage());
		}
		return "plan1.jsp";
	}

}
