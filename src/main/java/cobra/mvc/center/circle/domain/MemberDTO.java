package cobra.mvc.center.circle.domain;

import cobra.mvc.center.common.domain.AbstDTO;

public class MemberDTO extends AbstDTO{
	
	private String id,passwd,name,nick,jumin,address,zipcode,hp,email,regdate,lastdate;


		
	public MemberDTO(){
		keyNames = new String[] {"id"};
		tableName = "CENTER_USER";
	}

	
	protected String getId() {
		return id;
	}



	protected String getPasswd() {
		return passwd;
	}



	protected String getName() {
		return name;
	}



	protected String getNick() {
		return nick;
	}



	protected String getJumin() {
		return jumin;
	}



	protected String getAddress() {
		return address;
	}



	protected String getZipcode() {
		return zipcode;
	}



	protected String getHp() {
		return hp;
	}



	protected String getEmail() {
		return email;
	}



	protected String getRegdate() {
		return regdate;
	}



	protected String getLastdate() {
		return lastdate;
	}



	protected void setId(String id) {
		this.id = id;
	}



	protected void setPasswd(String passwd) {
		this.passwd = passwd;
	}



	protected void setName(String name) {
		this.name = name;
	}



	protected void setNick(String nick) {
		this.nick = nick;
	}



	protected void setJumin(String jumin) {
		this.jumin = jumin;
	}



	protected void setAddress(String address) {
		this.address = address;
	}



	protected void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}



	protected void setHp(String hp) {
		this.hp = hp;
	}



	protected void setEmail(String email) {
		this.email = email;
	}



	protected void setRegdate(String regdate) {
		this.regdate = regdate;
	}



	protected void setLastdate(String lastdate) {
		this.lastdate = lastdate;
	}
	
}