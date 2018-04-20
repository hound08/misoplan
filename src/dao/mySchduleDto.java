package dao;

import java.util.Date;

public class mySchduleDto {
	private String sl_code;
	private String s_name;
	private String area_name;
	private Date tour_date_start;
	private Date tour_date_end;
	private Date regi_date;
	private String sigungu_name;
	private int is_deleted;
	public int getIs_deleted() {
		return is_deleted;
	}
	public void setIs_deleted(int is_deleted) {
		this.is_deleted = is_deleted;
	}
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
	public String getArea_name() {
		return area_name;
	}
	public void setArea_name(String area_name) {
		this.area_name = area_name;
	}
	public Date getTour_date_start() {
		return tour_date_start;
	}
	public void setTour_date_start(Date tour_date_start) {
		this.tour_date_start = tour_date_start;
	}
	public Date getTour_date_end() {
		return tour_date_end;
	}
	public void setTour_date_end(Date tour_date_end) {
		this.tour_date_end = tour_date_end;
	}
	public Date getRegi_date() {
		return regi_date;
	}
	public void setRegi_date(Date regi_date) {
		this.regi_date = regi_date;
	}
	public String getSigungu_name() {
		return sigungu_name;
	}
	public void setSigungu_name(String sigungu_name) {
		this.sigungu_name = sigungu_name;
	}

}
