package dao;

import java.util.Date;

public class mySchduleDto {
	private String sl_code;
	private String s_name;
	private String local_name;
	private Date tour_date;
	private Date regi_date;
	public String getSl_code() {
		return sl_code;
	}
	public void setSl_code(String sl_code) {
		this.sl_code = sl_code;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getLocal_name() {
		return local_name;
	}
	public void setLocal_name(String local_name) {
		this.local_name = local_name;
	}
	public Date getTour_date() {
		return tour_date;
	}
	public void setTour_date(Date tour_date) {
		this.tour_date = tour_date;
	}
	public Date getRegi_date() {
		return regi_date;
	}
	public void setRegi_date(Date regi_date) {
		this.regi_date = regi_date;
	}
	
}
