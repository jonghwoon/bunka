package cobra.mvc.center.item.persistence.reserv;

import java.util.ArrayList;
import java.util.Map;

import cobra.mvc.center.item.domain.ReservDTO;

public interface ReservDAO {

	public int getReserv_key(String book_id);	//예약키 가져오기
	
	public ReservDTO checkReserv(String book_id);	//예약상태 가져오기
	
	public int checkReservState(String id); //예약 도서인지 확인하기
	
	public int countReserv(String id); //예약 수 확인 3개까지만
	
	public int reservation(Map<String, Object> daomap); //예약처리
	
	public ArrayList<ReservDTO> reservList(String id); //예약 목록 가져오기
	
	public int reservCancel(Map<String, Object> daomap); //예약취소
	
	public int delReserv(String book_id);	//도서 삭제 시 예약 삭제
	
	public int preReserv(Map<String, Object> daomap); //예약 중복확인
	
	public String checkQueue(Map<String, Object> daomap);	//예약순위 확인
	
	public void updateQueue(String book_id);	//예약순위 상승
	
	public void delQueue(String book_id);	//예약 순위 0이하 삭제하기
}
