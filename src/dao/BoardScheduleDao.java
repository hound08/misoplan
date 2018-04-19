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

import com.sun.xml.internal.ws.Closeable;

public class BoardScheduleDao {
	private static BoardScheduleDao instance;

	private BoardScheduleDao() {
	}

	public static BoardScheduleDao getInstance() {
		if (instance == null) {
			instance = new BoardScheduleDao();
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

	public BoardScheduleDto planselect(int bs_num) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from BOARDSCHEDULE where bs_num = ?";
		BoardScheduleDto dto = new BoardScheduleDto();
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, bs_num);
			rs = ps.executeQuery();
			if (rs.next()) {
				dto.setBs_num(rs.getInt("bs_num"));
				dto.setSl_code(rs.getString("sl_code"));
				dto.setNickname(rs.getString("nickname"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setImage_url(rs.getString("image_url"));
				dto.setVote_count(rs.getInt("vote_count"));
				dto.setView_count(rs.getInt("view_count"));
				dto.setBoard_date(rs.getDate("board_date"));
				dto.setSchedule_date(rs.getString("schedule_date"));
				dto.setArea_names(rs.getString("area_names"));
				
				System.out.println("@@@@@@@image_url : " + rs.getString("image_url"));
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

	public List<BoardScheduleDto> list() throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM BOARDSCHEDULE";
		List<BoardScheduleDto> list = new ArrayList<BoardScheduleDto>();
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);

			rs = ps.executeQuery();

			while (rs.next()) {
				BoardScheduleDto bs = new BoardScheduleDto();
				bs.setBs_num(rs.getInt(1));
				bs.setSl_code(rs.getString(2));
				bs.setEmail(rs.getString(3));
				bs.setNickname(rs.getString(4));
				bs.setTitle(rs.getString(5));
				bs.setTag(rs.getString(6));
				bs.setContent(rs.getString(7));
				bs.setImage_url(rs.getString(8));
				bs.setVote_count(rs.getInt(9));
				bs.setView_count(rs.getInt(10));
				bs.setBoard_date(rs.getDate(11));
				bs.setArea_names(rs.getString(12));
				list.add(bs);
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
		return list;

	}

	public int getTotalpost() throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int total = 0;
		
		String sql = "select count(*) from BOARDSCHEDULE";
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			total = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		}
		
		return total;
	}

	public int insertPlan(BoardScheduleDto dto, String nickname)
			throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "INSERT INTO BOARDSCHEDULE(BS_NUM, TITLE, TAG, NICKNAME, IMAGE_URL, CONTENT, AREA_NAMES, EMAIL, sl_code, SCHEDULE_DATE) VALUES (BS_NUM.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		int result = 0;
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			/* System.out.println("sl_code" + sl_code); */
			ps.setString(1, dto.getTitle());
			ps.setString(2, dto.getTag());
			ps.setString(3, dto.getNickname());
			ps.setString(4, dto.getImage_url());
			ps.setString(5, dto.getContent());
			ps.setString(6, dto.getArea_names());
			ps.setString(7, dto.getEmail());
			ps.setString(8, dto.getSl_code());
			ps.setString(9, dto.getSchedule_date());
			result = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		}
		System.out.println("result : " + result);

