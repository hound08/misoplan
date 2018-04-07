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
	
	public List<ArrayList<mySchduleDto>> getMylist(String email) throws SQLException {
		  Connection conn = null;
	      PreparedStatement ps = null;
	      ResultSet rs = null;
	      String sql = "select l.sl_code,l.s_name, m.LOCAL_NAME, m.TOUR_DATE, l.REGI_DATE from   SCHEDULELARGE l, "
	      		+ "schedulemedium m where  l.sl_code = m.sl_code and    email = ? ";
	      List<ArrayList<mySchduleDto>> planList = new ArrayList<ArrayList<mySchduleDto>>();
	      ArrayList<mySchduleDto> plan = new ArrayList<mySchduleDto>();
	      try {
		         conn = getConnection();
		         ps = conn.prepareStatement(sql);
		         ps.setString(1, email);
		         rs = ps.executeQuery();

		         while (rs.next()) {
		            String flag = "11";
		            if(flag.equals(rs.getString(1))){
		            	mySchduleDto msdto = new mySchduleDto();
		            	msdto.setSl_code(rs.getString("sl_code"));
		            	msdto.setS_name(rs.getString("s_name"));
		            	msdto.setLocal_name(rs.getString("local_name"));
		            	msdto.setTour_date(rs.getDate("tour_date"));
		            	msdto.setRegi_date(rs.getDate("regi_date"));
			            plan.add(msdto);
		            }else{
		            	planList.add(plan);
		            	flag = rs.getString(1);
		            	plan = new ArrayList<mySchduleDto>();
		            	mySchduleDto msdto = new mySchduleDto();
		            	msdto.setSl_code(rs.getString("sl_code"));
		            	msdto.setS_name(rs.getString("s_name"));
		            	msdto.setLocal_name(rs.getString("local_name"));
		            	msdto.setTour_date(rs.getDate("tour_date"));
		            	msdto.setRegi_date(rs.getDate("regi_date"));
			            plan.add(msdto);
		            }
		         }
		         planList.add(plan);
		      } catch (Exception e) {
		         System.out.println(e.getMessage());
		      } finally {
		         if (rs != null)  rs.close();
		         if (ps != null)  ps.close();
		         if (conn != null) conn.close();
		      }
		      return planList;
		   }
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
