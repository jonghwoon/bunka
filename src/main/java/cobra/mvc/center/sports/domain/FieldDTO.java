package cobra.mvc.center.sports.domain;


public class FieldDTO {
	
	String idx; /* idx */
	String fieldname; /* 장소 */
	int amprice; /* 대관료 */
	int pmprice;
	int weamprice;
	int wepmprice;
	String ground; /* 잔디 상태 */
	String fsize; /* 구장 크기 */
	String pr;
	
	public String getPr() {
		return pr;
	}
	public void setPr(String pr) {
		this.pr = pr;
	}
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getFieldname() {
		return fieldname;
	}
	public void setFieldname(String fieldname) {
		this.fieldname = fieldname;
	}
	public int getAmprice() {
		return amprice;
	}
	public void setAmprice(int amprice) {
		this.amprice = amprice;
	}
	public int getPmprice() {
		return pmprice;
	}
	public void setPmprice(int pmprice) {
		this.pmprice = pmprice;
	}
	public int getWeamprice() {
		return weamprice;
	}
	public void setWeamprice(int weamprice) {
		this.weamprice = weamprice;
	}
	public int getWepmprice() {
		return wepmprice;
	}
	public void setWepmprice(int wepmprice) {
		this.wepmprice = wepmprice;
	}
	public String getGround() {
		return ground;
	}
	public void setGround(String ground) {
		this.ground = ground;
	}
	public String getFsize() {
		return fsize;
	}
	public void setFsize(String fsize) {
		this.fsize = fsize;
	}
	
	
}
