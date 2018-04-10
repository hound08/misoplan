package service;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TourRankDao;
import dao.WishlistDao;

public class SearchDetailAction implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		int contentTypeId 			= Integer.parseInt(request.getParameter("contentTypeId"));
		int contendtid				= 	Integer.parseInt(request.getParameter("contendtid"));	
		String email					= request.getParameter("email");
		String result ="";
		System.out.println("@@ searchdetailaction contentTypeId " + contentTypeId);
		System.out.println("@@ searchdetailaction contendtid " + contendtid);
		System.out.println("@@ searchdetailaction email " + email);
		
		if(email == ""){
			System.out.println("이메일 없음");
		}else{
			System.out.println("이메일 있음, 이메일 : " + email);
			try {
				WishlistDao dao =WishlistDao.getInstance(); 
				result = ""+dao.wishCheck(contentTypeId,contendtid,email);
				System.out.println("searchDetailAction result 값 확인 -> " + result);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		System.out.println("searchdetail 확인 - result --> " + result);
		System.out.println("searchdetail 확인 - contentTypeId --> " + contentTypeId);
		System.out.println("searchdetail 확인 - contendtid --> " + contendtid);
		
		
		//request하기 위해 String 변환
		String contentTypeId_ 	= ""+contentTypeId;
		String contendtid_			= ""+contendtid;
		
		request.setAttribute("contentTypeId", contentTypeId_);
		request.setAttribute("contendtid", contendtid_);
		request.setAttribute("result", result);
		
		

		return "searchDetail.jsp";
	}

}
