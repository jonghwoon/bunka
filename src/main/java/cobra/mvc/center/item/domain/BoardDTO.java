package cobra.mvc.center.item.domain;

import java.sql.Timestamp;

public class BoardDTO {

	private int board_num;
	private String board_title;
	private String board_pwd;
	private String board_writer;
	private String board_content;
	private Timestamp board_date;
	private int board_count;
	private int board_ref;
	private int board_ref_level;
	private int board_ref_step;
	private String ip;
	
	public int getBoard_num() {
		return board_num;
	}
	
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	
	public String getBoard_title() {
		return board_title;
	}
	
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	
	public String getBoard_pwd() {
		return board_pwd;
	}
	
	public void setBoard_pwd(String board_pwd) {
		this.board_pwd = board_pwd;
	}
	
	public String getBoard_writer() {
		return board_writer;
	}
	
	public void setBoard_writer(String board_writer) {
		this.board_writer = board_writer;
	}
	
	public String getBoard_content() {
		return board_content;
	}
	
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	
	public Timestamp getBoard_date() {
		return board_date;
	}
	
	public void setBoard_date(Timestamp board_date) {
		this.board_date = board_date;
	}
	
	public int getBoard_count() {
		return board_count;
	}
	
	public void setBoard_count(int board_count) {
		this.board_count = board_count;
	}
	
	public int getBoard_ref() {
		return board_ref;
	}
	
	public void setBoard_ref(int board_ref) {
		this.board_ref = board_ref;
	}
	
	public int getBoard_ref_level() {
		return board_ref_level;
	}
	
	public void setBoard_ref_level(int board_ref_level) {
		this.board_ref_level = board_ref_level;
	}
	
	public int getBoard_ref_step() {
		return board_ref_step;
	}
	
	public void setBoard_ref_step(int board_ref_step) {
		this.board_ref_step = board_ref_step;
	}
	
	public String getIp() {
		return ip;
	}
	
	public void setIp(String ip) {
		this.ip = ip;
	}
	
}
