package dao;

import java.sql.Array;
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

	public int wishCheck(WishlistDto dto) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result=0;
		
		String sql= "SELECT EMAIL FROM WISHLIST WHERE CONTENTTYPEID=? AND CONTENDTID=? AND EMAIL = ?";
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getContenttypeid());
			ps.setInt(2, dto.getContendtid());
			ps.setString(3, dto.getEmail());
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

	public int addWishList(WishlistDto dto) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		int result=0;
		String sql = "INSERT INTO WISHLIST VALUES (?, ?, ?, ?, ?, WISH_NUM.NEXTVAL)";
		
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getContenttypeid());
			ps.setInt(2, dto.getContendtid());
			ps.setString(3, dto.getEmail());
			ps.setString(4, dto.getTour_name());
			ps.setString(5, dto.getImg_src());
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

	public List<WishlistDto> select(String email, int startRow, int endRow){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select rnum, t.* "
						+ "from (select rownum rnum, a.* "
						+ "from (select * from WISHLIST where email = ? order by post_num desc) a "      
						+ ") t "
						+ " where rnum between ? and ?";
		
		List<WishlistDto> list = new ArrayList<WishlistDto>();
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setInt(2, startRow);
			ps.setInt(3, endRow);
			rs = ps.executeQuery();
			while (rs.next()) {
				WishlistDto dto = new WishlistDto();
				dto.setContenttypeid(rs.getInt("contenttypeid"));
				dto.setContendtid(rs.getInt("contendtid"));
				dto.setImg_src(rs.getString("img_src"));
				dto.setTour_name(rs.getString("tour_name"));
				dto.setEmail(rs.getString("email"));
				list.add(dto);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
				if (conn != null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}

	public int mydelete(String email, ArrayList<Integer> list) throws SQLException{
		Connection conn= null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = "delete from wishlist where email = ? and contendtid = ?";
		conn = getConnection();
		try {
			ps = conn.prepareStatement(sql);
			for(Integer contendtid : list){
			ps.setString(1, email);
			ps.setInt(2, contendtid);
			result = ps.executeUpdate();
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if(ps != null) ps.close();
			if(conn != null) conn.close();
		}
		return result;
	}

	public int getTotalPost(String email) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int total = 0;
		
		String sql = "select count(*) from WISHLIST where email = ?";
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			rs = ps.executeQuery();
			rs.next();
			total = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
				if (conn != null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return total;
	}
	
	public ArrayList<WishlistDto> getWishListforPlanner(String email) throws SQLException{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM WISHLIST WHERE EMAIL=?";
		ArrayList<WishlistDto> wArr = new ArrayList<>();
		
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				WishlistDto wdto = new WishlistDto();
				wdto.setContenttypeid(rs.getInt("contenttypeid"));
				wdto.setContendtid(rs.getInt("contendtid"));
				wArr.add(wdto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {
				rs.close();
			}
			if(ps != null) {
				ps.close();
			}
			if(conn != null) {
				conn.close();
			}
		}
		return wArr;
	}
}
