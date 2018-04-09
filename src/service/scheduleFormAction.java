package service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.mySchduleDao;
import dao.mySchduleDto;

public class scheduleFormAction implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("@@@@@@scheduleformaction 진입성공");
		try {
			String email = request.getParameter("email");
			mySchduleDao msdao = mySchduleDao.getInstance();
			List<mySchduleDto> planList = msdao.getMylist(email);
			List<mySchduleDto> showList = new ArrayList<mySchduleDto>();
			
			String sl_code = planList.get(0).getSl_code();
			String sl_code_current = "";
			String[] local_name = new String[planList.size()];
			Date[] tour_date = new Date[planList.size()];
			int tour_date_current = 0;
			
			for (int i = 0; i <= planList.size(); i++) {
				sl_code_current = planList.get(i).getSl_code();

				if (sl_code_current.equals(sl_code)) {
					local_name[i] = planList.get(i).getLocal_name();
					tour_date[i] = planList.get(i).getTour_date_start();
				} else {
					tour_date_current = i;
					sl_code = planList.get(i - 1).getSl_code();
					mySchduleDto dto = new mySchduleDto();
					dto.setSl_code(sl_code);
					dto.setS_name(planList.get(i - 1).getS_name());
					dto.setLocal_name(Arrays.toString(local_name));
					dto.setTour_date_start(tour_date[i - tour_date_current]);
					dto.setTour_date_end(tour_date[i - 1]);
					dto.setRegi_date(planList.get(i - 1).getRegi_date());
					showList.add(dto);
				}
			}
			
			
			System.out.println("---------------------------");
			System.out.println(showList.get(0).getSl_code());
			System.out.println(showList.get(0).getS_name());
			System.out.println(showList.get(0).getLocal_name());
			System.out.println(showList.get(0).getTour_date_start());
			System.out.println(showList.get(0).getTour_date_end());
			System.out.println(showList.get(0).getRegi_date());
			System.out.println("---------------------------");
			System.out.println(showList.get(1).getSl_code());
			System.out.println(showList.get(1).getS_name());
			System.out.println(showList.get(1).getLocal_name());
			System.out.println(showList.get(1).getTour_date_start());
			System.out.println(showList.get(1).getTour_date_end());
			System.out.println(showList.get(1).getRegi_date());
			System.out.println("---------------------------");
			
//			List<ArrayList<mySchduleDto>> plan = msdao.getMylist(email);
			
//			List<ArrayList<mySchduleDto>> requestPlanList = null;
//			ArrayList<mySchduleDto> requestPlan = null;
			/*for(int i = 0; i < planList.size(); i++){
				ArrayList<mySchduleDto> plan = planList.get(i);
				for(int j = 0; j < plan.size(); j++){
					mySchduleDto msdto = plan.get(j);
						String s_name = msdto.getS_name();
						String local_name = msdto.getLocal_name();
						Date tour_date = msdto.getTour_date();
						Date regi_date = msdto.getRegi_date();
				}
			}*/
			System.out.println("planList 사이즈 = "+planList.size());
			/*for (int i = 0; i < planList.size(); i++) {
				System.out.println("planlist index -> " + i);
				for (int j = 0; j < plan.size(); j++) {
					
					System.out.println("planList index = "+ i +" value" + planList.get(i).get(j).getLocal_name());
				}
			}*/
			/*for (int i = 0; i < planList.size(); i++) {
				int index =0;
				String sl_code="";
				String s_name="";
				String local_name="";
				String tour_date;
				String regi_date;
				if(planList.get(i).get(index).getSl_code()==planList.get(i).get(index+1).getSl_code()){
					for(int j = 0; j < planList.get(i).size(); j++){
						sl_code = planList.get(i).get(j).getSl_code();
						s_name = planList.get(i).get(j).getS_name();
						local_name += "["+ planList.get(i).get(j).getLocal_name() +"]";
					}
					
				}
					if(Integer.parseInt(planList.get(i).get(index).getSl_code())==11){
						System.out.println("11번인애들");
						System.out.println("planList = "+ i +" 번째" + planList.get(i).get(index).getLocal_name());
						System.out.println("planList = "+ i +" 번째" + planList.get(i).get(index).getS_name());
						System.out.println("planList = "+ i +" 번째" + planList.get(i).get(index).getRegi_date());
						System.out.println("planList = "+ i +" 번째" + planList.get(i).get(index).getTour_date());
						System.out.println("");
						index++;
					}else if(Integer.parseInt(planList.get(i).get(index).getSl_code())==12){
						System.out.println("12번인애들");
						System.out.println("planList = "+ i +" 번째" + planList.get(i).get(index).getLocal_name());
						System.out.println("planList = "+ i +" 번째" + planList.get(i).get(index).getS_name());
						System.out.println("planList = "+ i +" 번째" + planList.get(i).get(index).getRegi_date());
						System.out.println("planList = "+ i +" 번째" + planList.get(i).get(index).getTour_date());
						System.out.println("");
					}
				
			}*/

			request.setAttribute("showList", showList);
			//request.setAttribute("plan", plan);
			request.setAttribute("email", email);
			
		} catch (Exception e ) {
			System.out.println(e.getMessage());
		}
		return "schedule.jsp";
	}
}
