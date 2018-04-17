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

public class TourRankDao {

	private static TourRankDao instance;
	private TourRankDao() {}
	
	public static TourRankDao getInstance() {
		if (instance == null) {
			instance = new TourRankDao();
		}
		
		return instance;
	}
	
	private Connection getConnection() {
		Connection conn = null;
		
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return conn;
	}
	
	public List<TourRankDto> selectRankList() throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<TourRankDto> list = new ArrayList<TourRankDto>();
		String sql = "SELECT * FROM TOURRANK";
		
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				TourRankDto dto = new TourRankDto();
				dto.setTour_num(rs.getInt(1));
				dto.setTour_name(rs.getString(2));
				dto.setTour_code(rs.getString(3));
				dto.setImage_url(rs.getString(4));
				list.add(dto);
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
	
	public List<WishlistDto> selectWishList() throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<WishlistDto> list = new ArrayList<WishlistDto>();
		String sql = "SELECT TOUR_NAME, IMG_SRC, COUNT(TOUR_NAME) CNT FROM WISHLIST GROUP BY TOUR_NAME, IMG_SRC ORDER BY CNT DESC";
		
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				WishlistDto dto = new WishlistDto();
				dto.setTour_name(rs.getString(1));
				dto.setImg_src(rs.getString(2));
				list.add(dto);
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
	
	public int getNextVal() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT TOUR_RANK_SEQ.NEXTVAL FROM DUAL";
		int nextVal = 0;
		
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			nextVal = rs.getInt(1);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return nextVal;
	}  // getNextVal() End
	
	public void insertTour(ArrayList<ScheduleSmallDto> sArr) {
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "INSERT INTO TOURRANK VALUES (TOUR_RANK_SEQ.NEXTVAL,?,?,?)";
		getNextVal();
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			for(int i = 0; i < sArr.size(); i++) {
				ScheduleSmallDto sdto = sArr.get(i);
				ps.setString(1, sdto.getTour_name());
				ps.setString(2, sdto.getTour_code());
				ps.setString(3, sdto.getImage_url());
				ps.executeQuery();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	} // insertTour() End
	
}
