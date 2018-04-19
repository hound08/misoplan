package service;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import dao.ScheduleDao;
import dao.ScheduleLargeDto;
import dao.ScheduleMediumDto;
import dao.ScheduleSmallDto;
import dao.TourRankDao;

public class InsertPlanAction implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ArrayList<ScheduleMediumDto> mArr = new ArrayList<>();
		ArrayList<ScheduleSmallDto> sArr = new ArrayList<>();
		
		
		int status = Integer.parseInt((String)request.getParameter("status"));
		String email = request.getParameter("email");
		String title = request.getParameter("title");
		String firstdate = request.getParameter("firstdate");
		String lastdate = request.getParameter("lastdate");
		String jsonString = request.getParameter("jsonString");
		String strDays = request.getParameter("strDays");
		String[] dayArr = strDays.split(",");
			//System.out.println("strDays : " + strDays);

		
		
		ScheduleLargeDto ldto = new ScheduleLargeDto();
		ldto.setEmail(email);
		ldto.setS_name(title);
		System.out.println("sl_code in insertplanAction : " + request.getParameter("sl_code"));
		ldto.setSl_code((String)request.getParameter("sl_code"));
		
		System.out.println("getSl_code() : " + ldto.getSl_code());
		JSONArray ja = new JSONArray(jsonString);
		for(int i = 0; i < ja.length(); i++) {

			ScheduleMediumDto mdto = new ScheduleMediumDto();
			ScheduleSmallDto sdto = new ScheduleSmallDto();
			JSONObject jo = ja.getJSONObject(i);
			Date day1 = null;
			/*try {
				day1 = new SimpleDateFormat("yyyy/MM/dd").parse(dayArr[i]);
			} catch (ParseException e) {
				e.printStackTrace();
			}*/
			mdto.setArea_name(jo.getString("areaName"));
			mdto.setArea_code(jo.getString("areaCode"));
			mdto.setSigungu_name(jo.getString("sigunguName"));
			mdto.setSigungu_code(jo.getString("sigunguCode"));
			mdto.setTour_date(dayArr[i]);
			mArr.add(mdto);
			
			sdto.setTour_name(jo.getString("elemTitle"));
			sdto.setTour_code(jo.getString("contentId"));
			sdto.setCoord_x(jo.getDouble("mapx"));
			sdto.setCoord_y(jo.getDouble("mapy"));
			sdto.setImage_url(jo.getString("imagePath"));
			sdto.setTour_text(jo.getString("detail"));
			sArr.add(sdto);
		}
		
		
		
		System.out.println("email : " + email);
		System.out.println("title : " + title);
		System.out.println("firstdate : " + firstdate);
		System.out.println("lastdate : " + lastdate);
		System.out.println("jsonString : " + jsonString);
		
		
		ScheduleDao sd = ScheduleDao.getInstance();
		int result = 0;
		if(status == 0) {
			result = sd.insertPlan(ldto, mArr, sArr);
		}else if(status == 1) {
			result = sd.updatePlan(ldto, mArr, sArr);
		}
		
		TourRankDao tdao = TourRankDao.getInstance();
		tdao.insertTour(sArr);
		
		if(result != 0 ) {
			return "main.jsp";
		}
		
		return "plannerDetailtest.jsp";
	}

}
