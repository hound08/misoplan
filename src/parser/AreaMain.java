package parser;

import java.util.ArrayList;
import java.util.HashMap;

public class AreaMain {
	public static void main(String[] args) throws Exception {
		AreaParserSearch paser = new AreaParserSearch();
		ArrayList<HashMap<String, Object>> areaList = paser.areaParser();//name, code 저장
								//key    ,value
		ArrayList<String> areaCode = new ArrayList<String>();
		String seoul = "서울" ;
//		for(int i = 0; i<areaList.size(); i++){
//			HashMap<String,Object> areaMap = areaList.get(i);
//			System.out.println(areaList.get(i));
//		}
		
		HashMap<String,Object> areaMap = new HashMap<String, Object>();
		HashMap<String,Object> test = new HashMap<String, Object>();
		for(int i = 0; i<areaList.size(); i++){
			areaMap = areaList.get(i);
			System.out.println("code : " + areaMap.get("code"));
			System.out.println("name : " + areaMap.get("name"));
	//		test.put((String) areaMap.get("code"), areaMap.get("name"));
			test.put((String) areaMap.get("name"), areaMap.get("code"));
		}
		System.out.println(test);
		System.out.println(test.get(seoul));
		System.out.println(test.containsKey(seoul));
		if(test.containsKey(seoul)){
			String code = test.get(seoul).toString();
			System.out.println("@@@@code = " + code);
		}
		
		
		
	}
}

