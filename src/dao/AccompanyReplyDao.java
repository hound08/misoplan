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

public class AccompanyReplyDao {
	
	private static AccompanyReplyDao instance; //instance
	
	private AccompanyReplyDao() {} //Constructor
	
	public static AccompanyReplyDao getInstance() {
		if(instance == null)
			instance = new AccompanyReplyDao();
		return instance;
	}//AccompanyReplyDao.getInstance
	
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
	}//AccompanyReplyDao.getConnection
	
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
	
	public int insert(AccompanyReplyDto accompanyReplyDto) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = 0;
		
		String sql1 = "select nvl(max(rp_num),0) from replyaccompany";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			rs.next();
			num = rs.getInt(1)+1;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		String sql2 = "insert into replyaccompany values(?,?,?,?,?,sysdate)";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, num);
			pstmt.setInt(2, accompanyReplyDto.getPost_num());
			pstmt.setString(3, accompanyReplyDto.getEmail());
			pstmt.setString(4, accompanyReplyDto.getNickname());
			pstmt.setString(5, accompanyReplyDto.getContent());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(conn);
		}
		
		return result;
	}
	
	public List<AccompanyReplyDto> list(int post_num){
		
		List<AccompanyReplyDto> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from (select rownum rn, a.* from (select * from replyaccompany where post_num = ? order by rp_num desc) a)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, post_num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				AccompanyReplyDto dto = new AccompanyReplyDto();
				dto.setRp_num(rs.getInt(2));
				dto.setPost_num(rs.getInt(3));
				dto.setEmail(rs.getString(4));
				dto.setNickname(rs.getString(5));
				dto.setContent(rs.getString(6));
				dto.setReply_date(rs.getDate(7));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
}
