package cobra.mvc.center.sports.domain;

public class ReservationDTO {
	
	String team; /* ���� */
	String name; /* �� ���� */
	String grade; /* �� ��� */
	String fieldname; /* Ȱ�� ���� */
	int lineup; /* �ο� */
	int matching;
	String time;
	
	
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getTeam() {
		return team;
	}
	public void setTeam(String team) {
		this.team = team;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getFieldname() {
		return fieldname;
	}
	public void setFieldname(String fieldname) {
		this.fieldname = fieldname;
	}
	public int getLineup() {
		return lineup;
	}
	public void setLineup(int lineup) {
		this.lineup = lineup;
	}
	public int getMatching() {
		return matching;
	}
	public void setMatching(int matching) {
		this.matching = matching;
	}
	
}
