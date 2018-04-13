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
		try {
			WishlistDao dao = WishlistDao.getInstance();
			List<WishlistDto> list = dao.select(email);
			request.setAttribute("list", list);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "myWishList.jsp";
	}

}
