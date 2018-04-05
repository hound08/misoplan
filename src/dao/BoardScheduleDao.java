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
import javax.xml.transform.Result;

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
	            bs.setLocal_names(rs.getString(12));
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


	public List<BoardScheduleDto> selectList(String email) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<BoardScheduleDto> list = new ArrayList<BoardScheduleDto>();
		String sql1 = "SELECT SL_CODE FROM SCHEDULELARGE WHERE EMAIL = ?";
		String sql2 = "SELECT * FROM SCHEDULEMEDIUM WHERE SL_CODE = ?";
		
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql1);
			ps.setString(1, email);
			rs = ps.executeQuery();
			if ( rs.next() ) {
				String sl_code = rs.getString(1);
				rs.close();
				ps.close();
				ps = conn.prepareStatement(sql2);
				ps.setString(1,	sl_code);
				rs = ps.executeQuery();
				
				if(rs.next()) {
					do {
						BoardScheduleDto dto = new BoardScheduleDto();
						dto.setSl_code(rs.getString("SL_CODE"));
						dto.setSm_code(rs.getString("SM_CODE"));
						dto.setLocal_name(rs.getString("LOCAL_NAME"));
						dto.setLocal_code(rs.getString("LOCAL_CODE"));
						dto.setTour_date(rs.getDate("TOUR_DATE"));
						dto.setTour_text(rs.getString("TOUR_TEXT"));
						System.out.println("TOUR_TEXT : " + rs.getString("LOCAL_CODE"));
						list.add(dto);
					} while(rs.next());
				} else {
					System.out.println("대분류는 찾았으나 중분류를 찾지 못함!");
				}
			} else {
				System.out.println("해당 이메일에 맞는 대분류가 없음!");
			}
							
		}catch (Exception e ) {
			System.out.println(e.getMessage());
		} finally {
			if(ps != null) ps.close();
			if(conn != null) conn.close();
			if(rs != null) rs.close();
		}
		
		return list;
	}

	public int getTotalCnt() throws SQLException {
		Connection conn = null;
	      PreparedStatement ps = null;
	      ResultSet rs = null;
	      String sql = "SELECT COUNT(*) FROM BOARDSCHEDULE";
	      int result = 0;
	      
	      try {
	    	  conn = getConnection();
	          ps = conn.prepareStatement(sql);
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

	public List<ArrayList<BoardScheduleDto>> getMylist(String email) throws SQLException {
		  Connection conn = null;
	      PreparedStatement ps = null;
	      ResultSet rs = null;
	      String sql = "select l.sl_code,l.s_name, m.LOCAL_NAME, m.TOUR_DATE, l.REGI_DATE from   SCHEDULELARGE l, "
	      		+ "schedulemedium m where  l.sl_code = m.sl_code and    email = ? ";
	      List<ArrayList<BoardScheduleDto>> planList = new ArrayList<ArrayList<BoardScheduleDto>>();
	      ArrayList<BoardScheduleDto> plan = new ArrayList<BoardScheduleDto>();
	      try {
		         conn = getConnection();
		         ps = conn.prepareStatement(sql);
		         ps.setString(1, email);
		         rs = ps.executeQuery();

		         while (rs.next()) {
		            String flag = "11";
		            if(flag.equals(rs.getString(1))){
		            	BoardScheduleDto bsdto = new BoardScheduleDto();
		            	bsdto.setSl_code(rs.getString("sl_code"));
			            bsdto.setS_name(rs.getString("s_name"));
			            bsdto.setLocal_name(rs.getString("local_name"));
			            bsdto.setTour_date(rs.getDate("tour_date"));
			            bsdto.setRegi_date(rs.getDate("regi_date"));
			            plan.add(bsdto);
		            }else{
		            	planList.add(plan);
		            	flag = rs.getString(1);
		            	plan = new ArrayList<BoardScheduleDto>();
		            	BoardScheduleDto bsdto = new BoardScheduleDto();
		            	bsdto.setSl_code(rs.getString("sl_code"));
			            bsdto.setS_name(rs.getString("s_name"));
			            bsdto.setLocal_name(rs.getString("local_name"));
			            bsdto.setTour_date(rs.getDate("tour_date"));
			            bsdto.setRegi_date(rs.getDate("regi_date"));
			            plan.add(bsdto);
		            }
		         }
		         planList.add(plan);
		      } catch (Exception e) {
		         System.out.println(e.getMessage());
		      } finally {
		         if (rs != null)  rs.close();
		         if (ps != null)  ps.close();
		         if (conn != null) conn.close();
		      }
		      return planList;
		   }





	
	/*
	 * public int getTotalCnt() throws SQLException { 선생님 페이지창 참고자료 Connection
	 * conn = null; PreparedStatement ps = null; ResultSet rs = null; int result
	 * = 0; String sql = "SELECT COUNT(*) FROM BOARD";
	 * 
	 * try { conn = getConnection(); ps = conn.prepareStatement(sql); rs =
	 * ps.executeQuery();
	 * 
	 * 
	 * if (rs.next()) { result = rs.getInt(1); }
	 * 
	 * } catch (Exception e) { System.out.println(e.getMessage()); } finally {
	 * if (rs != null) rs.close(); if (ps != null) ps.close(); if (conn != null)
	 * conn.close(); } return result;
	 * 
	 * }
	 */
}