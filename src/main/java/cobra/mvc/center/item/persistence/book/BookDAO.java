package cobra.mvc.center.item.persistence.book;

import java.util.ArrayList;
import java.util.Map;

import cobra.mvc.center.item.domain.BookDTO;

public interface BookDAO {

	public int insertbook(BookDTO dto);	//도서등록
	
	public int getBookCount();			//도서 숫자
	
	public ArrayList<BookDTO> getBooks(Map<String, Object> daoMap);	//등록된 도서목록
	
	public ArrayList<BookDTO> getCategory(Map<String, Object> daoMap); //도서분류
	
	public BookDTO getBook(String book_id); //도서 상세정보
	
	public int updateBook(BookDTO dto); //도서 정보수정처리
	
	public int deleteBook(String book_id);	//도서 삭제
}
