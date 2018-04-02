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
				System.out.println("^^^^^^^^^" + password);
				System.out.println("!@#!@#!@#" + rs.getString(1));

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
		String sql = "select * from member where email = 'yhoooj@naver.com'";
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			// ps.setString(1, email);
			rs = ps.executeQuery();
			if (rs.next()) {
				System.out.println("탄다!!!!!!!!!!!!");
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

}
