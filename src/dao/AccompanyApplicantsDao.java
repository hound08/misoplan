package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class AccompanyApplicantsDao {

private static AccompanyApplicantsDao instance; //instance
	
	private AccompanyApplicantsDao() {} //Constructor
	
	public static AccompanyApplicantsDao getInstance() {
		if(instance == null)
			instance = new AccompanyApplicantsDao();
		return instance;
	}//AccompanyApplicantsDao.getInstance
	
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}//AccompanyApplicantsDao.getConnection
	
	public void close(Connection conn) {
		if(conn != null)
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
	
	public void close(PreparedStatement pstmt) {
		if(pstmt != null)
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
	
	public void close(ResultSet rs) {
		if(rs != null)
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
	
	public int insert(AccompanyApplicantsDto dto) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "insert into applicants values(?,?,?,?,?,?,sysdate,?)";
		int result = 0;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getPost_num());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getNickname());
			pstmt.setInt(4, 0);
			pstmt.setString(5, dto.getMessage());
			pstmt.setString(6, dto.getKakao_id());
			pstmt.setInt(6, dto.getNum_people());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(conn);
		}
		return result;
	}
	
}
