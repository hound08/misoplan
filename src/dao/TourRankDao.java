package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class TourRankDao {

	private static TourRankDao instance;
	private TourRankDao() {}
	
	public static TourRankDao getInstance() {
		if (instance == null) {
			instance = new TourRankDao();
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
	
	public TourRankDto selectList() throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM TOURRANK";
		TourRankDto dto = new TourRankDto();
		
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				dto.setTour_num(rs.getInt(1));
				dto.setTour_name(rs.getString(2));
				dto.setTour_code(rs.getString(3));
				dto.setImage_url(rs.getString(4));
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
	
}
