package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardScheduleDao;
import dao.BoardScheduleDto;

public class PlanUpdateProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			System.out.println("PlanUpdateProAction");
			request.setCharacterEncoding("utf-8");
			BoardScheduleDto dto = new BoardScheduleDto();
			String bs_num = request.getParameter("bs_num");
			String title = request.getParameter("title");
			
			System.out.println("#########planupdateproaction의 bs_num 확인 : " + bs_num);
			System.out.println("#########planupdateproaction의 title 확인 : " + title);
			
			dto.setBs_num(Integer.parseInt(request.getParameter("bs_num")));
			dto.setTitle(request.getParameter("title"));
			dto.setTag(request.getParameter("tag"));
			dto.setImage_url(request.getParameter("image_url"));
			dto.setContent(request.getParameter("content"));
			
			System.out.println("@@@@@ bsnum " + dto.getBs_num());
			System.out.println("@@@@@ title " + dto.getTitle());
			System.out.println("@@@@@ setTag " + dto.getTag());
			System.out.println("@@@@@ setImage_url " + dto.getImage_url());
			System.out.println("@@@@@ setContent " + dto.getContent());
			
			BoardScheduleDao dao = BoardScheduleDao.getInstance();
			int result = dao.update(dto);
			request.setAttribute("bs_num", dto.getBs_num());
			request.setAttribute("result", result);
		} catch (Exception e ) {
			System.out.println();
		}
		
		return "planupdatePro.jsp";
	}

}
