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
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (ps != null) {
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public void release(Connection conn, PreparedStatement ps) {

		if (ps != null) {
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
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
			if (rs.next()) {
				nextVal = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
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
		String sql1 = "INSERT INTO SCHEDULELARGE VALUES(?,?,?,sysdate, 0)";
		int result = 0;

		try {
			conn = getConnection();
			ps1 = conn.prepareStatement(sql1);
			ps1.setString(1, nextVal);
			ps1.setString(2, ldto.getEmail());
			ps1.setString(3, ldto.getS_name());
			ps1.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ps1 != null) {
				try {
					ps1.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		String sql2 = "INSERT INTO SCHEDULEMEDIUM VALUES(?,SM_CODE_SEQ.NEXTVAL,?,?,?,?,?)";
		try {
			ps2 = conn.prepareStatement(sql2);
			for (int i = 0; i < mArr.size(); i++) {
				ScheduleMediumDto mdto = mArr.get(i);
				ps2.setString(1, nextVal);
				ps2.setString(2, mdto.getArea_name());
				ps2.setString(3, mdto.getArea_code());
				ps2.setString(4, mdto.getSigungu_name());
				ps2.setString(5, mdto.getSigungu_code());
				ps2.setString(6, mdto.getTour_date());
				ps2.executeUpdate();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ps2 != null) {
				try {
					ps2.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		String sql3 = "INSERT INTO SCHEDULESMALL VALUES(?,SS_CODE_SEQ.NEXTVAL,SS_CODE_SEQ2.NEXTVAL,?,?,?,?,?,?)";
		try {
			ps3 = conn.prepareStatement(sql3);
			for (int i = 0; i < sArr.size(); i++) {
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

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ps3 != null) {
				try {
					ps3.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}// insertPlan() End

	public ScheduleLargeDto selectLarge(String sl_code) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM SCHEDULELARGE WHERE sl_code = ?";
		ScheduleLargeDto ldto = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, sl_code);
			rs = ps.executeQuery();

			while (rs.next()) {
				ldto = new ScheduleLargeDto();
				ldto.setSl_code(rs.getString(1));
				ldto.setEmail(rs.getString(2));
				ldto.setS_name(rs.getString(3));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			release(conn, ps, rs);
		}
		return ldto;
	}// selectLarge() End

	/*
	 * public ArrayList<ScheduleMediumDto> selectMedium(String sl_code) { Connection
	 * conn = null; PreparedStatement ps = null; ResultSet rs = null; String sql =
	 * "SELECT * FROM SCHEDULEMEDIUM WHERE sl_code = ?";
	 * ArrayList<ScheduleMediumDto> mArr = new ArrayList<>();
	 * 
	 * try { conn = getConnection(); ps = conn.prepareStatement(sql);
	 * ps.setString(1, sl_code); rs = ps.executeQuery();
	 * 
	 * while(rs.next()) { ScheduleMediumDto mdto = new ScheduleMediumDto();
	 * mdto.setSl_code(rs.getString(1)); mdto.setSm_code(rs.getString(2));
	 * mdto.setArea_name(rs.getString(3)); mdto.setArea_code(rs.getString(4));
	 * mdto.setSigungu_name(rs.getString(5)); mdto.setSigungu_code(rs.getString(6));
	 * mdto.setTour_date(rs.getString(7)); mArr.add(mdto); } }catch (Exception e) {
	 * e.printStackTrace(); }finally { release(conn, ps, rs); } return mArr; } //
	 * selectMedium() End
	 * 
	 * 
	 * public ArrayList<ScheduleSmallDto> selectSmall(String sl_code) { Connection
	 * conn = null; PreparedStatement ps = null; ResultSet rs = null; String sql =
	 * "SELECT * FROM SCHEDULESMALL WHERE sl_code = ?"; ArrayList<ScheduleSmallDto>
	 * sArr = new ArrayList<>();
	 * 
	 * try { conn = getConnection(); ps = conn.prepareStatement(sql);
	 * ps.setString(1, sl_code); rs = ps.executeQuery();
	 * 
	 * while(rs.next()) { ScheduleSmallDto sdto = new ScheduleSmallDto();
	 * sdto.setSl_code(rs.getString(1)); sdto.setSm_code(rs.getString(2));
	 * sdto.setSs_code(rs.getString(3)); sdto.setTour_name(rs.getString(4));
	 * sdto.setTour_code(rs.getString(5)); sdto.setCoord_x(rs.getDouble(6));
	 * sdto.setCoord_y(rs.getDouble(7)); sdto.setImage_url(rs.getString(8));
	 * sdto.setTour_text(rs.getString(9)); sArr.add(sdto); } }catch (Exception e) {
	 * e.printStackTrace(); }finally { release(conn, ps, rs); } return sArr; } //
	 * selectSmall() End
	 */

	public ArrayList<ScheduleLoadDto> selectPlan(String sl_code) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select m.area_name, m.area_code, m.sigungu_name, m.sigungu_code, m.tour_date, s.sl_code, s.sm_code, s.ss_code, s.tour_name, s.tour_code, s.coord_x, s.coord_y, s.image_url "
				+ "from schedulemedium m, schedulesmall s " 
				+ "where s.sm_code = m.sm_code "
				+ "and s.sl_code = ?";
		ArrayList<ScheduleLoadDto> loadArr = new ArrayList<>();
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, sl_code);
			rs = ps.executeQuery();

			while (rs.next()) {
				ScheduleLoadDto loadDto = new ScheduleLoadDto();
				loadDto.setArea_name(rs.getString(1));
				loadDto.setArea_code(rs.getString(2));
				loadDto.setSigungu_name(rs.getString(3));
				loadDto.setSigungu_code(rs.getString(4));
				loadDto.setTour_date(rs.getString(5));
				loadDto.setSl_code(rs.getString(6));
				loadDto.setSm_code(rs.getString(7));
				loadDto.setSs_code(rs.getString(8));
				loadDto.setTour_name(rs.getString(9));
				loadDto.setTour_code(rs.getString(10));
				loadDto.setCoord_x(rs.getDouble(11));
				loadDto.setCoord_y(rs.getDouble(12));
				loadDto.setImage_url(rs.getString(13));
				loadArr.add(loadDto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			release(conn, ps, rs);
		}
		return loadArr;
	}
	

	public int updatePlan(ScheduleLargeDto ldto, ArrayList<ScheduleMediumDto> mArr, ArrayList<ScheduleSmallDto> sArr) {
		Connection conn = null;
		PreparedStatement ps1 = null;
		PreparedStatement ps2= null;
		PreparedStatement ps3 = null;
		PreparedStatement ps4 = null;
		PreparedStatement ps5 = null;
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		int result4 = 0;
		int result5 = 0;
		
		String sql1 = "UPDATE SCHEDULELARGE SET s_name = ?, regi_date = sysdate WHERE sl_code = ?";
		try {
			conn = getConnection();
			ps1 = conn.prepareStatement(sql1);
			ps1.setString(1, ldto.getS_name());
			ps1.setString(2, ldto.getSl_code());
			
			result1 = ps1.executeUpdate();
			System.out.println("result1 : " + result1);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				ps1.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		String sql2 = "DELETE FROM SCHEDULESMALL WHERE sl_code = ?";
		try {
			ps2 = conn.prepareStatement(sql2);
			ps2.setString(1, ldto.getSl_code());
			result2 = ps2.executeUpdate();
			System.out.println("result2 : " + result2);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				ps2.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		String sql3 = "DELETE FROM SCHEDULEMEDIUM WHERE sl_code = ?";
		try {
			ps3 = conn.prepareStatement(sql3);
			ps3.setString(1, ldto.getSl_code());
			result3 = ps3.executeUpdate();
			System.out.println("result3 : " + result3);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				ps3.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		String sql4 = "INSERT INTO SCHEDULEMEDIUM VALUES(?,SM_CODE_SEQ.NEXTVAL,?,?,?,?,?)";
		try {
			ps4 = conn.prepareStatement(sql4);
			for (int i = 0; i < mArr.size(); i++) {
				ScheduleMediumDto mdto = mArr.get(i);
				ps4.setString(1, ldto.getSl_code());
				ps4.setString(2, mdto.getArea_name());
				ps4.setString(3, mdto.getArea_code());
				ps4.setString(4, mdto.getSigungu_name());
				ps4.setString(5, mdto.getSigungu_code());
				ps4.setString(6, mdto.getTour_date());
				result4 = ps4.executeUpdate();
				System.out.println("result4 : " + result4);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				ps4.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		String sql5 = "INSERT INTO SCHEDULESMALL VALUES(?,SS_CODE_SEQ.NEXTVAL,SS_CODE_SEQ2.NEXTVAL,?,?,?,?,?,?)";
		try {
			ps5 = conn.prepareStatement(sql5);
			for (int i = 0; i < sArr.size(); i++) {
				ScheduleSmallDto sdto = sArr.get(i);
				ps5.setString(1, ldto.getSl_code());
				ps5.setString(2, sdto.getTour_name());
				ps5.setString(3, sdto.getTour_code());
				ps5.setDouble(4, sdto.getCoord_x());
				ps5.setDouble(5, sdto.getCoord_y());
				ps5.setString(6, sdto.getImage_url());
				ps5.setString(7, sdto.getTour_text());
				result5 = ps5.executeUpdate();
				System.out.println("result5 : " + result5);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				ps5.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(result1 != 0 && result2 != 0 && result3 != 0 && result4 != 0 && result5 != 0) {
			return 1;
		}
		return 0;
	}

	public int deletePlan(String deleteId) {
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "UPDATE SCHEDULELARGE SET IS_DELETED = 1 WHERE SL_CODE=?";
		int result = 0;
		
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, deleteId);
			result = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			release(conn, ps);
		}
		return result;
	}
	
	public int check(String email) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql1 = "SELECT COUNT(*) FROM SCHEDULELARGE WHERE EMAIL=?";
		String sql2 = "SELECT IS_DELETED FROM SCHEDULELARGE WHERE EMAIL=?";
		
		int count = 0;
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql1);
			ps.setString(1, email);
			rs = ps.executeQuery();
			if(rs.next())
				count = rs.getInt(1);
		} catch (SQLException e1) {
			e1.printStackTrace();
		} finally {
			release(conn, ps, rs);
		}
		
		int result = 1;
		int is_deleted = 0;
		try{
			conn = getConnection();
			ps = conn.prepareStatement(sql2);
			ps.setString(1, email);
			rs = ps.executeQuery();
			while(rs.next()) {
				is_deleted += rs.getInt("IS_DELETED");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			release(conn, ps, rs);
		}
		if(is_deleted == count ) {
			result = 0;
		}
		return result;
	}
	
}
