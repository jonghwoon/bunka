package cobra.mvc.center.sports.domain;

public class TeamDTO {

	String id;
	String team; 
	String leader; 
	String grade; 
	String place;
	String PR;
	int lineup; 
	int win; 
	int lose; 
	int matching; 
	String yellow;
	
	public String getPR() {
		return PR;
	}
	public void setPR(String pR) {
		PR = pR;
	}
	
	public String getYellow() {
		return yellow;
	}
	public void setYellow(String yellow) {
		this.yellow = yellow;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
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
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public int getLineup() {
		return lineup;
	}
	public void setLineup(int lineup) {
		this.lineup = lineup;
	}
	public int getWin() {
		return win;
	}
	public void setWin(int win) {
		this.win = win;
	}
	public int getLose() {
		return lose;
	}
	public void setLose(int lose) {
		this.lose = lose;
	}
	public int getMatching() {
		return matching;
	}
	public void setMatching(int matching) {
		this.matching = matching;
	}
	
}
