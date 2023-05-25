package cobra.mvc.center.circle.domain;

import cobra.mvc.center.common.domain.AbstDTO;

public class CirRequestDTO extends AbstDTO{
	
	private String id;
	private String message;
	private String regdate;
	private String status;
	private String num;
	private String name;
	private String circlenum;
	
	
	public CirRequestDTO(){
		keyNames = new String[] {"id"};
		tableName = "CIRCLE_REQUEST";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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

	public String getCirclenum() {
		return circlenum;
	}

	public void setCirclenum(String circlenum) {
		this.circlenum = circlenum;
	}
}
