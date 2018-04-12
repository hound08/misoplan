package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

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
		
		String sql1 = "select nvl(max(post_num),0) from accompanyboard";
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
		
		/*String sl_code = null;
		String sql3 = "select from sl_code schedulelarge where email = ?";
		try {
			pstmt = conn.prepareStatement(sql3);
			pstmt.setString(1, accompanyBoardDto.getEmail());
			rs = pstmt.executeQuery();
			rs.next();
			sl_code = rs.getString(1);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}*/
		
		String sql4 = "insert into accompanyboard values(?,?,?,?,?,?,?,?,?,?,sysdate,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql4);
			pstmt.setInt(1, num);
			pstmt.setString(2, accompanyBoardDto.getEmail()); 
			pstmt.setString(3, accompanyBoardDto.getNickname()); 
			pstmt.setString(4, null); 
			pstmt.setString(5, accompanyBoardDto.getTitle());
			pstmt.setString(6, accompanyBoardDto.getImage_url());
			pstmt.setString(7, accompanyBoardDto.getContent());
			pstmt.setString(8, accompanyBoardDto.getTag());
			pstmt.setInt(9, 0);
			pstmt.setInt(10, 0);
			pstmt.setDate(11, accompanyBoardDto.getClosing_date()); 
			pstmt.setInt(12, accompanyBoardDto.getMinimum_num());
			pstmt.setInt(13, 1);
			pstmt.setInt(14, 0);
			pstmt.setInt(15, 0);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(conn);
		}
		System.out.println("result = " + result);
		return result;
	}
	
	public int getTotalPost() {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int total = 0;
		
		String sql = "select count(*) from accompanyboard";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			total = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(conn);
		}
		
		return total;
	}

	public List<AccompanyBoardDto> list(int startRow, int endRow){
		
		List<AccompanyBoardDto> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from (select rownum rn, a.* from (select *from accompanyboard order by post_num desc) a) where rn between ? and ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				AccompanyBoardDto accompanyDto = new AccompanyBoardDto();
				accompanyDto.setPost_num(rs.getInt(2));
				accompanyDto.setNickname(rs.getString(4));
				accompanyDto.setTitle(rs.getString(6));
				accompanyDto.setImage_url(rs.getString(7));
				accompanyDto.setContent(rs.getString(8));
				accompanyDto.setTag(rs.getString(9));
				accompanyDto.setView_count(rs.getInt(10));
				accompanyDto.setVote_count(rs.getInt(11));
				accompanyDto.setReg_date(rs.getDate(12));
				accompanyDto.setMinimum_num(rs.getInt(14));
				accompanyDto.setCurrent_num(rs.getInt(15));
				accompanyDto.setIs_closed(rs.getInt(16));
				accompanyDto.setComment_count(rs.getInt(17));
				
				list.add(accompanyDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(conn);
		}
		
		return list;
	}

	public void view_count(int post_num) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "update accompanyboard set view_count = view_count+1 where post_num = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, post_num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(conn);
		}
		
	}
	
	public void comment_count(int post_num) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "update accompanyboard set comment_count = comment_count+1 where post_num = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, post_num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(conn);
		}
		
	}

	public AccompanyBoardDto select(int post_num) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		AccompanyBoardDto board = new AccompanyBoardDto();
		String sql = "select * from accompanyboard where post_num = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, post_num);
			rs = pstmt.executeQuery();
			rs.next();
			board.setEmail(rs.getString(2));
			board.setNickname(rs.getString(3));
			board.setTitle(rs.getString(5));
			board.setImage_url(rs.getString(6));
			board.setContent(rs.getString(7));
			board.setTag(rs.getString(8));
			board.setView_count(rs.getInt(9));
			board.setVote_count(rs.getInt(10));
			board.setReg_date(rs.getDate(11));
			board.setClosing_date(rs.getDate(12));
			board.setMinimum_num(rs.getInt(13));
			board.setCurrent_num(rs.getInt(14));
			board.setIs_closed(rs.getInt(15));
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(conn);
		}
		return board;
	}
	
	public String get_profile_url(int post_num) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select profile_url from member where email = (select email from accompanyboard where post_num = ?)";
		String profile_url = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, post_num);
			rs = pstmt.executeQuery();
			rs.next();
			profile_url = rs.getString(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { 
			close(rs);
			close(pstmt);
			close(conn);
		}
		return profile_url;
	}
}
