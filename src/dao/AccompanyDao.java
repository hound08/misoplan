package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class AccompanyDao {

	private static AccompanyDao instance; //instance
	
	private AccompanyDao() {} //Constructor
	
	public static AccompanyDao getInstance() {
		if(instance == null)
			instance = new AccompanyDao();
		return instance;
	}//AccompanyDao.getInstance
	
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
	}//AccompanyDao.getConnection
	
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
	
	public int insert(AccompanyBoardDto accompanyBoardDto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		int num = 0;
		
		String sql1 = "Select nvl(max(post_num),0) from accompanyboard";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			rs.next();
			num = rs.getInt(1)+1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		String nickname = null;
		String sl_code = null;
		String sql2 = "select nickname, sl_code from accompanyboard where email = ?";
		try {
			pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1, accompanyBoardDto.getEmail());
			rs = pstmt.executeQuery();
			rs.next();
			nickname = rs.getString(1);
			sl_code = rs.getString(2);
		} catch (SQLException e1) {
			e1.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		String sql3 = "insert into accompanyboard values(?,?,?,?,?,?,?,?,?,?,sysdate,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql3);
			pstmt.setInt(1, num);
			pstmt.setString(2, accompanyBoardDto.getEmail()); 
			pstmt.setString(3, nickname); 
			pstmt.setString(4, sl_code); 
			pstmt.setString(5, accompanyBoardDto.getTitle());
			pstmt.setString(6, accompanyBoardDto.getImage_url());
			pstmt.setString(7, accompanyBoardDto.getContent());
			pstmt.setString(8, accompanyBoardDto.getTag());
			pstmt.setInt(9, 0);
			pstmt.setInt(10, 0);
			pstmt.setDate(12, accompanyBoardDto.getClosing_date()); 
			pstmt.setInt(13, accompanyBoardDto.getMinimum_number());
			pstmt.setInt(14, 1);
			pstmt.setInt(15, 0);
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
