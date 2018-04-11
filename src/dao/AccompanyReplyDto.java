package dao;

import java.util.Date;

public class AccompanyReplyDto {
	
	private int rp_num;
	private int post_num;
	private String email;
	private String nickname;
	private String content;
	private Date replay_date;
	
	public int getRp_num() {
		return rp_num;
	}
	public void setRp_num(int rp_num) {
		this.rp_num = rp_num;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getReplay_date() {
		return replay_date;
	}
	public void setReplay_date(Date replay_date) {
		this.replay_date = replay_date;
	}
}
