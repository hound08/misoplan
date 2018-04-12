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
 * Servlet implementation class AreaCode
 */
@WebServlet("/AreaCode")
public class AreaCode extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?ServiceKey=";
		String serviceKey = "irqglLi1gisI6SuWlVdGZcdGGffwI7ZSmgzhLB4bdWSaPeRPsGqkD7IbkQFI18JgOmG%2BGWCdh5eDW12ZBKoANQ%3D%3D";
		String parameter = "";
//		serviceKey = URLEncoder.encode(serviceKey,"utf-8");
		PrintWriter out = response.getWriter();
		System.out.println("areacode 진입");
		parameter = parameter + "&" +"numOfRows=100";
		parameter = parameter + "&" +"pageSize=100";
		parameter = parameter + "&" +"pageNo=1";
		parameter = parameter + "&" +"startPage=1";
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=AppTest";
		parameter = parameter + "&" + "_type=json";
		
		
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);

		System.out.println(addr);
		
//		BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));

		InputStream in = url.openStream(); 
//		CachedOutputStream bos = new CachedOutputStream();
		ByteArrayOutputStream  bos1 = new ByteArrayOutputStream();
		IOUtils.copy(in, bos1);
		in.close();
		bos1.close();
	    
		String mbos = bos1.toString("UTF-8");
		//System.out.println("mbos: "+mbos);
	    
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
