package cobra.mvc.center.circle.domain;

import cobra.mvc.center.common.domain.AbstDTO;

public class CirroungeDTO extends AbstDTO{
	private String num;
	private String name;
	private String price;
	private String content;
	private String location;
	
	public CirroungeDTO(){
		keyNames = new String[] {"num"};
		tableName = "CENTER_ROUNGE";
	}
	
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	
	
	
}
