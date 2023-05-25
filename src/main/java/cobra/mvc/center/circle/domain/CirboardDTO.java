package cobra.mvc.center.circle.domain;

import cobra.mvc.center.common.domain.AbstDTO;

public class CirboardDTO extends AbstDTO{

	private String writer;
	private String num;
	private String subject;
	private String passwd;
	private String contents;
	private int readCnt;
	private String adddate;
	private int recount;
	
	public CirboardDTO(){
		keyNames = new String[] {"num"};
		tableName = "CIRCLE_BOARD";
	}
	
	public int getRecount() {
		return recount;
	}
	public void setRecount(int recount) {
		this.recount = recount;
	}
	public void setAdddate(String adddate) {
		this.adddate = adddate;
	}
	public String getNum() {
		return num;
	}
	public String getWriter() {
		return writer;
	}
	public String getPasswd() {
		return passwd;
	}
	public int getReadCnt() {
		return readCnt;
	}
	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}
	public String getSubject() {
		return subject;
	}
	public String getContents() {
		return contents;
	}

	public String getAdddate() {
		return adddate;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}

	public void setReg_date(String adddate) {
		this.adddate = adddate;
	}
	

	
}
