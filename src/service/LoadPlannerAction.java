package service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoadPlannerAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AreaParser parser = new AreaParser();
		try {
			ArrayList<HashMap<String, Object>> areas = parser.parserTest();
			request.setAttribute("areas", areas);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "planner.jsp";
	}
}
