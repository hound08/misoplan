package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TourRankDao;
import dao.TourRankDto;

public class MainAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			TourRankDao tourRank = TourRankDao.getInstance();
			TourRankDto dto = tourRank.selectList();
			request.setAttribute("tour_num", dto.getTour_code());
			request.setAttribute("tour_name", dto.getTour_name());
			request.setAttribute("tour_code", dto.getTour_code());
			request.setAttribute("image_url", dto.getImage_url());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "main.jsp";
	}

}
