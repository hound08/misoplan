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
				bs.setArea_names(rs.getString(12));
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
		String sql2 = "INSERT INTO BOARDSCHEDULE(BS_NUM, TITLE, TAG, NICKNAME, IMAGE_URL, CONTENT, AREA_NAMES) VALUES(?, ?, ?, ?, ?, ?, ?)";
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
			ps.setString(7, dto.getArea_names());
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
