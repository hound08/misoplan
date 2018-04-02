package dao;

import java.util.Date;

public class BoardScheduleDto {
	
	private int bs_num;
	private String sl_code;
	private	String email;
	private String nickname;
	private String title;
	private String tag;
	private String content;
	private String image_url;
	private int vote_count;
	private int view_count;
	private Date board_date;
	
	
	
	public int getBs_num() {
		return bs_num;
	}
	public void setBs_num(int bs_num) {
		this.bs_num = bs_num;
	}
	public String getSl_code() {
		return sl_code;
	}
	public void setSl_code(String sl_code) {
		this.sl_code = sl_code;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImage_url() {
		return image_url;
	}
	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}
	public int getVote_count() {
		return vote_count;
	}
	public void setVote_count(int vote_count) {
		this.vote_count = vote_count;
	}
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	public Date getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}
	
	
	
	
}
