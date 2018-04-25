package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dao.MemberDto;

public class AdminBanFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String pageNum = request.getParameter("pageNum");

			if (pageNum == null || pageNum.equals("")) {
				pageNum = "1";
			}

			MemberDto dtoSearch = new MemberDto();
			dtoSearch.setEmail("");
			dtoSearch.setNickname("");
			dtoSearch.setPhone("");
			
			if (request.getParameter("textSearch") != null && !request.getParameter("textSearch").equals("")) {
				if (request.getParameter("selSearch").equals("이메일")) {
					dtoSearch.setEmail(request.getParameter("textSearch"));
				} else if (request.getParameter("selSearch").equals("별명")) {
					dtoSearch.setNickname(request.getParameter("textSearch"));
				} else if (request.getParameter("selSearch").equals("연락처")) {
					dtoSearch.setPhone(request.getParameter("textSearch"));
				}
			}
			
			MemberDao dao = MemberDao.getInstance();
			int totCnt = dao.selectTotalCnt(1, dtoSearch);
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

			List<MemberDto> list = null;
			list = dao.selectMemberList(startRow, endRow, 1, dtoSearch);
			
			request.setAttribute("totCnt", totCnt);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("startNum", startNum);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("pageCnt", pageCnt);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("memberList", list);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return "adminBanForm.jsp";
	}

}
