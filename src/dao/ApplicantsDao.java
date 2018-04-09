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

public class ApplicantsDao {
	private static ApplicantsDao instance;
	
	private ApplicantsDao() {
	}

	public static ApplicantsDao getInstance() {
		if (instance == null) {
			instance = new ApplicantsDao();
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
	
	private List<ApplicantsDto> list(int bp_num) throws SQLException{
		Connection conn = null;
	    PreparedStatement ps = null;
	    ResultSet rs = null;
		String sql = "select * from applicants where post_num ";
		List<ApplicantsDto> applist = new ArrayList<ApplicantsDto>();
		try {
			 conn = getConnection();
	         ps = conn.prepareStatement(sql);
	         ps.setInt(1, bp_num);
	         rs = ps.executeQuery();
	         while(rs.next()){
	        	 ApplicantsDto dto = new ApplicantsDto();
	        	 dto.setPost_num(rs.getInt("post_num"));
	        	 dto.setEmail(rs.getString("email"));
	        	 dto.setNickname(rs.getString("nickname"));
	        	 dto.setStatus(rs.getString("status"));
	        	 dto.setMessage(rs.getString("message"));
	        	 dto.setKkkao_id(rs.getString("kakao_id"));
	        	 applist.add(dto);
	         }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
	         if (rs != null)  rs.close();
	         if (ps != null)  ps.close();
	         if (conn != null) conn.close();
	      }
		return applist;
	}
}
