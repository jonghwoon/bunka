package cobra.mvc.center.circle.domain;

import cobra.mvc.center.common.domain.AbstDTO;

public class CircleInfoDTO extends AbstDTO{
	private String name;
	private String location;
	private String category;
	private String regdate;
	private int people;
	private String circlenum;
	private int Maxpeople;
	private String infos;
	private String recruit;
	private String imageinfo;
	
	public CircleInfoDTO(){
		keyNames = new String[] {"name"};
		tableName = "CIRCLE_VIEWCIRCLE";
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
	public String getCirclenum() {
		return circlenum;
	}
	public void setCirclenum(String circlenum) {
		this.circlenum = circlenum;
	}
	public int getMaxpeople() {
		return Maxpeople;
	}
	public void setMaxpeople(int maxpeople) {
		Maxpeople = maxpeople;
	}
	public String getInfos() {
		return infos;
	}
	public void setInfo(String infos) {
		this.infos = infos;
	}
	public String getRecruit() {
		return recruit;
	}
	public void setRecruit(String recruit) {
		this.recruit = recruit;
	}
	public String getImageinfo() {
		return imageinfo;
	}
	public void setImageinfo(String imageinfo) {
		this.imageinfo = imageinfo;
	}
	
}
