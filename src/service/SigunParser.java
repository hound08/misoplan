package service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.xml.sax.SAXException;

/*
 * 지역 코드 파싱
 * */

public class SigunParser {
	public ArrayList<HashMap<String, String>> getSigun(String areaCode) throws ParserConfigurationException,UnsupportedEncodingException{
		ArrayList<HashMap<String, String>> sigunList = new ArrayList<HashMap<String,String>>();
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?ServiceKey=";
		String serviceKey = "irqglLi1gisI6SuWlVdGZcdGGffwI7ZSmgzhLB4bdWSaPeRPsGqkD7IbkQFI18JgOmG%2BGWCdh5eDW12ZBKoANQ%3D%3D";
		String parameter = "";
		
		parameter = parameter + "&" +"numOfRows=50";
		parameter = parameter + "&" +"pageSize=50";
		parameter = parameter + "&" +"pageNo=1";
		parameter = parameter + "&" +"startPage=1";
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=AppTest";
		parameter = parameter + "&" + "areaCode="+areaCode;
		
		addr = addr + serviceKey + parameter;
		System.out.println("@@SigunParser addr @@" + addr);
		
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
			
			HashMap<String,String> sigunMap = new HashMap<String, String>();
			sigunMap.put("code", code.getTextContent());
			sigunMap.put("name", name.getTextContent());
			sigunList.add(sigunMap);
		}
		return sigunList;
	}
}
