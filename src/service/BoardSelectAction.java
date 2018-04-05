package service;

import java.io.IOException;
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

public class BoardSelectAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			try {
				String email = request.getParameter("email");
				BoardScheduleDao dao = BoardScheduleDao.getInstance();
				List<BoardScheduleDto> list = dao.selectList(email);
				if (list == null) {
					request.setAttribute("list", list);
					return "BoardError.jsp";
			
				} else {
					request.setAttribute("list", list);
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			return "planSelect.jsp";
		}
		
	}


