package cobra.mvc.center.item.domain;

import java.sql.Date;

public class ReservDTO {

	@Override
	public String toString() {
		return "ReservDTO [reserv_key=" + reserv_key + ", reserv_number=" + reserv_number + ", reserv_count="
				+ reserv_count + ", item_id=" + item_id + ", book_id=" + book_id + "]";
	}

	private int rend_key;					//대여키
	
	private int reserv_key;					//예약키
	private int reserv_number;				//예약번호
	private int reserv_count;				//예약수
	private String item_id;					//물품 관리번호
	private String book_id;					//도서관리번호
	
	private String book_isbn;				//ISBN
	private String book_title;				//책제목
	private String book_origin;				//원서명
	private String book_author;				//저자
	private String book_trans;				//역자
	private String book_publisher;			//출판사
	private Date book_publishdate;		//출판일
	private Date book_incomedate;		//등록일
	private String book_categorybig;		//대분류
	private String book_categorymid;		//중분류
	private String catbig;					//대분류명
	private String catmid;					//중분류명
	private String book_library;			//도서관
	private int book_value;					//도서수
	private String book_keyword;			//키워드
	private String book_img;				//이미지
	private String book_index;				//목차
	private String book_img_path;			//이미지경로
	
	public int getRend_key() {
		return rend_key;
	}

	public void setRend_key(int rend_key) {
		this.rend_key = rend_key;
	}

	public String getBook_isbn() {
		return book_isbn;
	}

	public void setBook_isbn(String book_isbn) {
		this.book_isbn = book_isbn;
	}

	public String getBook_title() {
		return book_title;
	}

	public void setBook_title(String book_title) {
		this.book_title = book_title;
	}

	public String getBook_origin() {
		return book_origin;
	}

	public void setBook_origin(String book_origin) {
		this.book_origin = book_origin;
	}

	public String getBook_author() {
		return book_author;
	}

	public void setBook_author(String book_author) {
		this.book_author = book_author;
	}

	public String getBook_trans() {
		return book_trans;
	}

	public void setBook_trans(String book_trans) {
		this.book_trans = book_trans;
	}

	public String getBook_publisher() {
		return book_publisher;
	}

	public void setBook_publisher(String book_publisher) {
		this.book_publisher = book_publisher;
	}

	public Date getBook_publishdate() {
		return book_publishdate;
	}

	public void setBook_publishdate(Date book_publishdate) {
		this.book_publishdate = book_publishdate;
	}

	public Date getBook_incomedate() {
		return book_incomedate;
	}

	public void setBook_incomedate(Date book_incomedate) {
		this.book_incomedate = book_incomedate;
	}

	public String getBook_categorybig() {
		return book_categorybig;
	}

	public void setBook_categorybig(String book_categorybig) {
		this.book_categorybig = book_categorybig;
	}

	public String getBook_categorymid() {
		return book_categorymid;
	}

	public void setBook_categorymid(String book_categorymid) {
		this.book_categorymid = book_categorymid;
	}

	public String getCatbig() {
		return catbig;
	}

	public void setCatbig(String catbig) {
		this.catbig = catbig;
	}

	public String getCatmid() {
		return catmid;
	}

	public void setCatmid(String catmid) {
		this.catmid = catmid;
	}

	public String getBook_library() {
		return book_library;
	}

	public void setBook_library(String book_library) {
		this.book_library = book_library;
	}

	public int getBook_value() {
		return book_value;
	}

	public void setBook_value(int book_value) {
		this.book_value = book_value;
	}

	public String getBook_keyword() {
		return book_keyword;
	}

	public void setBook_keyword(String book_keyword) {
		this.book_keyword = book_keyword;
	}

	public String getBook_img() {
		return book_img;
	}

	public void setBook_img(String book_img) {
		this.book_img = book_img;
	}

	public String getBook_index() {
		return book_index;
	}

	public void setBook_index(String book_index) {
		this.book_index = book_index;
	}

	public String getBook_img_path() {
		return book_img_path;
	}

	public void setBook_img_path(String book_img_path) {
		this.book_img_path = book_img_path;
	}

	public int getReserv_key() {
		return reserv_key;
	}
	
	public void setReserv_key(int reserv_key) {
		this.reserv_key = reserv_key;
	}
	
	public int getReserv_number() {
		return reserv_number;
	}
	
	public void setReserv_number(int reserv_number) {
		this.reserv_number = reserv_number;
	}
	
	public int getReserv_count() {
		return reserv_count;
	}
	
	public void setReserv_count(int reserv_count) {
		this.reserv_count = reserv_count;
	}
	
	public String getItem_id() {
		return item_id;
	}
	
	public void setItem_id(String item_id) {
		this.item_id = item_id;
	}
	
	public String getBook_id() {
		return book_id;
	}
	
	public void setBook_id(String book_id) {
		this.book_id = book_id;
	}
	
}