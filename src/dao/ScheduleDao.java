package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ScheduleDao {

	private static ScheduleDao instance;
	private ScheduleDao() {
	}

	public static ScheduleDao getInstance() {
		if (instance == null) {
			instance = new ScheduleDao();
		}

		return instance;
	}// getInstance() end

	
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return conn;
	}// getConnection() End

	
	public void release(Connection conn, PreparedStatement ps, ResultSet rs) {
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(ps != null) {
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	public void release(Connection conn, PreparedStatement ps) {
		
		if(ps != null) {
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	public String getNextVal() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT SL_CODE_SEQ.NEXTVAL FROM DUAL";
		String nextVal = null;
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				nextVal = rs.getString(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			release(conn, ps, rs);
			System.out.println("nextVal : " + nextVal);
		}
		System.out.println("nextVal : " + nextVal);
		return nextVal;
	}
	
	
	public int insertPlan(ScheduleLargeDto ldto, ArrayList<ScheduleMediumDto> mArr, ArrayList<ScheduleSmallDto> sArr) {
		Connection conn = null;
		PreparedStatement ps1 = null;
		PreparedStatement ps2 = null;
		PreparedStatement ps3 = null;
		String nextVal = getNextVal();
		String sql1 = "INSERT INTO SCHEDULELARGE VALUES(?,?,?,sysdate)";
		int result = 0;
		
		try{
			conn = getConnection();
			ps1 = conn.prepareStatement(sql1);
			ps1.setString(1, nextVal);
			ps1.setString(2, ldto.getEmail());
			ps1.setString(3, ldto.getS_name());
			ps1.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(ps1 != null) {
				try {
					ps1.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		String sql2 = "INSERT INTO SCHEDULEMEDIUM VALUES(?,SM_CODE_SEQ.NEXTVAL,?,?,?,?,?)";
		try{
			ps2 = conn.prepareStatement(sql2);
			for(int i = 0; i < mArr.size(); i++) {
				ScheduleMediumDto mdto = mArr.get(i);
				ps2.setString(1, nextVal);
				ps2.setString(2, mdto.getArea_name());
				ps2.setString(3, mdto.getArea_code());
				ps2.setString(4, mdto.getSigungu_name());
				ps2.setString(5, mdto.getSigungu_code());
				ps2.setString(6, mdto.getTour_date());
				ps2.executeUpdate();
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(ps2 != null) {
				try {
					ps2.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		String sql3 = "INSERT INTO SCHEDULESMALL VALUES(?,SS_CODE_SEQ.NEXTVAL,SS_CODE_SEQ.NEXTVAL,?,?,?,?,?,?)";
		try{
			ps3 = conn.prepareStatement(sql3);
			for(int i = 0; i < sArr.size(); i++) {
				ScheduleSmallDto sdto = sArr.get(i);
				ps3.setString(1, nextVal);
				ps3.setString(2, sdto.getTour_name());
				ps3.setString(3, sdto.getTour_code());
				ps3.setDouble(4, sdto.getCoord_x());
				ps3.setDouble(5, sdto.getCoord_y());
				ps3.setString(6, sdto.getImage_url());
				ps3.setString(7, sdto.getTour_text());
				result = ps3.executeUpdate();
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(ps3 != null) {
				try {
					ps3.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}// insertPlan() End
	
	
	
	
}
