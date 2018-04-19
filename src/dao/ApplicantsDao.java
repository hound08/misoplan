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


public class ApplicantsDao {
	private static ApplicantsDao instance;
	
	private ApplicantsDao() {
	}

	public static ApplicantsDao getInstance() {
		if (instance == null) {
			instance = new ApplicantsDao();
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
	
	public List<ApplicantsDto> youappselect(int post_num) throws SQLException{
		Connection conn = null;
	    PreparedStatement ps = null;
	    ResultSet rs = null;
		String sql = "select * from applicants where post_num = ?";
		List<ApplicantsDto> applist = new ArrayList<ApplicantsDto>();
		System.out.println("dao"+ post_num);
		try {
			 conn = getConnection();
	         ps = conn.prepareStatement(sql);
	         ps.setInt(1, post_num);
	         rs = ps.executeQuery();
	         while(rs.next()){
	        	 ApplicantsDto dto = new ApplicantsDto();
	        	 dto.setMessage(rs.getString("message"));
	        	 dto.setNickname(rs.getString("nickname"));
	        	 dto.setStatus(rs.getInt("status"));
	        	 dto.setApplicants_date(rs.getDate("applicants_date"));
	        	 dto.setKakao_id(rs.getString("kakao_id"));
	        	 dto.setNum_people(rs.getInt("num_people"));
	        	 dto.setEmail(rs.getString("email"));
	        	 dto.setPost_num(rs.getInt("post_num"));
	        	 applist.add(dto);
	         }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
	         if (rs != null)  rs.close();
	         if (ps != null)  ps.close();
	         if (conn != null) conn.close();
	      }
		return applist;
	}
	
	public List<ApplicantsDto> myappselect(String email) throws SQLException{
		Connection conn = null;
	    PreparedStatement ps = null;
	    ResultSet rs = null;
		String sql = "select * from applicants where email = ?";
		System.out.println("myappselect email = "+ email);
		List<ApplicantsDto> myapplist = new ArrayList<ApplicantsDto>();
		try {
			 conn = getConnection();
	         ps = conn.prepareStatement(sql);
	         ps.setString(1, email);
	         rs = ps.executeQuery();
	         while(rs.next()){
	        	 ApplicantsDto dto = new ApplicantsDto();
	        	 dto.setMessage(rs.getString("message"));
	        	 dto.setNickname(rs.getString("nickname"));
	        	 dto.setStatus(rs.getInt("status"));
	        	 dto.setApplicants_date(rs.getDate("applicants_date"));
	        	 dto.setKakao_id(rs.getString("kakao_id"));
	        	 dto.setPost_num(rs.getInt("post_num"));
	        	 System.out.println("post_num"+rs.getInt("post_num"));
	        	 myapplist.add(dto);
	         }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
	         if (rs != null)  rs.close();
	         if (ps != null)  ps.close();
	         if (conn != null) conn.close();
	      }
		return myapplist;
	}
	
	public int update(ApplicantsDto appdto, AccompanyBoardDto abdto){
		Connection conn = null;
		PreparedStatement ps = null;
		int result = 0;
		int status = 0;
		ResultSet rs = null;
		String sql = "select Status from applicants where  nickname= ? and post_num = ? "; 
		String sql1 = "SELECT CURRENT_NUM, MINIMUM_NUM FROM ACCOMPANYBOARD where POST_NUM = ?";
		String sql2 ="update applicants set status = ? where nickname = ? and post_num = ?";
		String sql3 ="update ACCOMPANYBOARD set CURRENT_NUM= ?  where post_num= ?";
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, appdto.getNickname());
			ps.setInt(2, appdto.getPost_num());
			rs= ps.executeQuery();
			int st =0;
			if(rs.next()){
				st = rs.getInt("status");
			} 
			ps.close();
			rs.close();
			//리턴을 0 (대기) 1 (수락) 2 (거절)
			// status = 0 (대기) 에서 status = 1 로 업데이트
			// 0 인 상황
			if( st == 0){
				ps = conn.prepareStatement(sql2);   // 상태 업데이트
				ps.setInt(1, appdto.getStatus());
				ps.setString(2, appdto.getNickname());
				ps.setInt(3, appdto.getPost_num());
				result = ps.executeUpdate();
				ps.close();
				// 현재 인원에 + 동행 신청한 사람 인원수를 더해 주는 업데이트
				ps = conn.prepareStatement(sql1);
				ps.setInt(1, appdto.getPost_num());
				rs = ps.executeQuery();
				if(rs.next()){
					int current_num = rs.getInt("current_num");
					int minimum_num = rs.getInt("minimum_num");
					ps.close();
					rs.close();
					ps = conn.prepareStatement(sql3);
					int Num_people = appdto.getNum_people();
					ps.setInt(1, Num_people+current_num);
					ps.setInt(2, appdto.getPost_num());
					result = ps.executeUpdate();
				}
				
				status =  1;
				
			}
			// status = 1(수락 된 상황)에서 수락을 또 누른 상태
			else if(st == 1){
				
				status = 3; //임시로 3 저장(왜냐, 정의를 못내리겠어)
				
			}
			//status = 2(거절인 상황) 인 상황에서 수락을 누른상태 ==> status =1 로 바꿔줘야됨
			else if( st == 2){
				ps = conn.prepareStatement(sql2);   // 상태 업데이트
				ps.setInt(1, appdto.getStatus());
				ps.setString(2, appdto.getNickname());
				ps.setInt(3, appdto.getPost_num());
				result = ps.executeUpdate();
				ps.close();
				ps.close();
				ps = conn.prepareStatement(sql1);
				ps.setInt(1, appdto.getPost_num());
				rs = ps.executeQuery();
				if(rs.next()){
					int current_num = rs.getInt("current_num");
					int minimum_num = rs.getInt("minimum_num");
					ps.close();
					rs.close();
					ps = conn.prepareStatement(sql3);
					int Num_people = appdto.getNum_people();
					ps.setInt(1, Num_people+current_num);
					ps.setInt(2, appdto.getPost_num());
					result = ps.executeUpdate();
				}
				
				status =  1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			 try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
				if (conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return status;
		
	}
	
	public int noupdate(ApplicantsDto appdto) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		int result = 0;
		ResultSet rs = null;
		String sql = "select Status from applicants where  nickname= ? and post_num = ? "; 
		String sql1 = "SELECT CURRENT_NUM, MINIMUM_NUM FROM ACCOMPANYBOARD where POST_NUM = ?";
		String sql2 ="update applicants set status = ? where nickname = ? and post_num = ?";
		String sql3 ="update ACCOMPANYBOARD set CURRENT_NUM= ?  where post_num= ?";
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, appdto.getNickname());
			ps.setInt(2, appdto.getPost_num());
			rs= ps.executeQuery();
			int st =0;
			if(rs.next()){
				st = rs.getInt("status");
			} 
			ps.close();
			rs.close();
			if( st == 2){
				return 2;
			} else if (st == 1 ){
				ps = conn.prepareStatement(sql2);   // 상태 업데이트
				ps.setInt(1, appdto.getStatus());
				ps.setString(2, appdto.getNickname());
				ps.setInt(3, appdto.getPost_num());
				result = ps.executeUpdate();
					ps.close();
					ps = conn.prepareStatement(sql1);
					ps.setInt(1, appdto.getPost_num());
					rs = ps.executeQuery();
					if(rs.next()){
						int current_num = rs.getInt("current_num");
						ps.close();
						rs.close();
						ps = conn.prepareStatement(sql3);
						int Num_people = appdto.getNum_people();
						ps.setInt(1, current_num-Num_people);
						ps.setInt(2, appdto.getPost_num());
						result = ps.executeUpdate();
						result = 1;
					}
			} else if (st == 0 ){
				ps = conn.prepareStatement(sql2);   // 상태 업데이트
				ps.setInt(1, appdto.getStatus());
				ps.setString(2, appdto.getNickname());
				ps.setInt(3, appdto.getPost_num());
				result = ps.executeUpdate();
				result = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ps   != null)   ps.close();
			if (conn != null) conn.close();
		}
		return result;
	}
	
	
	public List<ApplicantsDto> bonusselect(int post_num, String nickname, int status) throws SQLException {
		Connection conn = null;
	    PreparedStatement ps = null;
	    ResultSet rs = null;
	    String sql = "SELECT m.PROFILE_URL , a.NICKNAME, a.KAKAO_ID   from member m, applicants a  where m.NICKNAME = a.NICKNAME and a.POST_NUM = ? and a.STATUS = ? and a.NICKNAME = ?";
	    System.out.println("dao"+ post_num);
	    System.out.println("dao"+ nickname);
	    System.out.println("dao"+ status);
	    List<ApplicantsDto> list = new ArrayList<ApplicantsDto>();
		try {
			conn = getConnection();
	         ps = conn.prepareStatement(sql);
	         ps.setInt(1, post_num);
	         ps.setInt(2, status);
	         ps.setString(3, nickname);
	         rs = ps.executeQuery();
	         while(rs.next()){
	        	 ApplicantsDto dto = new ApplicantsDto();
	        	 dto.setProfile_url(rs.getString("profile_url"));
	        	 dto.setNickname(rs.getString("nickname"));
	        	 dto.setKakao_id(rs.getString("kakao_id"));
	        	 list.add(dto);
	         }
		} catch (Exception e) {
			e.printStackTrace();
		}	finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (conn != null) conn.close();
		}
		return list;
		
	}
	
	public List<ApplicantsDto> statusselect(int post_num )throws SQLException{
		Connection conn = null;
	    PreparedStatement ps = null;
	    ResultSet rs = null;
	    String sql ="select a.status, a.nickname, a.kakao_id, m.profile_url from applicants a , member m where a.email = m.email and post_num = ?";
	    List<ApplicantsDto> list = new ArrayList<ApplicantsDto>();
	    try {
	    	conn = getConnection();
	        ps = conn.prepareStatement(sql);
	        ps.setInt(1, post_num);
	        rs = ps.executeQuery();
	        while(rs.next()){
	        	int status = rs.getInt("status");
	        	if (status ==1){
	        		 ApplicantsDto dto = new ApplicantsDto();
		        	 dto.setProfile_url(rs.getString("profile_url"));
		        	 dto.setNickname(rs.getString("nickname"));
		        	 dto.setKakao_id(rs.getString("kakao_id"));
		        	 list.add(dto);
	        	}
	        }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (conn != null) conn.close();
		}
		return list;
	}
}
