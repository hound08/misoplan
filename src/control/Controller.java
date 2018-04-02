package control;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommandProcess;

@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private Map<String, Object> commandMap = new HashMap<>();
	
    public Controller() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
		String props = config.getInitParameter("config"); // web.xml
		System.out.println(props);
		Properties pr = new Properties();
		FileInputStream f = null;
		try {
			String configFilePath = config.getServletContext().getRealPath(props);
			f = new FileInputStream(configFilePath);
			pr.load(f); // command.properties
		}catch(IOException e) {
			throw new ServletException(e);
		}finally {
			if(f != null) {
				try {
					f.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		Iterator keyIter = pr.keySet().iterator();
		while(keyIter.hasNext()) { 
			String command = (String)keyIter.next(); // list.do
			String className = pr.getProperty(command); // service.listAction
			try {
				Class commandClass = Class.forName(className);
				Object commandInstance = commandClass.newInstance();
				// ListAction la = new ListAction();
				commandMap.put(command, commandInstance);
			}catch (Exception e) {
				throw new ServletException(e);
			}
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}
	
	private void requestPro(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		String view = null;
		CommandProcess com = null;
		try {
			String command = request.getRequestURI();
			System.out.println(command);
			command = command.substring(request.getContextPath().length());
			com = (CommandProcess)commandMap.get(command);
			System.out.println("command -> " + command);
			System.out.println("com ->" + com);
			view = com.requestPro(request, response);
			System.out.println("view ->" + view);
		}catch (Exception e) {
			throw new ServletException(e);
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}// requestPro() end
}
