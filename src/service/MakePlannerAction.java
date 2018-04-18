package service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MakePlannerAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AreaParser areaParser = new AreaParser();
		try {
			ArrayList<HashMap<String, String>> areas = areaParser.getAreas();
			request.setAttribute("areasList", areas);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "planner.jsp";
	}
}
