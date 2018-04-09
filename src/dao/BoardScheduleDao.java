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
import javax.xml.transform.Result;

public class BoardScheduleDao {
	private static BoardScheduleDao instance;

	private BoardScheduleDao() {
	}

	public static BoardScheduleDao getInstance() {
		if (instance == null) {
			instance = new BoardScheduleDao();
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

	public List<BoardScheduleDto> list() throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM BOARDSCHEDULE";
		List<BoardScheduleDto> list = new ArrayList<BoardScheduleDto>();
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);

			rs = ps.executeQuery();

			while (rs.next()) {
				BoardScheduleDto bs = new BoardScheduleDto();
				bs.setBs_num(rs.getInt(1));
				bs.setSl_code(rs.getString(2));
				bs.setEmail(rs.getString(3));
				bs.setNickname(rs.getString(4));
				bs.setTitle(rs.getString(5));
				bs.setTag(rs.getString(6));
				bs.setContent(rs.getString(7));
				bs.setImage_url(rs.getString(8));
				bs.setVote_count(rs.getInt(9));
				bs.setView_count(rs.getInt(10));
				bs.setBoard_date(rs.getDate(11));
				bs.setLocal_names(rs.getString(12));
				list.add(bs);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		}
		return list;

	}

	public List<mySchduleDto> selectList(String email) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql2 = "select l.sl_code,l.s_name, m.LOCAL_NAME, m.TOUR_DATE TOUR_DATE_START, l.REGI_DATE from   SCHEDULELARGE l, "
				+ "schedulemedium m where  l.sl_code = m.sl_code and    email = ? ";
		List<mySchduleDto> list = new ArrayList<mySchduleDto>();

		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql2);
			ps.setString(1, email);
			rs = ps.executeQuery();
			if(rs.next()) {
				do {
					mySchduleDto msdto = new mySchduleDto();
					msdto.setSl_code(rs.getString("sl_code"));
					msdto.setS_name(rs.getString("s_name"));
					msdto.setLocal_name(rs.getString("local_name"));
					msdto.setTour_date_start(rs.getDate("tour_date_start"));
					msdto.setRegi_date(rs.getDate("regi_date"));
					list.add(msdto);
				} while (rs.next());
			} else {
				list = null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		}

		return list;
	}

	public int getTotalCnt() throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM BOARDSCHEDULE";
		int result = 0;

		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}

	public int insertPlan(BoardScheduleDto dto, String nickname)
			throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql1 = "SELECT COUNT(*) FROM BOARDSCHEDULE";
		String sql2 = "INSERT INTO BOARDSCHEDULE(BS_NUM, TITLE, TAG, NICKNAME, IMAGE_URL, CONTENT) VALUES(?, ?, ?, ?, ?, ?)";
		int bs_num = 0;
		int result = 0;
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql1);
			rs = ps.executeQuery();
			if (rs.next()) {
				bs_num = rs.getInt(1) + 1;
			}

			rs.close();
			ps.close();

			ps = conn.prepareStatement(sql2);

			ps.setInt(1, bs_num);
			ps.setString(2, dto.getTitle());
			ps.setString(3, dto.getTag());
			ps.setString(4, dto.getNickname());
			ps.setString(5, dto.getImage_url());
			ps.setString(6, dto.getContent());
			result = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}
}
