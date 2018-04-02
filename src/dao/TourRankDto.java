package dao;

public class TourRankDto {

	private int tour_num;
	private String tour_name;
	private String tour_code;
	private String image_url;
	
	public int getTour_num() {
		return tour_num;
	}
	public void setTour_num(int tour_num) {
		this.tour_num = tour_num;
	}
	public String getTour_name() {
		return tour_name;
	}
	public void setTour_name(String tour_name) {
		this.tour_name = tour_name;
	}
	public String getTour_code() {
		return tour_code;
	}
	public void setTour_code(String tour_code) {
		this.tour_code = tour_code;
	}
	public String getImage_url() {
		return image_url;
	}
	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}
	
}
