package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AccompanyBoardDto;
import dao.WishlistDao;
import dao.WishlistDto;

public class myWishListFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		System.out.println("wishlist email : "+ email);
		WishlistDao dao = WishlistDao.getInstance();
/*		try {
			List<WishlistDto> list = dao.select(email);
			request.setAttribute("list", list);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}*/
		
		//페이징
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum ==null ||pageNum.equals(""))
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);//현재 페이지 번호
		int totalPost = dao.getTotalPost(email); //게시물 개수
		System.out.println("##### totalPost = " + totalPost);
		int pageSize = 9; //한페이지에 보일 게시물 수
		int blockSize = 5; //한번에 보일 페이지 수
		int startRow = (currentPage - 1) * pageSize + 1; //현재 페이지에서 첫번째 보일 게시물 번호
		int endRow = startRow + pageSize - 1; //현재 페이지에서 보일 마지막 게시물 번호
		int startNum = totalPost - startRow +1 ;
		int totalPage = (int)Math.ceil((double)totalPost/(double)pageSize);//총 페이지 개수
		System.out.println("##### totalPage = " + totalPage);
		int startPage = (int)((currentPage-1)/blockSize)*blockSize+1; // 페이지 목록 시작
		int endPage = 0;
		if(totalPage <= 5) 
			endPage = totalPage;
		else
			endPage = startPage + blockSize -1; //페이지 목록 끝
		
		List<WishlistDto> list = dao.select(email, startRow, endRow);
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
		
		return "myWishList.jsp";
	}

}
