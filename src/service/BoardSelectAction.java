package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.Session;

import dao.BoardScheduleDao;
import dao.BoardScheduleDto;

public class BoardSelectAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			try {
				System.out.println("카카카카카카카ㅏ카ㅏ");
				String email = request.getParameter("email");
				BoardScheduleDao dao = BoardScheduleDao.getInstance();
				List<BoardScheduleDto> list = dao.selectList(email);
				
				if (list == null) {
					System.out.println("널이다!!!!!!!!!!!!!!!");
					return "main.do";
			
				} else {
					request.setAttribute("list", list);
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			
			return "planSelect.jsp";
		}
		
	}


