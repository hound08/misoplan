package dao;

import java.util.Date;

public class AccompanyApplicantsDto {
	
	private int post_num;
	private String email;
	private String nickname;
	private int status;
	private String message;
	private String kakao_id;
	private Date applicants_date;
	private int num_people;
	
	public int getNum_people() {
		return num_people;
	}
	public void setNum_people(int num_people) {
		this.num_people = num_people;
	}
	public int getPost_num() {
		return post_num;
	}
	public void setPost_num(int post_num) {
		this.post_num = post_num;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getKakao_id() {
		return kakao_id;
	}
	public void setKakao_id(String kakao_id) {
		this.kakao_id = kakao_id;
	}
	public Date getApplicants_date() {
		return applicants_date;
	}
	public void setApplicants_date(Date applicants_date) {
		this.applicants_date = applicants_date;
	}
	
}
