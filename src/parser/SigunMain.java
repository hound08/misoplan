package parser;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.tomcat.util.buf.StringCache;

public class SigunMain {

	public static void main(String[] args) throws Exception {
		SigunParserSearch sigunparser = new SigunParserSearch();
		ArrayList<HashMap<String, Object>> guArrList = sigunparser.sigunParser(1); //시군 파싱
		System.out.println("@@@ 파싱 데이터 size " + guArrList.size());
		HashMap<String,Object> sigun = new HashMap<String, Object>();
		
		for(int i = 0; i<guArrList.size(); i++){
			sigun = guArrList.get(i); //arraylist index로 hashmap에 쳐 넣음
			String gu = sigun.get("name").toString();
			System.out.println("@@gu : " + gu);
		};
//		System.out.println("@@@@@@@" + guArrList.get(0));
//		String test2 = guArrList.get(0).toString();
//		int testLeng = test2.length();
//		System.out.println("@@@@@@@" + test2.substring(14,test2.length()-1));
		
		
		
	}

}
