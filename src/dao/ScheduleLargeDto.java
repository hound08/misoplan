package dao;

import java.util.Date;

public class ScheduleLargeDto {
	private String sl_code;
	private String email;
	private String s_name;
	private Date regi_date;
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
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public Date getRegi_date() {
		return regi_date;
	}
	public void setRegi_date(Date regi_date) {
		this.regi_date = regi_date;
	}
	
	
}
