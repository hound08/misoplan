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
	      String sql1 = "select min(sl_code) from SCHEDULELARGE where email = ? group by email";
	      String sql2 = "select l.sl_code,l.s_name, m.LOCAL_NAME, m.TOUR_DATE, l.REGI_DATE from   SCHEDULELARGE l, "
	      		+ "schedulemedium m where  l.sl_code = m.sl_code and    email = ? ";
	      String flag = null;
	      List<ArrayList<mySchduleDto>> planList = new ArrayList<ArrayList<mySchduleDto>>();
	      ArrayList<mySchduleDto> plan = new ArrayList<mySchduleDto>();
	      try {
		         conn = getConnection();
		         ps = conn.prepareStatement(sql1);
		         ps.setString(1, email);
		         rs = ps.executeQuery();
		         if (rs.next()) {
		        	 flag = rs.getString(1);
		        	 rs.close();
		        	 ps.close();
		        	 System.out.println("sql1");
		        	 ps = conn.prepareStatement(sql2);
		        	 ps.setString(1, email);
		        	 rs = ps.executeQuery();
		        	 System.out.println("sql2");
		        	 while(rs.next()){
		        		 if(flag.equals(rs.getString(1))){
		        			 mySchduleDto msdto = new mySchduleDto();
		        			 msdto.setS_name(rs.getString("s_name"));
		        			 msdto.setLocal_name(rs.getString("local_name"));
		        			 msdto.setTour_date(rs.getDate("tour_date"));
		        			 msdto.setRegi_date(rs.getDate("regi_date"));
		        			 System.out.println("@@@@ dao if");
		        			 plan.add(msdto);
		        		 }else{
		        			 System.out.println("@@@@ dao else");
		        			 planList.add(plan);
		        			 flag=rs.getString(1); // sl_code 가 바꾸면 아래가 새롭게 실행한다.
		        			 plan = new ArrayList<mySchduleDto>();
		        			 mySchduleDto msdto = new mySchduleDto();
		        			 msdto.setSl_code(rs.getString("sl_code"));
		        			 msdto.setS_name(rs.getString("s_name"));
		        			 msdto.setLocal_name(rs.getString("local_name"));
		        			 msdto.setTour_date(rs.getDate("tour_date"));
		        			 msdto.setRegi_date(rs.getDate("regi_date"));
		        			 plan.add(msdto);
		        		 }
		        		 planList.add(plan);
		        	 }
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
