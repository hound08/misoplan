package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class VoteConfirmDao {
	
	private static VoteConfirmDao instance; //instance
	
	private VoteConfirmDao() {} //Constructor
	
	public static VoteConfirmDao getInstance() {
		if(instance == null)
			instance = new VoteConfirmDao();
		return instance;
	}//VoteConfirmDao.getInstance
	
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
	}//VoteConfirmDao.getConnection
	
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

	public int insert(VoteConfirmDto dto) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = -1;
		
		String sql = "insert into voteconfirm values(?,?,?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getEmail() );
			pstmt.setInt(2, dto.getPost_num());
			pstmt.setString(3, dto.getIp_addr());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(conn);
		}
		return result;
	}

	public int delete(VoteConfirmDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = -1;
		
		String sql = "delete from voteconfirm where email = ? or ip_addr = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getEmail() );
			pstmt.setString(2, dto.getIp_addr());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(conn);
		}
		return result;
	}
	
	public int check(VoteConfirmDto dto) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = -1;
		
		String sql = "select * from voteconfirm where (email=? and post_num=?) or (ip_addr=? and post_num=?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getEmail());
			pstmt.setInt(2, dto.getPost_num());
			pstmt.setString(3, dto.getIp_addr());
			pstmt.setInt(4, dto.getPost_num());
			rs = pstmt.executeQuery();
			if(!rs.next())
				result = 0; //좋아요 누르지 않은 상태
			else 
				result =1; // 좋아요 이미 누른 상태
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(conn);
		}
		
		return result;
	}
	
}
