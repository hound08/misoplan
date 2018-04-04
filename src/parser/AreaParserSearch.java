package parser;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.xml.parsers.*;

import org.w3c.dom.*;
import org.xml.sax.SAXException;

/*
 * 지역 코드 파싱
 * */

public class AreaParserSearch {
	public ArrayList<HashMap<String, Object>> areaParser() throws ParserConfigurationException,UnsupportedEncodingException{
		ArrayList<HashMap<String, Object>> areaList = new ArrayList<HashMap<String,Object>>();
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?ServiceKey=";
		String serviceKey = "irqglLi1gisI6SuWlVdGZcdGGffwI7ZSmgzhLB4bdWSaPeRPsGqkD7IbkQFI18JgOmG%2BGWCdh5eDW12ZBKoANQ%3D%3D";
		String parameter = "";
		
		parameter = parameter + "&" +"numOfRows=100";
		parameter = parameter + "&" +"pageSize=100";
		parameter = parameter + "&" +"pageNo=1";
		parameter = parameter + "&" +"startPage=1";
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=AppTest";
		
		addr = addr + serviceKey + parameter;
		
		DocumentBuilderFactory f = DocumentBuilderFactory.newInstance();
		DocumentBuilder parser = f.newDocumentBuilder();
		
		//XML 파일 파싱 단계
		Document xmlDoc = null;
		String parseUrl = addr;
		
		try {
			xmlDoc = parser.parse(parseUrl);
		} catch (SAXException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		Element root = xmlDoc.getDocumentElement();
		
		int length = root.getElementsByTagName("code").getLength();
		
		for(int i = 0; i<length;i++){
			Node code = root.getElementsByTagName("code").item(i);
			Node name = root.getElementsByTagName("name").item(i);
			
			HashMap<String,Object> areaParser = new HashMap<String, Object>();
			areaParser.put("code", code.getTextContent());
			areaParser.put("name", name.getTextContent());
			areaList.add(areaParser);
		}
		return areaList;
	}
}
