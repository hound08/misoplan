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
	
	public int update(ApplicantsDto appdto) throws SQLException{
		Connection conn = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql ="update applicants set status = ? where nickname = ? and post_num = ?";
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, appdto.getStatus());
			ps.setString(2, appdto.getNickname());
			ps.setInt(3, appdto.getPost_num());
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			 if (ps != null) ps.close();
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
	        	System.out.println("status : "+ status);
	        	if (status ==1){
	        		System.out.println("dao 빙빙빙");
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
