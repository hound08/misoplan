package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccompanyBoardDto;
import dao.MemberDao;

public class AdminPartyFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String pageNum = request.getParameter("pageNum");

			if (pageNum == null || pageNum.equals("")) {
				pageNum = "1";
			}
			
			AccompanyBoardDto dtoSearch = new AccompanyBoardDto();
			dtoSearch.setTitle("");
			dtoSearch.setContent("");
			dtoSearch.setEmail("");
			dtoSearch.setNickname("");
			
			if (request.getParameter("textSearch") != null && !request.getParameter("textSearch").equals("")) {
				if (request.getParameter("selSearch").equals("제목")) {
					dtoSearch.setTitle(request.getParameter("textSearch"));
				} else if (request.getParameter("selSearch").equals("내용")) {
					dtoSearch.setContent(request.getParameter("textSearch"));
				} else if (request.getParameter("selSearch").equals("이메일")) {
					dtoSearch.setEmail(request.getParameter("textSearch"));
				} else if (request.getParameter("selSearch").equals("별명")) {
					dtoSearch.setNickname(request.getParameter("textSearch"));
				}
			}
			
			MemberDao dao = MemberDao.getInstance();
			int totCnt = dao.selectPartyTotalCnt(dtoSearch);
			int currentPage = Integer.parseInt(pageNum);
			int pageSize = 20; // 한 페이지에 보여줄 회원 수
			int blockSize = 10; // 게시판 하단의 페이지 번호 블록
			int startRow = (currentPage - 1) * pageSize + 1;
			int endRow = startRow + pageSize - 1;
			int startNum = totCnt - startRow + 1;
			int pageCnt = (int) Math.ceil((double) totCnt / pageSize); // 해당 수 보다 높은 수 중에 가장 작은 정수
			int startPage = (int) (currentPage - 1) / blockSize * blockSize + 1;
			int endPage = startPage + blockSize - 1;

			if (endPage > pageCnt) {
				endPage = pageCnt;
			}
			
			List<AccompanyBoardDto> list = dao.selectAdminPartyList(startRow, endRow, dtoSearch);
			
			request.setAttribute("totCnt", totCnt);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("startNum", startNum);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("pageCnt", pageCnt);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("list", list);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "adminPartyForm.jsp";
	}

}
