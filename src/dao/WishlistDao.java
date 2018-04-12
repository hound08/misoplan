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

public class WishlistDao {
	private static WishlistDao instance;

	private WishlistDao() {
	}

	public static WishlistDao getInstance() {
		if (instance == null) {
			instance = new WishlistDao();
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

	public int wishCheck(int contentTypeId, int contendtid, String email) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result=0;
		
		String sql= "SELECT EMAIL FROM WISHLIST WHERE CONTENTTYPEID=? AND CONTENDTID=? AND EMAIL = ?";
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, contentTypeId);
			ps.setInt(2, contendtid);
			ps.setString(3, email);
			rs = ps.executeQuery();
			if(rs.next()){
				System.out.println("wishcheck IF");
				result = 1;
				System.out.println("wishdao wishcheck result 값 확인 -> " + result);
			}else{
				result = 0;
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

		return result;
	}

	public int addWishList(int contentTypeId, int contendtid, String email, String title) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		int result=0;
		String sql = "INSERT INTO WISHLIST VALUES (?,?,?,?)";
		
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, contentTypeId);
			ps.setInt(2, contendtid);
			ps.setString(3, email);
			ps.setString(4, title);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		}
		
		return result;
	}
}
