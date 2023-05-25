package cobra.mvc.center.art.domain;
import cobra.mvc.center.common.domain.AbstDTO;

public class ShowMemberResDTO extends AbstDTO{
	
	int member_res_num;
	String id;
	int show_num;
	String res_date;	
	String seat;
	String seat_code;
			
	public ShowMemberResDTO(){
		keyNames = new String[] {"id","show_num","res_date"};
		tableName = "ART_SHOW_MEMBER_RES";
	}
	
	public String getSeat_code() {
		return seat_code;
	}

	public int getMember_res_num() {
		return member_res_num;
	}

	public String getId() {
		return id;
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

	public void setMember_res_num(int member_res_num) {
		this.member_res_num = member_res_num;
	}

	public void setId(String id) {
		this.id = id;
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

	public void setSeat_code(String seat_code) {
		this.seat_code = seat_code;
	}

}