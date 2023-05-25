package cobra.mvc.center.circle.domain;

import java.sql.Timestamp;

import cobra.mvc.center.common.domain.AbstDTO;

public class CirReBoardDTO extends AbstDTO{
	private String writer;
	private int num;
	private String subject;
	private String passwd;
	private String contents;
	private int readCnt;
	private Timestamp adddate;
	private int recount;
	
	public CirReBoardDTO(){
		keyNames = new String[] {""};
		tableName = "CIRCLE_REBOARD";
	}
	
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getReadCnt() {
		return readCnt;
	}
	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}
	public Timestamp getAdddate() {
		return adddate;
	}
	public void setAdddate(Timestamp adddate) {
		this.adddate = adddate;
	}
	public int getRecount() {
		return recount;
	}
	public void setRecount(int recount) {
		this.recount = recount;
	}

}
