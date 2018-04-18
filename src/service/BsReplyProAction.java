package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ReplyBoardScheduleDao;
import dao.ReplyBoardScheduleDto;

public class BsReplyProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			ReplyBoardScheduleDto dto = new ReplyBoardScheduleDto();
			dto.setBs_num(Integer.parseInt(request.getParameter("bs_num")));
			dto.setEmail((String)session.getAttribute("email"));
			dto.setNickname((String)session.getAttribute("nickname"));
			dto.setProfile_url((String)session.getAttribute("profile_url"));
			dto.setReply_content(request.getParameter("reply_content"));
			
			ReplyBoardScheduleDao dao = ReplyBoardScheduleDao.getInstance();
			int result = dao.insertReply(dto);
			
			if (result <= 0) {
				System.out.println("댓글 입력에 실패하였습니다.");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "planview.do";
	}

}
