package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.WishlistDao;

public class myWishListProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
			String email = request.getParameter("email");
		try {
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "myWishList.jsp";
	}

}
