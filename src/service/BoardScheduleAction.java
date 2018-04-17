package service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardScheduleDao;
import dao.BoardScheduleDto;
import dao.ScheduleDao;
import dao.ScheduleLargeDto;

public class BoardScheduleAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		try {
			BoardScheduleDao dao = BoardScheduleDao.getInstance();
			String pageNum = request.getParameter("pageNum");
			HttpSession session = request.getSession();
			if(pageNum ==null ||pageNum.equals(""))
				pageNum = "1";
			int currentPage = Integer.parseInt(pageNum);//현재 페이지 번호
			int totalpost = dao.getTotalpost(); //게시물 개수
			int pageSize = 9; //한페이지에 보일 게시물 수
			int blockSize = 5; //한번에 보일 페이지 수
			int startRow = (currentPage - 1) * pageSize + 1; //현재 페이지에서 첫번째 보일 게시물 번호
			int endRow = startRow + pageSize - 1; //현재 페이지에서 보일 마지막 게시물 번호
			System.out.println("endRow : " + endRow);
			System.out.println("startRow : " + startRow);
			int startNum = totalpost - startRow +1 ;
			int totalPage = (int)Math.ceil((double)totalpost/(double)pageSize);//총 페이지 개수
			int startPage = (int)((currentPage-1)/blockSize)*blockSize+1; // 페이지 목록 시작
			int endPage = 0;
			if(totalPage <= 5) 
				endPage = totalPage;
			else
				endPage = startPage + blockSize -1; //페이지 목록 끝
			
			List<BoardScheduleDto> pagelist = dao.pagelist(startRow, endRow);
			request.setAttribute("totalpost", totalpost);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("startNum", startNum);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("pagelist", pagelist);
			request.setAttribute("email", session.getAttribute("email"));
			int click = 0;
			request.setAttribute("click", click);
			} catch (Exception e ) {
				System.out.println(e.getMessage());
			}
		return "plan1.jsp";
	}

}

