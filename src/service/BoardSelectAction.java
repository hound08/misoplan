package service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.Session;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sun.org.apache.bcel.internal.generic.MULTIANEWARRAY;
import com.sun.org.apache.xpath.internal.operations.Mult;

import dao.BoardScheduleDao;
import dao.BoardScheduleDto;
import dao.mySchduleDao;
import dao.mySchduleDto;

public class BoardSelectAction implements CommandProcess {

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
			List<String> local_name = new ArrayList<String>();
			Date tour_date_start = null;
			Date tour_date_end = null;
			Date regi_date = null;

			for (int i = 0; i < planList.size(); i++) {
				if (sl_code.equals(planList.get(i).getSl_code())) {		// SL_CODE가 같다면 덮어쓰면서 값 세팅
					s_name = planList.get(i).getS_name();
					local_name.add(planList.get(i).getLocal_name());

					if (i == 0) {
						tour_date_start = planList.get(i).getTour_date_start();
					}
					
					tour_date_end = planList.get(i).getTour_date_start();
					regi_date = planList.get(i).getRegi_date();
				} else {	// SL_CODE가 다르면 지금까지 세팅한 값들 list에 add
					dto = new mySchduleDto();
					dto.setSl_code(sl_code);
					dto.setS_name(s_name);
					local_name.removeAll(Collections.singleton(null));
					dto.setLocal_name(local_name.toString());
					dto.setTour_date_start(tour_date_start);
					dto.setTour_date_end(tour_date_end);
					dto.setRegi_date(regi_date);
					showList.add(dto);
					
					// 값 새로 세팅
					local_name.clear();
					sl_code = planList.get(i).getSl_code();
					s_name = planList.get(i).getS_name();
					local_name.add(planList.get(i).getLocal_name());
					tour_date_start = planList.get(i).getTour_date_start();
					tour_date_end = planList.get(i).getTour_date_start();
					regi_date = planList.get(i).getRegi_date();

				}
				
				// 가장 마지막 값일 때 세팅한 값 list에 add하고 끝냄
				if (planList.size() - 1 == i) {
					dto = new mySchduleDto();
					dto.setSl_code(sl_code);
					dto.setS_name(s_name);
					local_name.removeAll(Collections.singleton(null));
					dto.setLocal_name(local_name.toString());
					dto.setTour_date_start(tour_date_start);
					dto.setTour_date_end(tour_date_end);
					dto.setRegi_date(regi_date);
					showList.add(dto);
				}
					
			}

			request.setAttribute("showList", showList);
			request.setAttribute("email", email);
			
			if (showList == null) {
				request.setAttribute("showList", showList);
				return "BoardError.jsp";
		
			} else {
				request.setAttribute("showList", showList);
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
			return "planSelect.jsp";
		}
		
	}


