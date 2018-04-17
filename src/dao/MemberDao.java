package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

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
	
	public int nicknameCheck(String nickname) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM MEMBER WHERE NICKNAME = ?";
		int result = 0;
		
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, nickname);
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

	public MemberDto loginCheck(String email, String password) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT NICKNAME, PASSWORD, PROFILE_URL, MEMBER_ADMIN, BAN, BAN_DATE FROM MEMBER WHERE EMAIL = ?";
		MemberDto dto = new MemberDto();
		
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			rs = ps.executeQuery();

			if (rs.next()) {
				if (rs.getString(2).equals(password)) {
					dto.setEmail(email);
					dto.setNickname(rs.getString(1));
					dto.setProfile_url(rs.getString(3));
					dto.setMember_admin(rs.getInt(4));
					dto.setBan(rs.getInt(5));
					dto.setBan_date(rs.getDate(6));
				}
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
	
	public int myInfoLogin(String email, String password) throws SQLException {
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
		String sql1 = "update member set nickname =?, phone =?, profile_url = ? where email = ?" ;
		String sql2 = "update member set nickname =?, password =?, phone =?, profile_url = ? where email = ?" ;
		
		try {
			conn = getConnection();
			
			if (memberdto.getPassword() == null || memberdto.getPassword().equals("")) {
				ps = conn.prepareStatement(sql1);
				ps.setString(1, memberdto.getNickname());
				ps.setString(2, memberdto.getPhone());
				ps.setString(3, memberdto.getProfile_url());			   
				ps.setString(4, memberdto.getEmail());
			} else {
				ps = conn.prepareStatement(sql2);
				ps.setString(1, memberdto.getNickname());
				ps.setString(2, memberdto.getPassword());
				ps.setString(3, memberdto.getPhone());
				ps.setString(4, memberdto.getProfile_url());			   
				ps.setString(5, memberdto.getEmail());
			}

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
		String sql = "INSERT INTO MEMBER(EMAIL, NICKNAME, PASSWORD, PHONE, PROFILE_URL, IP_ADDRESS) VALUES(?, ?, ?, ?, ?, ?)";
		int result = 0;
		
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getEmail());
			ps.setString(2, dto.getNickname());
			ps.setString(3, dto.getPassword());
			ps.setString(4, dto.getPhone());
			ps.setString(5, dto.getProfile_url());
			ps.setString(6, dto.getIp_address());
			result = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (ps != null) ps.close();
			if (conn != null) conn.close();
		}
		
		return result;
	}
	
	public int updatePassword(String email, String password) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "UPDATE MEMBER SET PASSWORD = ? WHERE EMAIL = ?";
		int result = 0;
		
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, password);
			ps.setString(2, email);
			result = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (ps != null) ps.close();
			if (conn != null) conn.close();
		}
		
		return result;
	}
	
	public int selectAdminChk(String email) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT MEMBER_ADMIN FROM MEMBER WHERE EMAIL = ?";
		int result = 0;
		
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				if (rs.getInt(1) == 1) {
					result = 1;
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
	
	public int selectTotalCnt(int ban, MemberDto dtoSearch) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM MEMBER WHERE BAN LIKE ? AND EMAIL LIKE ? AND NICKNAME LIKE ? AND PHONE LIKE ?";
		
		String banResult = "%";
		
		if (ban == 1) {
			banResult = "1";
		}
		
		String email = "%" + dtoSearch.getEmail() + "%";
		String nickname = "%" + dtoSearch.getNickname() + "%";
		String phone = "%" + dtoSearch.getPhone() + "%";
		int result = 0;
		
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, banResult);
			ps.setString(2, email);
			ps.setString(3, nickname);
			ps.setString(4, phone);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				result = rs.getInt(1);
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
	
	public List<MemberDto> selectMemberList(int startRow, int endRow, int ban, MemberDto dtoSearch) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<MemberDto> list = new ArrayList<MemberDto>();
		MemberDto dto = new MemberDto();
		String sql = "SELECT EMAIL, NICKNAME, PHONE, MEMBER_SCORE, MEMBER_ADMIN, BAN, BAN_DATE, LEAVE, TO_CHAR(JOIN_DATE,'YYYY-MM-DD HH24:MI:SS') " +
					 "FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM MEMBER ORDER BY NICKNAME) A) " +
					 "WHERE RN BETWEEN ? AND ? AND BAN LIKE ? AND EMAIL LIKE ? AND NICKNAME LIKE ? AND PHONE LIKE ?";
		String banResult = "%";
		
		if (ban == 1) {
			banResult = "1";
		}
		
		String email = "%" + dtoSearch.getEmail() + "%";
		String nickname = "%" + dtoSearch.getNickname() + "%";
		String phone = "%" + dtoSearch.getPhone() + "%";
		
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, startRow);
			ps.setInt(2, endRow);
			ps.setString(3, banResult);
			ps.setString(4, email);
			ps.setString(5, nickname);
			ps.setString(6, phone);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				do {
					dto = new MemberDto();
					dto.setEmail(rs.getString(1));
					dto.setNickname(rs.getString(2));
					dto.setPhone(rs.getString(3));
					dto.setMember_score(rs.getInt(4));
					dto.setMember_admin(rs.getInt(5));
					dto.setBan(rs.getInt(6));
					dto.setBan_date(rs.getDate(7));
					dto.setLeave(rs.getInt(8));
					dto.setJoin_date_time(rs.getString(9));
					list.add(dto);
				} while (rs.next());
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {			
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (conn != null) conn.close();
		}
		
		return list;
	}
	
	public int updateMemberBan(int ban, String email) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "UPDATE MEMBER SET MEMBER_SCORE = MEMBER_SCORE - 100, BAN = ?, BAN_DATE = ? WHERE EMAIL = ?";
		int result = 0;
		
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, ban);
			ps.setString(3, email);
			
			if (ban == 0) {
				ps.setString(2, "");
			} else if (ban == 1) {
				Calendar cal = Calendar.getInstance();
				Date date = new Date(cal.getTimeInMillis());
				ps.setDate(2, date);
			}
			
			result = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {			
			if (ps != null) ps.close();
			if (conn != null) conn.close();
		}
		
		return result;
	}
	
	public int updateMemberAdmin(int admin, String email) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "UPDATE MEMBER SET MEMBER_ADMIN = ? WHERE EMAIL = ?";
		int result = 0;
		
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, admin);
			ps.setString(2, email);
			
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
