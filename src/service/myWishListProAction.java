package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.WishlistDao;

public class myWishListProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			HttpSession session = request.getSession();
			String email = (String) session.getAttribute("email");
			request.setCharacterEncoding("UTF-8");
			
			ArrayList<Integer> list = new ArrayList<Integer>();  
			String[] contendtid = request.getParameterValues("wishlist");
			System.out.println("@@wishlistPro contendtid : "+ contendtid);
			for (String string : contendtid) {
				list.add(Integer.parseInt(string));
			}
			for (Integer i : list) {
				System.out.printf("%d ", i);
			}
			
			
			WishlistDao dao = WishlistDao.getInstance();
			int result = 0;
			try {
				result = dao.mydelete(email, list);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			request.setAttribute("result", result);
			request.setAttribute("email", email);
			request.setAttribute("contendtid", contendtid);
			
			
			
			
		return "myWishListForm.do";
	}

}
