package cobra.mvc.center.art.domain;
import cobra.mvc.center.common.domain.AbstDTO;

public class ShowDTO extends AbstDTO{
	
	private int show_num;	
	private String item;	
	private String title,filename;
	private int runtime;
	private String place,org;
	
	private String day_start;	// 파싱 필요
	private int day_end;
	private String day_week;	// 파싱 필요
	
	private int time_start_hr,time_start_min,time_end,time_term;
	private String seat;
	
	

	public ShowDTO(){
		keyNames = new String[] {"show_num"};
		tableName = "ART_SHOW";
	}
		
	public int getShow_num() {
		return show_num;
	}

	public int getRuntime() {
		return runtime;
	}

	public String getItem() {
		return item;
	}

	public String getTitle() {
		return title;
	}

	public String getFilename() {
		return filename;
	}

	public String getPlace() {
		return place;
	}

	public String getOrg() {
		return org;
	}

	public String getDay_start() {
		return day_start;
	}

	public int getDay_end() {
		return day_end;
	}

	public String getDay_week() {
		return day_week;
	}

	public int getTime_start_hr() {
		return time_start_hr;
	}

	public int getTime_start_min() {
		return time_start_min;
	}

	public int getTime_end() {
		return time_end;
	}

	public int getTime_term() {
		return time_term;
	}
	
	public String getSeat() {
		return seat;
	}

	public void setSeat(String seat) {
		this.seat = seat;
	}
	public void setShow_num(int show_num) {
		this.show_num = show_num;
	}

	public void setRuntime(int runtime) {
		this.runtime = runtime;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public void setOrg(String org) {
		this.org = org;
	}

	// 날짜는 replace 하기 
	public void setDay_start(String day_start) {
		this.day_start = day_start.replace(" 00:00:00", "");
	}

	public void setDay_end(int day_end) {
		this.day_end = day_end;
	}

	public void setDay_week(String day_week) {
		this.day_week = day_week;
	}

	public void setTime_start_hr(int time_start_hr) {
		this.time_start_hr = time_start_hr;
	}

	public void setTime_start_min(int time_start_min) {
		this.time_start_min = time_start_min;
	}

	public void setTime_end(int time_end) {
		this.time_end = time_end;
	}

	public void setTime_term(int time_term) {
		this.time_term = time_term;
	}
	
	
}