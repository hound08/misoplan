package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.WishlistDao;

public class AddWishAction implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		int contentTypeId 			= Integer.parseInt(request.getParameter("contentTypeId"));
		int contendtid				= 	Integer.parseInt(request.getParameter("contendtid"));	
		String email					= request.getParameter("email");
		String title 					= request.getParameter("title");
		String result ="";
		System.out.println("@@ AddWishAction contentTypeId " + contentTypeId);
		System.out.println("@@ AddWishAction contendtid " + contendtid);
		System.out.println("@@ AddWishAction email " + email);
		System.out.println("@@ AddWishAction title " + title);
		
		try {
			WishlistDao dao = WishlistDao.getInstance();
			int wishchk = dao.wishCheck(contentTypeId, contendtid, email);
			if(wishchk ==1) {
				result = "" + 1;
			}else{
				result = "" + dao.addWishList(contentTypeId,contendtid,email,title);
			}
			System.out.println("addwishaction의 result 값 확인 -> " + result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//request하기 위해 String 변환
		String contentTypeId_ 	= ""+contentTypeId;
		String contendtid_			= ""+contendtid;
		
		request.setAttribute("contentTypeId", contentTypeId_);
		request.setAttribute("contendtid", contendtid_);
		request.setAttribute("result", result);
		
		return "searchDetail.jsp";
	}

}
