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
	private BoardScheduleDao() {}
	
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
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return conn;
	}
	public BoardScheduleDto bsList() throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM BOARDSCHEDULE";
		BoardScheduleDto dto = new BoardScheduleDto();
		
		try{
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
		
		if (rs.next()) {
			dto.setBs_num(rs.getInt(1));
			dto.setSl_code(rs.getString(2));
			dto.setEmail(rs.getString(3));
			dto.setNickname(rs.getString(4));
			dto.setTitle(rs.getString(5));
			dto.setTag(rs.getString(6));
			dto.setContent(rs.getString(7));
			dto.setImage_url(rs.getString(8));
			dto.setVote_count(rs.getInt(9));
			dto.setView_count(rs.getInt(10));
			dto.setBoard_date(rs.getDate(11));
		}
	} catch (Exception e) {
		System.out.println(e.getMessage());
	} finally {
		if (rs != null) rs.close();
		if (ps != null) ps.close();
		if (conn != null) conn.close();
	}
	
	return dto;
}

	public List<BoardScheduleDto> list(int starRow, int endRow) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM BOARDSCHEDULE";
		List<BoardScheduleDto> list = new ArrayList<BoardScheduleDto>();
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, starRow);
			ps.setInt(2, endRow);
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
				list.add(bs);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close(); 
	        if (conn != null) conn.close(); 
		}
		return list;
		
	}
}