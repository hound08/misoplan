<%@page import="dao.AccompanyBoardDto"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="dao.ApplicantsDto"%>
<%@page import="dao.ApplicantsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
 	int post_num = Integer.parseInt(request.getParameter("postnum"));
	String nickname = request.getParameter("nickname");
	int status = Integer.parseInt(request.getParameter("status"));
	int num_people = Integer.parseInt(request.getParameter("num_people"));
	/* int post_num = 5;
	String nickname = "철우!";
	int status = 1; */
	ApplicantsDto appdto = new ApplicantsDto();
	AccompanyBoardDto abdto = new AccompanyBoardDto();
	
	appdto.setStatus(Integer.parseInt(request.getParameter("status")));
	appdto.setPost_num(post_num);
	appdto.setNickname(nickname);
	appdto.setNum_people(num_people);
		
		System.out.println("ajax :"+ num_people);
		System.out.println("ajax :"+ post_num);
		System.out.println("ajax :"+ nickname); 
		System.out.println("ajax :"+ Integer.parseInt(request.getParameter("status"))); 
		  
	ApplicantsDao appdao = ApplicantsDao.getInstance();
 	// result로 return 되는 값은 1(수락) 또는 3(아무것도x)
	int result = appdao.update(appdto, abdto);                     /* 상태, 모집인원 */
 	
	// 동행 상태 업데이트
	System.out.println("result!!!!!!!!!!!! =  "+ result);
	if(result == 1){
		System.out.println("처음 수락!!!!");
		List<ApplicantsDto> list = appdao.bonusselect(post_num, nickname, status);        /* 수락을 하면 json 출력 */
	// json
	
	JSONObject json= new JSONObject();
	JSONArray jsonArray = new JSONArray();
	System.out.println("jsonArray :"+ list.size());
	for(int i = 0; i <list.size(); i++){
		JSONObject obj = new JSONObject();
		obj.put("profile_url", list.get(i).getProfile_url());
		obj.put("nickname", list.get(i).getNickname());
		obj.put("kakao_id", list.get(i).getKakao_id());
		jsonArray.add(obj);
		System.out.println("jsonArray :"+ jsonArray);
	}
	out.print(jsonArray); 
	}
	%>