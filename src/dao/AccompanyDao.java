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
			pstmt.setString(4, accompanyBoardDto.getSl_code()); 
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
	
	public int getTotalVote(int post_num) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int total = 0;
		
		String sql = "select vote_count from accompanyboard where post_num = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, post_num);
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
	
	public List<AccompanyBoardDto> list_view(int startRow, int endRow){
		
		List<AccompanyBoardDto> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from (select rownum rn, a.* from (select *from accompanyboard order by view_count desc) a) where rn between ? and ?";
		
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
				accompanyDto.setPost_date(rs.getDate(12));
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
				accompanyDto.setPost_date(rs.getDate(12));
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
			board.setSl_code(rs.getString(4));
			board.setTitle(rs.getString(5));
			board.setImage_url(rs.getString(6));
			board.setContent(rs.getString(7));
			board.setTag(rs.getString(8));
			board.setView_count(rs.getInt(9));
			board.setVote_count(rs.getInt(10));
			board.setPost_date(rs.getDate(11));
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
	
	public String get_profile_url(String email) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select profile_url from member where email = ?";
		String profile_url = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
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

	public void vote_up(int post_num) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "update accompanyboard set vote_count = vote_count+1 where post_num = ?";
		
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
	
public void vote_down(int post_num) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "update accompanyboard set vote_count = vote_count-1 where post_num = ?";
		
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

	public List<AccompanyBoardDto> list_vote(int startRow, int endRow){
		
		List<AccompanyBoardDto> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from (select rownum rn, a.* from (select *from accompanyboard order by vote_count desc) a) where rn between ? and ?";
		
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
				accompanyDto.setPost_date(rs.getDate(12));
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
	
	public List<myPlanABDto> getMyPlan(String email){
		  Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String sql = "select distinct l.sl_code,l.s_name, m.AREA_NAME, m.TOUR_DATE TOUR_DATE_START, l.REGI_DATE from SCHEDULELARGE l, schedulemedium m where l.sl_code = m.sl_code and email = ? ORDER BY SL_CODE DESC, TOUR_DATE_START ASC";
	      List<myPlanABDto> planList = new ArrayList<myPlanABDto>();
	      
	      try {
		         conn = getConnection();
		         pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
		         pstmt.setString(1, email);
		         rs = pstmt.executeQuery();
		         
		         while(rs.next()){
		        	 myPlanABDto dto = new myPlanABDto();
		        	 ArrayList<String> areaList = new ArrayList<String>();
		        	 dto.setSl_code(rs.getString("sl_code"));
		        	 dto.setS_name(rs.getString("s_name"));
		        	 dto.setDate_start(String.valueOf(rs.getDate("tour_date_start")));
		        	 areaList.add(rs.getString("area_name"));
		        	 String s_name = rs.getString("s_name");
		        	 while(true) {
		        		 if(rs.next()) {
				        	 if( s_name.equals((rs.getString("s_name"))) ) {
				        		if(!areaList.contains(rs.getString("area_name")))
				        			areaList.add(rs.getString("area_name"));
				        	 } else {
				        		 rs.previous();
				        		 break;
				        	 }
		        		 } else {
			        		 rs.previous();
		        			 break;
		        		 }
		        	 }
		        	 dto.setArea_names(areaList);
		        	 dto.setDate_end(String.valueOf(rs.getDate("tour_date_start")));
		        	 dto.setRegi_date(String.valueOf(rs.getDate("regi_date")));
		        	 planList.add(dto);
		         }
		      } catch (Exception e) {
		         e.printStackTrace();
		      } finally {
		         close(rs);
		         close(pstmt);
		         close(conn);
		      }
		      return planList;
	}
	
	public List<AccompanyBoardDto> search(String keyword, int selected, int startRow, int endRow){
		
		Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    List<AccompanyBoardDto> list = new ArrayList<AccompanyBoardDto>();
	    String sql = null;
	    if(selected == 1) {
	    	sql = "select * from (select rownum rn, a.* from (select * from accompanyboard where title like ? order by post_num desc) a) where rn between ? and ?";
	    }else if(selected == 2) {
	    	sql = "select * from (select rownum rn, a.* from (select * from accompanyboard where nickname like ? order by post_num desc) a) where rn between ? and ?";
	    }else {
	    	sql = "select * from (select rownum rn, a.* from (select * from accompanyboard where tag like ? order by post_num desc) a) where rn between ? and ?";
	    }
	    keyword = "%" + keyword + "%";
	    try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				AccompanyBoardDto board = new AccompanyBoardDto();
				board.setPost_num(rs.getInt(2));
				board.setEmail(rs.getString(3));
				board.setNickname(rs.getString(4));
				board.setTitle(rs.getString(6));
				board.setImage_url(rs.getString(7));
				board.setContent(rs.getString(8));
				board.setTag(rs.getString(9));
				board.setView_count(rs.getInt(10));
				board.setVote_count(rs.getInt(11));
				board.setPost_date(rs.getDate(12));
				board.setClosing_date(rs.getDate(13));
				board.setMinimum_num(rs.getInt(14));
				board.setCurrent_num(rs.getInt(15));
				board.setIs_closed(rs.getInt(16));
				board.setComment_count(rs.getInt(17));
				list.add(board);
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

	public int getTotalSearchedPost(String keyword, int selected) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int total = 0;
		String sql = null;
		   if(selected == 1) {
		   	sql = "select count(*) from accompanyboard where title like ?";
		   }else if(selected == 2) {
		   	sql = "select count(*) from accompanyboard where nickname like ?";
		   }else {
		   	sql = "select count(*) from accompanyboard where tag like ?";
		   }
		keyword = "%" + keyword + "%";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
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

	public int closeApplication(int post_num) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE ACCOMPANYBOARD SET IS_CLOSED = ? WHERE POST_NUM = ?";
		
		int result = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 1);
			pstmt.setInt(2, post_num);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(conn);
		}
		return result;
	}
	
	public int delete(int post_num) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "DELETE FROM ACCOMPANYBOARD WHERE POST_NUM = ?";
		int result = -10;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, post_num);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(conn);
		}
		return result;
	}
}
