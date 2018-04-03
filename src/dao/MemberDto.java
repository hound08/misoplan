package dao;

import java.util.Date;

public class MemberDto {
	private String email;
	private String nickname;
	private String password;
	private String phone;
	private String profile_url;
	private int member_score;
	private int member_admin;
	private int ban;
	private Date ban_date;
	private int leave;
	private Date join_date;
	
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getProfile_url() {
		return profile_url;
	}
	public void setProfile_url(String profile_url) {
		this.profile_url = profile_url;
	}
	public int getMember_score() {
		return member_score;
	}
	public void setMember_score(int member_score) {
		this.member_score = member_score;
	}
	public int getMember_admin() {
		return member_admin;
	}
	public void setMember_admin(int member_admin) {
		this.member_admin = member_admin;
	}
	public int getBan() {
		return ban;
	}
	public void setBan(int ban) {
		this.ban = ban;
	}
	public Date getBan_date() {
		return ban_date;
	}
	public void setBan_date(Date ban_date) {
		this.ban_date = ban_date;
	}
	public int getLeave() {
		return leave;
	}
	public void setLeave(int leave) {
		this.leave = leave;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
}
