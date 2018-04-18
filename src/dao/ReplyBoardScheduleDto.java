package dao;

import java.util.Date;

public class ReplyBoardScheduleDto {

	private int rbs_num;
	private int bs_num;
	private String email;
	private String nickname;
	private String reply_content;
	private String profile_url;
	private Date reply_date;
	
	public int getRbs_num() {
		return rbs_num;
	}
	public void setRbs_num(int rbs_num) {
		this.rbs_num = rbs_num;
	}
	public int getBs_num() {
		return bs_num;
	}
	public void setBs_num(int bs_num) {
		this.bs_num = bs_num;
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
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public String getProfile_url() {
		return profile_url;
	}
	public void setProfile_url(String profile_url) {
		this.profile_url = profile_url;
	}
	public Date getReply_date() {
		return reply_date;
	}
	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}
	
}
