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

public class mycompanionDao {

	private static mycompanionDao instance;
	
	private mycompanionDao() {
	}

	public static mycompanionDao getInstance() {
		if (instance == null) {
			instance = new mycompanionDao();
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
	
	
	public List<AccompanyBoardDto> select(String email) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from accompanyboard where email = ?";
		List<AccompanyBoardDto> list = new ArrayList<AccompanyBoardDto>();
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			rs = ps.executeQuery();
			while (rs.next()) {
				AccompanyBoardDto dto = new AccompanyBoardDto();
				dto.setTitle(rs.getString("title"));
				dto.setNickname(rs.getString("nickname"));
				dto.setCurrent_number(rs.getInt("current_number"));
				dto.setMinimum_number(rs.getInt("minimum_number"));
				dto.setReg_date(rs.getDate("reg_date"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (conn != null) conn.close();
		}
		return list;
	}
}
