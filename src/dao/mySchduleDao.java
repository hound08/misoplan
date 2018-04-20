package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class mySchduleDao {
	private static mySchduleDao instance;
	
	private mySchduleDao() {
	}

	public static mySchduleDao getInstance() {
		if (instance == null) {
			instance = new mySchduleDao();
		}

		return instance;
	}

	private Connection getConnection() {
		Connection conn = null;

		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx
					.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return conn;
	}
	
	public List<mySchduleDto> getMylist(String email) throws SQLException {
		  Connection conn = null;
	      PreparedStatement ps = null;
	      ResultSet rs = null;
	      String sql2 = "select l.sl_code,l.s_name, m.AREA_NAME, m.sigungu_name, m.TOUR_DATE TOUR_DATE_START, l.REGI_DATE from SCHEDULELARGE l, "
	      		+ "schedulemedium m where  l.sl_code = m.sl_code and email = ?";
	      List<mySchduleDto> planList = new ArrayList<mySchduleDto>();
	      
	      try {
		         conn = getConnection();
		         ps = conn.prepareStatement(sql2);
		         ps.setString(1, email);
		         rs = ps.executeQuery();
		         
		         while(rs.next()){
		        	 mySchduleDto msdto = new mySchduleDto();
		        	 msdto.setSl_code(rs.getString("sl_code"));
		        	 msdto.setS_name(rs.getString("s_name"));
        			 msdto.setArea_name(rs.getString("area_name"));
        			 msdto.setSigungu_name(rs.getString("sigungu_name"));
        			 msdto.setTour_date_start(rs.getDate("tour_date_start"));
        			 msdto.setRegi_date(rs.getDate("regi_date"));
		        	 planList.add(msdto);
		         }
		      } catch (Exception e) {
		         e.printStackTrace();
		      } finally {
		         if (rs != null)  rs.close();
		         if (ps != null)  ps.close();
		         if (conn != null) conn.close();
		      }
	      
		      return planList;
	}
	
}
