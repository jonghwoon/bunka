package cobra.mvc.center.circle.domain;

import cobra.mvc.center.common.domain.AbstDTO;

public class CirSearchDTO extends AbstDTO {
	
	private String name;
	private String location;
	private String category;
	private String regdate;
	private int people;
	private int circlenum;
	private int maxpeople;
	
	public CirSearchDTO(){
		keyNames = new String[] {""};
		tableName = "CENTER_CIRCLE";
	}
	
	public int getMaxpeople() {
		return maxpeople;
	}

	public void setMaxpeople(int maxpeople) {
		this.maxpeople = maxpeople;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getPeople() {
		return people;
	}

	public void setPeople(int people) {
		this.people = people;
	}
	public int getCirclenum() {
		return circlenum;
	}

	public void setCirclenum(int circlenum) {
		this.circlenum = circlenum;
	}

}
