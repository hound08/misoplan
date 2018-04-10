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
 * Servlet implementation class Detail1
 */
@WebServlet("/Detail1")
public class Detail1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=";
		String serviceKey = "irqglLi1gisI6SuWlVdGZcdGGffwI7ZSmgzhLB4bdWSaPeRPsGqkD7IbkQFI18JgOmG%2BGWCdh5eDW12ZBKoANQ%3D%3D";
		String parameter = "";
		//&contentTypeId=&areaCode=1&sigunguCode=1&cat1=&cat2=&cat3=&listYN=Y
		//&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=1
//		serviceKey = URLEncoder.encode(serviceKey,"utf-8");
		PrintWriter out = response.getWriter();
		System.out.println("galleryList 진입");
		String contentTypeId = request.getParameter("typeId");
		String contendtid = request.getParameter("id");
		System.out.println("in Detail1_contentTypeId = " + contentTypeId);
		System.out.println("in Detail1_contendtid = " + contendtid);
		parameter = parameter + "&" +"contentTypeId=" + Integer.parseInt(contentTypeId);
		parameter = parameter + "&" +"contentId=" + Integer.parseInt(contendtid);
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "defaultYN=Y";
		parameter = parameter + "&" + "firstImageYN=Y";
		parameter = parameter + "&" +"areacodeYN=Y";
		parameter = parameter + "&" +"catcodeYN=Y";
		parameter = parameter + "&" +"addrinfoYN=Y";
		parameter = parameter + "&" +"mapinfoYN=Y";
		parameter = parameter + "&" +"overviewYN=Y";
		parameter = parameter + "&" +"transGuideYN=Y";
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
