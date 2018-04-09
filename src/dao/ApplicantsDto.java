package dao;

public class ApplicantsDto {
	private int post_num;
	private String email;
	private String nickname;
	private String status;
	private String message;
	private String kkkao_id;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getKkkao_id() {
		return kkkao_id;
	}
	public void setKkkao_id(String kkkao_id) {
		this.kkkao_id = kkkao_id;
	}
}
