package cobra.mvc.center.common.domain;

public class MemberDTO extends AbstDTO{
	
	private String id,passwd,name,nick,jumin,address,zipcode,hp,email,regdate,lastdate,grade;

	
		
	public String getGrade() {
		return grade;
	}


	public void setGrade(String grade) {
		this.grade = grade;
	}


	public MemberDTO(){
		keyNames = new String[] {"id"};
		tableName = "CENTER_USER";
	}

	
	public String getId() {
		return id;
	}



	public String getPasswd() {
		return passwd;
	}



	public String getName() {
		return name;
	}



	public String getNick() {
		return nick;
	}



	public String getJumin() {
		return jumin;
	}



	public String getAddress() {
		return address;
	}



	public String getZipcode() {
		return zipcode;
	}



	public String getHp() {
		return hp;
	}



	public String getEmail() {
		return email;
	}



	public String getRegdate() {
		return regdate;
	}



	public String getLastdate() {
		return lastdate;
	}



	public void setId(String id) {
		this.id = id;
	}



	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}



	public void setName(String name) {
		this.name = name;
	}



	public void setNick(String nick) {
		this.nick = nick;
	}



	public void setJumin(String jumin) {
		this.jumin = jumin;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}



	public void setHp(String hp) {
		this.hp = hp;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}



	public void setLastdate(String lastdate) {
		this.lastdate = lastdate;
	}

	
}