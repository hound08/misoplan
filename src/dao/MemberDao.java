package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDao {

	private static MemberDao instance;

	private MemberDao() {
	}

	public static MemberDao getInstance() {
		if (instance == null) {
			instance = new MemberDao();
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

	public int loginCheck(String email, String password) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT PASSWORD FROM MEMBER WHERE EMAIL = ?";
		int result = 0;

		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			rs = ps.executeQuery();

			if (rs.next()) {
				if (rs.getString(1).equals(password)) {
					result = 1;
				} else {
					result = 0;
				}
			} else {
				result = -1;
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

		System.out.println("결과!!!!! : " + result);

		return result;
	}

	public MemberDto select(String email) throws SQLException {
		MemberDto dto = new MemberDto();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from member where email = ?";
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			rs = ps.executeQuery();
			if (rs.next()) {
				dto.setEmail(rs.getString("email"));
				dto.setNickname(rs.getString("nickname"));
				dto.setPassword(rs.getString("password"));
				dto.setPhone(rs.getString("phone"));
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
		return dto;
	}

	public int update(MemberDto memberdto) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = "update member set nickname =?, password =?, phone =? where email = ?" ;
		try {
			conn = getConnection();
			   ps = conn.prepareStatement(sql);
			   ps.setString(1, memberdto.getNickname());
			   ps.setString(2, memberdto.getPassword());
			   ps.setString(3, memberdto.getPhone());
			   ps.setString(4, memberdto.getEmail());
			   result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			 if (ps != null) ps.close();; 
		     if (conn != null) conn.close();
		}
		return result;
	}
	public static boolean nameChk(String Nickname) throws SQLException{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select Nickname from member ";
		try {
			 ps = conn.prepareStatement(sql);
			 rs = ps.executeQuery();
			 while(rs.next()){
				 if(rs.getString("Nickname").equals(Nickname)){
					 return true;
				 }
			 }
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			 if (ps != null) ps.close();; 
		     if (conn != null) conn.close();
		     if (rs != null) rs.close();
		}
		return false;
	}

}
