package dao;

public class WishlistDto {
	private int contenttypeid;
	private int contendtid;
	private String email;
	private String tour_name;
	private String img_src;
	
	public int getContenttypeid() {
		return contenttypeid;
	}
	public void setContenttypeid(int contenttypeid) {
		this.contenttypeid = contenttypeid;
	}
	public int getContendtid() {
		return contendtid;
	}
	public void setContendtid(int contendtid) {
		this.contendtid = contendtid;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTour_name() {
		return tour_name;
	}
	public void setTour_name(String tour_name) {
		this.tour_name = tour_name;
	}
	public String getImg_src() {
		return img_src;
	}
	public void setImg_src(String img_src) {
		this.img_src = img_src;
	}
	
}
