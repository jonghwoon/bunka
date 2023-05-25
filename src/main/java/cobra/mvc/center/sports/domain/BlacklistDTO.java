package cobra.mvc.center.sports.domain;

public class BlacklistDTO {
	String team;
	String leader;
	String content;
	String black_date;
	int count;
	
	/*public BlacklistDTO(){
		keyNames = new String[] {"team"};
		tableName = "SPORTS_BLACKLIST";
	}*/
	
	public String getTeam() {
		return team;
	}
	public void setTeam(String team) {
		this.team = team;
	}
	public String getLeader() {
		return leader;
	}
	public void setLeader(String leader) {
		this.leader = leader;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getBlack_date() {
		return black_date;
	}
	public void setBlack_date(String black_date) {
		this.black_date = black_date;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
}
