package cobra.mvc.center.item.domain;

import java.sql.Date;

public class MemberDTO {

	@Override
	public String toString() {
		return "Item_Member [id=" + id + ", rend_key=" + rend_key + ", reserv_key=" + reserv_key + ", user_penalty="
				+ user_penalty + ", user_penaltydate=" + user_penaltydate + "]";
	}

	private String id;
	private int rend_key;
	private int reserv_key;
	private int user_penalty;
	private Date user_penaltydate;
	private Date today;
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public int getRend_key() {
		return rend_key;
	}
	
	public void setRend_key(int rend_key) {
		this.rend_key = rend_key;
	}
	
	public int getReserv_key() {
		return reserv_key;
	}
	
	public void setReserv_key(int reserv_key) {
		this.reserv_key = reserv_key;
	}
	
	public int getUser_penalty() {
		return user_penalty;
	}
	
	public void setUser_penalty(int user_penalty) {
		this.user_penalty = user_penalty;
	}
	
	public Date getUser_penaltydate() {
		return user_penaltydate;
	}
	
	public void setUser_penaltydate(Date user_penaltydate) {
		this.user_penaltydate = user_penaltydate;
	}
	
	public Date getToday() {
		return today;
	}
	
	public void setToday(Date today) {
		this.today = today;
	}
	
}
