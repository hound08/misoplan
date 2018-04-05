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
	
	public int emailCheck(String email) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM MEMBER WHERE EMAIL = ?";
		int result = 0;
		
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				result = 1;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (conn != null) conn.close();
		}
		
		return result;
	}

	public String loginCheck(String email, String password) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT NICKNAME, PASSWORD FROM MEMBER WHERE EMAIL = ?";
		String result = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			rs = ps.executeQuery();

			if (rs.next()) {
				if (rs.getString(2).equals(password)) {
					result = rs.getString(1);
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (conn != null) conn.close();
		}

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
				dto.setProfile_url(rs.getString("profile_url"));
				System.out.println("select  profile_url->"+rs.getString("profile_url"));
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

	public int update(MemberDto memberdto) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = "update member set nickname =?, password =?, phone =?, profile_url = ? where email = ?" ;
		try {
			conn = getConnection();
			   ps = conn.prepareStatement(sql);
			   ps.setString(1, memberdto.getNickname());
			   ps.setString(2, memberdto.getPassword());
			   ps.setString(3, memberdto.getPhone());
				   ps.setString(4, memberdto.getProfile_url());			   
			   ps.setString(5, memberdto.getEmail());
			   System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+ memberdto.getProfile_url() );
			   result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			 if (ps != null) ps.close();; 
		     if (conn != null) conn.close();
		}
		return result;
	}
	
	public int nameChk(String Nickname) throws SQLException{
		int result  = 1;  				Connection conn = null;
		String sql  = "select Nickname from member where Nickname=?"; 
		PreparedStatement pstmt = null; ResultSet rs = null;
		try { 
			conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, Nickname);
			rs = pstmt.executeQuery();
			if (rs.next()) result = 1;
			else result = 0;
		} catch(Exception e) { System.out.println(e.getMessage());
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return result;
	}
	
	public int insertMember(MemberDto dto) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "INSERT INTO MEMBER(EMAIL, NICKNAME, PASSWORD, PHONE, PROFILE_URL) VALUES(?, ?, ?, ?, ?)";
		int result = 0;
		
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getEmail());
			ps.setString(2, dto.getNickname());
			ps.setString(3, dto.getPassword());
			ps.setString(4, dto.getPhone());
			ps.setString(5, dto.getProfile_url());
			result = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (ps != null) ps.close();
			if (conn != null) conn.close();
		}
		
		return result;
	}

}
