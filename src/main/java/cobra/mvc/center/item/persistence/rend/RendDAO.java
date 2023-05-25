package cobra.mvc.center.item.persistence.rend;

import java.util.ArrayList;
import java.util.Map;

import cobra.mvc.center.item.domain.BookDTO;
import cobra.mvc.center.item.domain.MemberDTO;
import cobra.mvc.center.item.domain.RendDTO;

public interface RendDAO {

	public int checkRentState(String book_id); //도서 대출상태 확인
	
	public String checkUserReg(String id);	//회원 등록 상태 확인
	
	public MemberDTO checkPenalty(String id); //회원의 대출제한 확인
	
	public int rendBook(Map<String, Object> daoMap);	//도서 대출하기
	
	public BookDTO getDetail(String book_id);	//도서 상세정보가져오기
	
	public int register(String id);	//유저 등록
	
	public int delPenalty(String id); //이용제한 삭제
	
	public int setPenalty(String id); //이용제한 추가
	
	public int getRendCount(String id); //빌린숫자
	
	public ArrayList<RendDTO> getRendList(String id); //대여한 도서목록
	
	public RendDTO getRendDetail(String book_id); //대여도서 상세
	
	public int returnBook(String book_id); //도서 반납
	
	public int getRend_key(String book_id);	//대여키 확인
	
}
