package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class VotePlanDao {
private static VotePlanDao instance; //instance
	
	private VotePlanDao() {} //Constructor
	
	public static VotePlanDao getInstance() {
		if(instance == null)
			instance = new VotePlanDao();
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
	public int insert(VotePlanDto dto) throws SQLException {
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		int result = -1;
		
		String sql = "INSERT INTO VOTEPLAN VALUES (?, ?, ?)";
		
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getEmail() );
			ps.setInt(2, dto.getBs_num());
			ps.setString(3, dto.getIp_addr());
			result = ps.executeUpdate();
		} catch (Exception e ) {
			System.out.println(e.getMessage());
		}finally {
			if ( conn != null ) conn.close();
			if ( ps != null ) ps.close();
		}
		System.out.println("insert result : " + result);
		return result;
	}
	public int delete(VotePlanDto dto) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		int result = -1;
		
		String sql = "delete from voteplan where email=? or ip_addr=?";
		
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getEmail() );
			ps.setString(2, dto.getIp_addr());
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if ( conn != null ) conn.close();
			if ( ps != null ) ps.close();
		}
		System.out.println("delete result : " + result);
		return result;
	}
	
	public int check(VotePlanDto dto) throws SQLException {
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = -1;
		String sql = "select * from voteplan where (email=? and bs_num=?) or (ip_addr=? and bs_num=?)";
		
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getEmail());
			ps.setInt(2, dto.getBs_num());
			ps.setString(3, dto.getIp_addr());
			ps.setInt(4, dto.getBs_num());
			rs = ps.executeQuery();
			if(!rs.next())
				result = 0; //좋아요 누르지 않은 상태
			else 
				result = 1; // 좋아요 이미 누른 상태
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if ( conn != null ) conn.close();
			if ( ps != null ) ps.close();
			if ( rs != null ) rs.close();
		}
		System.out.println("checkresult : " + result);
		return result;
	}
	
}
