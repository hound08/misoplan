package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccompanyBoardDto;
import dao.WishlistDao;

public class myWishListFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			String email = request.getParameter("email");
			WishlistDao dao = WishlistDao.getInstance();
			List<WishlistDto> list = dao.select(email);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "myWishList.jsp";
	}

}
