package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.WishlistDao;
import dao.WishlistDto;

public class AddWishAction implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		int contentTypeId 			= Integer.parseInt(request.getParameter("contentTypeId"));
		int contendtid				= 	Integer.parseInt(request.getParameter("contendtid"));	
		String email					= request.getParameter("email");
		String title 					= request.getParameter("title");
		String mapx					= request.getParameter("mapx");
		String mapy					= request.getParameter("mapy");
		String firstImage			= request.getParameter("firstImage");
		String result ="";
		System.out.println("@@ AddWishAction contentTypeId ->" + contentTypeId);
		System.out.println("@@ AddWishAction contendtid ->" + contendtid);
		System.out.println("@@ AddWishAction email ->" + email);
		System.out.println("@@ AddWishAction title ->" + title);
		System.out.println("@@ AddWishAction mapx ->" + mapx);
		System.out.println("@@ AddWishAction mapy ->" + mapy);
		System.out.println("@@ AddWishAction firstImage ->" + firstImage);
		
		//dto에 담기
		WishlistDto dto = new WishlistDto();
		dto.setContendtid(contendtid);
		dto.setContenttypeid(contentTypeId);
		dto.setEmail(email);
		dto.setTour_name(title);
		dto.setImg_src(firstImage);
		
		try {
			WishlistDao dao = WishlistDao.getInstance();
			int wishchk = dao.wishCheck(dto);
			if(wishchk ==1) {
				result = "" + 1;
			}else{
				result = "" + dao.addWishList(dto);
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
		request.setAttribute("mapx", mapx);
		request.setAttribute("mapy", mapy);
		request.setAttribute("firstImage", firstImage);
		
		return "searchDetail.jsp";
	}

}
