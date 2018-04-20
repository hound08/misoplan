package dao;

import java.util.ArrayList;

public class myPlanABDto {
	
	private String sl_code;
	private String s_name;
	private ArrayList<String> area_names;
	private String date_start;
	private String date_end;
	private String regi_date;
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
	public ArrayList<String> getArea_names() {
		return area_names;
	}
	public void setArea_names(ArrayList<String> area_names) {
		this.area_names = area_names;
	}
	public String getDate_start() {
		return date_start;
	}
	public void setDate_start(String date_start) {
		this.date_start = date_start;
	}
	public String getDate_end() {
		return date_end;
	}
	public void setDate_end(String date_end) {
		this.date_end = date_end;
	}
	public String getRegi_date() {
		return regi_date;
	}
	public void setRegi_date(String regi_date) {
		this.regi_date = regi_date;
	}
	
}
