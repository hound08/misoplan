package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AccompanyBoardDto;
import dao.AccompanyDao;

public class searchActionAB implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String pageNum = request.getParameter("pageNum");
		
		String keyword = "";
		if(request.getParameter("search-keyword") == null)
			keyword = request.getParameter("keyword");
		else
			keyword = request.getParameter("search-keyword");
		
		int selected = 0;
		if(request.getParameter("search-selected") == null)
			selected = Integer.parseInt(request.getParameter("selected"));
		else
			selected = Integer.parseInt(request.getParameter("search-selected"));
		
		AccompanyDao dao = AccompanyDao.getInstance();
		
		if(pageNum == null || pageNum.equals("") )
			pageNum = "1";
		System.out.println("pageNum="+pageNum);
		int currentPage = Integer.parseInt(pageNum);//현재 페이지 번호
		int totalPost = dao.getTotalSearchedPost(keyword, selected); //게시물 개수
		int pageSize = 9; //한페이지에 보일 게시물 수
		int blockSize = 5; //한번에 보일 페이지 수
		int startRow = (currentPage - 1) * pageSize + 1; //현재 페이지에서 첫번째 보일 게시물 번호
		int endRow = startRow + pageSize - 1; //현재 페이지에서 보일 마지막 게시물 번호
		int startNum = totalPost - startRow +1 ;
		int totalPage = (int)Math.ceil((double)totalPost/(double)pageSize);//총 페이지 개수
		int startPage = (int)((currentPage-1)/blockSize)*blockSize+1; // 페이지 목록 시작
		int endPage = 0;
		if(totalPage <= 5) 
			endPage = totalPage;
		else
			endPage = startPage + blockSize -1; //페이지 목록 끝
		System.out.println("currentPage="+currentPage);
		System.out.println("totalPost="+totalPost);
		System.out.println("pageSize="+pageSize);
		System.out.println("blockSize="+blockSize);
		System.out.println("startRow="+startRow);
		System.out.println("endRow="+endRow);
		System.out.println("startNum="+startNum);
		System.out.println("totalPage="+totalPage);
		System.out.println("startPage="+startPage);
		System.out.println("endPage="+endPage);

		List<AccompanyBoardDto> list = dao.search(keyword, selected, startRow, endRow);
		request.setAttribute("totalPost", totalPost);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("startNum", startNum);
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("list", list);
		request.setAttribute("email", session.getAttribute("email"));
		request.setAttribute("keyword", keyword);
		request.setAttribute("selected", selected);
		int a = 3;
		request.setAttribute("a", a);
		return "accompanyBoard.jsp";
	}

}
