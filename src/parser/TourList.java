package parser;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.json.simple.JSONObject;

/**
 * Servlet implementation class GalleryList
 */
@WebServlet("/TourList")
public class TourList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=";
		String serviceKey = "irqglLi1gisI6SuWlVdGZcdGGffwI7ZSmgzhLB4bdWSaPeRPsGqkD7IbkQFI18JgOmG%2BGWCdh5eDW12ZBKoANQ%3D%3D";
		String parameter = "";
		//&contentTypeId=&areaCode=1&sigunguCode=1&cat1=&cat2=&cat3=&listYN=Y
		//&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=1
//		serviceKey = URLEncoder.encode(serviceKey,"utf-8");
		PrintWriter out = response.getWriter();
		System.out.println("galleryList 진입");
		String areaCode = request.getParameter("area");
		String sigunCode = request.getParameter("sigun");
		System.out.println("in galleryList__areaCode = " + areaCode);
		System.out.println("in galleryList__sigunCode = " + sigunCode);
		parameter = parameter + "&" +"contentTypeId=";
		parameter = parameter + "&" +"areaCode=" + Integer.parseInt(areaCode);
		parameter = parameter + "&" +"sigunguCode=" + Integer.parseInt(sigunCode);
		parameter = parameter + "&" +"cat1=&cat2=&cat3=";
		parameter = parameter + "&" + "listYN=Y";
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "arrange=A";
		parameter = parameter + "&" + "numOfRows=300";
		parameter = parameter + "&" + "pageNo=1";
		parameter = parameter + "&" + "_type=json";
		
		
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);
		
		System.out.println("ListTest " + addr);
		
//		BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));

		InputStream in = url.openStream(); 
//		CachedOutputStream bos = new CachedOutputStream();
		ByteArrayOutputStream  bos1 = new ByteArrayOutputStream();
		IOUtils.copy(in, bos1);
		in.close();
		bos1.close();
	    
		String mbos = bos1.toString("UTF-8");
		System.out.println("mbos: "+mbos);
	    
		byte[] b = mbos.getBytes("UTF-8");
		String s = new String(b, "UTF-8");
		out.println(s);
		
		JSONObject json = new JSONObject();
		json.put("data", s);
//		json.put("data", data);
		System.out.println("json: "+json);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