		return result;
	}

	public BoardScheduleDto select(int bs_num) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM BOARDSCHEDULE WHERE BS_NUM = ?";
		BoardScheduleDto dto = new BoardScheduleDto();

		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, bs_num);
			rs = ps.executeQuery();

			if (rs.next()) {
				dto.setBs_num(rs.getInt("bs_num"));
				dto.setSl_code(rs.getString("sl_code"));
				dto.setNickname(rs.getString("nickname"));
				dto.setTitle(rs.getString("title"));
				dto.setTag(rs.getString("tag"));
				dto.setContent(rs.getString("content"));
				dto.setImage_url(rs.getString("image_url"));
				dto.setVote_count(rs.getInt("vote_count"));
				dto.setView_count(rs.getInt("view_count"));
				dto.setBoard_date(rs.getDate("board_date"));
				dto.setSchedule_date(rs.getString("schedule_date"));
				dto.setArea_names(rs.getString("area_names"));
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

	public int update(BoardScheduleDto dto) {
		Connection conn = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = "UPDATE BOARDSCHEDULE SET TITLE=?, TAG=?, IMAGE_URL=?, CONTENT=? where BS_NUM=?";
		// UPDATE BOARDSCHEDULE SET TITLE='하하하', TAG='하하하하하', IMAGE_URL='하하하하',
		// CONTENT='히히히히히' where bs_num = 2;
		System.out.println("update 진입 성공");
		try {
			System.out.println("update try ");
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getTitle());
			System.out.println("여기냐1" + dto.getTitle());
			ps.setString(2, dto.getTag());
			System.out.println("여기냐2" + dto.getTag());
			ps.setString(3, dto.getImage_url());
			System.out.println("여기냐3" + dto.getImage_url());
			ps.setString(4, dto.getContent());
			System.out.println("여기냐4" + dto.getContent());
			ps.setInt(5, dto.getBs_num());
			System.out.println("여기냐5" + dto.getBs_num());

			result = ps.executeUpdate();
			System.out.println("try result " + result);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		System.out.println("result : " + result);
		return result;
	}
	
	
	public List<BoardScheduleDto> pagelist(int startRow, int endRow) throws SQLException {
		List<BoardScheduleDto> pagelist = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select * from "
					 + "(select rownum rn, a.* from (select * from BOARDSCHEDULE order by bs_num desc) a)"
					 + "where rn between ? and ?";
		
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, startRow);
			ps.setInt(2, endRow);
			rs = ps.executeQuery();
			while(rs.next()) {
				BoardScheduleDto dto = new BoardScheduleDto();
				dto.setBs_num(rs.getInt("bs_num"));
				dto.setNickname(rs.getString("nickname"));
				dto.setTitle(rs.getString("title"));
				dto.setImage_url(rs.getString("image_url"));
				dto.setContent(rs.getString("content"));
				dto.setTag(rs.getString("tag"));
				dto.setView_count(rs.getInt("view_count"));
				dto.setVote_count(rs.getInt("vote_count"));
				dto.setBoard_date(rs.getDate("board_date"));
				dto.setArea_names(rs.getString("area_names"));
				dto.setSl_code(rs.getString("sl_code"));
				
				pagelist.add(dto);
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
		System.out.println("listsize : " + pagelist.size());
		return pagelist;
	}
	public List<BoardScheduleDto> view_conut(int startRow, int endRow) throws SQLException {
		List<BoardScheduleDto> pagelist = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select * from "
					 + "(select rownum rn, a.* from (select * from BOARDSCHEDULE order by view_count desc) a)"
					 + "where rn between ? and ?";
		
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, startRow);
			ps.setInt(2, endRow);
			rs = ps.executeQuery();
			while(rs.next()) {
				BoardScheduleDto dto = new BoardScheduleDto();
				dto.setBs_num(rs.getInt("bs_num"));
				dto.setNickname(rs.getString("nickname"));
				dto.setTitle(rs.getString("title"));
				dto.setImage_url(rs.getString("image_url"));
				dto.setContent(rs.getString("content"));
				dto.setTag(rs.getString("tag"));
				dto.setView_count(rs.getInt("view_count"));
				dto.setVote_count(rs.getInt("vote_count"));
				dto.setBoard_date(rs.getDate("board_date"));
				dto.setArea_names(rs.getString("area_names"));
				dto.setSl_code(rs.getString("sl_code"));
				
				pagelist.add(dto);
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
		return pagelist;
	}
	public int delete(int bs_num, String email) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql1 = "select email from BOARDSCHEDULE where bs_num = ?";
		String sql2 = "delete from BOARDSCHEDULE where bs_num = ?";
		int result = 0;
		String dbemail = "";
		
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql1);
			ps.setInt(1, bs_num);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				dbemail = rs.getString("email");
				
				if (dbemail.equals(email)) {
					rs.close();
					ps.close();
					ps = conn.prepareStatement(sql2);
					ps.setInt(1, bs_num);
					result = ps.executeUpdate();
				} else {
					result = 0;
				}
			} else {
				result = -1;
			}
		}	finally {
			 if (rs != null) rs.close();
	         if (ps != null) ps.close(); 
	         if (conn != null) conn.close(); 
		}
		return result;
	}
	public void view_count(int bs_num)throws SQLException {
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		String sql = "update boardschedule set view_count = view_count+1 where bs_num = ?";
		
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, bs_num);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			 if (ps != null) ps.close(); 
	         if (conn != null) conn.close(); 
		}
		
	}
	public int getTotalVote(int bs_num) throws SQLException {
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int total = 0;
		
		String sql = "select vote_count from boardschedule where bs_num = ?";
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, bs_num);
			rs = ps.executeQuery();
			rs.next();
			total = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) rs.close();
	        if (ps != null) ps.close();
			if (conn != null) conn.close();
		}
		
		return total;
	}
	public void vote_count(int bs_num) throws SQLException {
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		String sql = "update boardschedule set vote_count = vote_count+1 where bs_num = ?";
		
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, bs_num);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			 if (ps != null) ps.close(); 
	         if (conn != null) conn.close(); 
		}
		
	}
	public void vote_down(int bs_num) throws SQLException {
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		String sql = "update boardschedule set vote_count = vote_count-1 where bs_num = ?";
		
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, bs_num);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conn != null) conn.close();
			if (ps != null) ps.close();
		}
		
	}
	
	public List<ReplyBoardScheduleDto> selectReply(int bs_num) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM REPLYBOARDSCHEDULE WHERE BS_NUM = ?";
		List<ReplyBoardScheduleDto> list = new ArrayList<ReplyBoardScheduleDto>();
		
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, bs_num);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				do {
					ReplyBoardScheduleDto dto = new ReplyBoardScheduleDto();
					dto.setRbs_num(rs.getInt(1));
					dto.setBs_num(rs.getInt(2));
					dto.setEmail(rs.getString(3));
					dto.setNickname(rs.getString(4));
					dto.setReply_content(rs.getString(5));
					dto.setReply_date(rs.getDate(6));
					dto.setProfile_url(rs.getString(7));
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
	public List<BoardScheduleDto> searchPage(String bar, int selected, int startRow, int endRow){
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<BoardScheduleDto> list = new ArrayList<BoardScheduleDto>();
		String sql = null;
		
		if(selected == 1) {
			sql = "select * from (select rownum rn, a.* from (select * from boardschedule where title like ? order by bs_num desc) a) where rn between ? and ?";
		} else if(selected == 2) {
			sql = "select * from (select rownum rn, a.* from (select * from boardschedule where area_names like ? order by bs_num desc) a) where rn between ? and ?";;
		} else if(selected == 3) {
			sql = "select * from (select rownum rn, a.* from (select * from boardschedule where nickname like ? order by bs_num desc) a) where rn between ? and ?";;
		} else {
			sql = "select * from (select rownum rn, a.* from (select * from boardschedule where content like ? order by bs_num desc) a) where rn between ? and ?";;
		}
		bar = "%" +  bar + "%";
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, bar);
			ps.setInt(2, startRow);
			ps.setInt(3, endRow);
			rs = ps.executeQuery();
			while(rs.next()) {
				BoardScheduleDto dto = new BoardScheduleDto();
				dto.setBs_num(rs.getInt("bs_num"));
				dto.setEmail(rs.getString("email"));
				dto.setNickname(rs.getString("nickname"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setImage_url(rs.getString("image_url"));
				dto.setView_count(rs.getInt("view_count"));
				dto.setVote_count(rs.getInt("vote_count"));
				dto.setBoard_date(rs.getDate("board_date"));
				dto.setArea_names(rs.getString("area_names"));
				dto.setSchedule_date(rs.getString("schedule_date"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) conn.close();
				if (rs != null) rs.close();
				if (ps != null) ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
		
	}
	public int getTotalselect(String bar, int selected) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int total = 0;
		
		String sql = null;
		if(selected == 1) {
			sql = "select count(*) from boardschedule where title like ?";
		} else if(selected == 2) {
			sql = "select count(*) from boardschedule where area_names like ?";
		} else if(selected == 3) {
			sql = "select count(*) from boardschedule where nickname like ?";
		} else {
			sql = "select count(*) from boardschedule where content like ?";
		}
		
		System.out.println("selected - > " + selected);
		bar = "%" +  bar + "%";
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, bar);
			rs = ps.executeQuery();
			rs.next();
			total = rs.getInt(1);
		}catch (Exception e ) {
			e.printStackTrace();
		}finally {
			try {
				if (conn != null) conn.close();
				if (rs != null) rs.close();
				if (ps != null) ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return total;
	}

}
