package service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import dao.ScheduleLoadDto;
import dao.ScheduleMediumDto;
import dao.ScheduleSmallDto;

public class MakePlannerAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int status = 0;
		ArrayList<ScheduleLoadDto> loadArr = null;
		if((Integer)request.getAttribute("status") != null) {
			status = (Integer)request.getAttribute("status");
			//System.out.println("status in MakePlannerAction : " + status);
		}
		if((ArrayList<ScheduleLoadDto>)request.getAttribute("loadArr") != null) {
			loadArr = (ArrayList<ScheduleLoadDto>)request.getAttribute("loadArr");
			//System.out.println("loadArr[0] in MakePlannerAction : " + loadArr.get(0).getArea_code());
		}
		JSONArray loadJsonArr = new JSONArray();
		if(status == 1) {
			for(int i = 0; i < loadArr.size(); i++) {
				ScheduleLoadDto loadDto = loadArr.get(i);
				JSONObject loadJsonObj = new JSONObject();
				
				loadJsonObj.put("area_name", loadDto.getArea_name());
				loadJsonObj.put("area_code", loadDto.getArea_code());
				loadJsonObj.put("sigungu_name", loadDto.getSigungu_name());
				loadJsonObj.put("sigungu_code", loadDto.getSigungu_code());
				loadJsonObj.put("tour_date", loadDto.getTour_date());
				loadJsonObj.put("sl_code", loadDto.getSl_code());
				loadJsonObj.put("sm_code", loadDto.getSm_code());
				loadJsonObj.put("ss_code", loadDto.getSs_code());
				loadJsonObj.put("tour_code", loadDto.getTour_code());
				loadJsonObj.put("tour_name", loadDto.getTour_name());
				loadJsonObj.put("coord_x", loadDto.getCoord_x());
				loadJsonObj.put("coord_y", loadDto.getCoord_y());
				loadJsonObj.put("image_url", loadDto.getImage_url());
				loadJsonArr.put(loadJsonObj);
			}
			request.setAttribute("loadJsonArr", loadJsonArr);
		}
		AreaParser areaParser = new AreaParser();
		try {
			ArrayList<HashMap<String, String>> areas = areaParser.getAreas();
			request.setAttribute("areasList", areas);
		}catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("status", status);
		return "planner.jsp";
	}
}
