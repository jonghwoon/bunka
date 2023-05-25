package cobra.mvc.center.art.domain;
import cobra.mvc.center.common.domain.AbstDTO;

public class ShowResDTO extends AbstDTO{
	
	// SHOW_NUM	RES_DATE SEAT RES_NUM
	private int res_num;
	private int show_num;
	private String res_date;
	private String seat;
			
	public ShowResDTO(){
		keyNames = new String[] {"show_num","res_date"};
		tableName = "ART_SHOW_RES";
	}

	public int getRes_num() {
		return res_num;
	}

	public int getShow_num() {
		return show_num;
	}

	public String getRes_date() {
		return res_date;
	}

	public String getSeat() {
		return seat;
	}

	public void setRes_num(int res_num) {
		this.res_num = res_num;
	}

	public void setShow_num(int show_num) {
		this.show_num = show_num;
	}

	public void setRes_date(String res_date) {
		this.res_date = res_date.replace(" 00:00:00", "");
	}

	public void setSeat(String seat) {
		this.seat = seat;
	}
	
	
	
}