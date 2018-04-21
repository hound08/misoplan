package service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.TreeSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ScheduleLargeDto;
import dao.WishlistDto;
import dao.mySchduleDao;
import dao.mySchduleDto;

public class scheduleFormAction implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String email = request.getParameter("email");
			
			// 받아오는 dao
			mySchduleDao msdao = mySchduleDao.getInstance();
			List<mySchduleDto> planList = msdao.getMylist(email);
			// 보낼 dao
			mySchduleDto dto = null;
			List<mySchduleDto> showList = new ArrayList<mySchduleDto>();
			
			// 변수 세팅
			String sl_code = planList.get(0).getSl_code();
			String s_name = "";
			int is_deleted = 0;
			List<String> area_name = new ArrayList<String>();
			List<String> area_name_result = new ArrayList<String>();
			Date tour_date_start = null;
			Date tour_date_end = null;
			Date regi_date = null;

			for (int i = 0; i < planList.size(); i++) {
				if (sl_code.equals(planList.get(i).getSl_code())) {		// SL_CODE가 같다면 덮어쓰면서 값 세팅
					s_name = planList.get(i).getS_name();
					is_deleted = planList.get(i).getIs_deleted();
					area_name.add(planList.get(i).getArea_name());

					if (i == 0) {
						tour_date_start = planList.get(i).getTour_date_start();
					}
					
					tour_date_end = planList.get(i).getTour_date_start();
					regi_date = planList.get(i).getRegi_date();
				} else {	// SL_CODE가 다르면 지금까지 세팅한 값들 list에 add
					
					dto = new mySchduleDto();
					dto.setSl_code(sl_code);
					dto.setS_name(s_name);
					dto.setIs_deleted(is_deleted);
					for (int j = 0; j < area_name.size(); j++) {
						if (!area_name_result.contains(area_name.get(j))) {
							area_name_result.add(area_name.get(j));
						}
					}
					//System.out.println("areanameresult : " + area_name_result);

					area_name_result.removeAll(Collections.singleton(null));
					area_name.removeAll(Collections.singleton(null));
					dto.setArea_name(area_name_result.toString());
					//System.out.println("areaname : " + dto.getArea_name());
					dto.setTour_date_start(tour_date_start);
					dto.setTour_date_end(tour_date_end);
					dto.setRegi_date(regi_date);
					showList.add(dto);
					
					// 값 새로 세팅
					area_name_result.clear();
					area_name.clear();
					sl_code = planList.get(i).getSl_code();
					s_name = planList.get(i).getS_name();
					is_deleted = planList.get(i).getIs_deleted();
					area_name.add(planList.get(i).getArea_name());
					tour_date_start = planList.get(i).getTour_date_start();
					tour_date_end = planList.get(i).getTour_date_start();
					regi_date = planList.get(i).getRegi_date();

				}
				
				// 가장 마지막 값일 때 세팅한 값 list에 add하고 끝냄
				if (planList.size() - 1 == i) {
					dto = new mySchduleDto();
					dto.setSl_code(sl_code);
					dto.setS_name(s_name);
					dto.setIs_deleted(is_deleted);
					for (int j = 0; j < area_name.size(); j++) {
						if (!area_name_result.contains(area_name.get(j))) {
							area_name_result.add(area_name.get(j));
						}
					}
					//System.out.println("areanameresult : " + area_name_result);
					area_name.removeAll(Collections.singleton(null));
					area_name_result.removeAll(Collections.singleton(null));
					dto.setArea_name(area_name_result.toString());
					//System.out.println("areaname : " + dto.getArea_name());
					dto.setTour_date_start(tour_date_start);
					dto.setTour_date_end(tour_date_end);
					dto.setRegi_date(regi_date);
					showList.add(dto);
				}
					
			}
			
			// 지역명 중복 제거 및 areaName + sigunguName
			TreeSet<String> nameTree = new TreeSet<>();
			for(mySchduleDto mdto : planList) {
				String name = mdto.getArea_name() + "-" + mdto.getSigungu_name();
				nameTree.add(name);
			}
			
			
			request.setAttribute("nameTree", nameTree);
			request.setAttribute("showList", showList);
			request.setAttribute("email", email);
			
		} catch (Exception e ) {
			System.out.println(e.getMessage());
		}
		return "schedule.jsp";
	}
}
