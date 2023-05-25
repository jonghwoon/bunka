package cobra.mvc.center.item.persistence.book;

import java.util.ArrayList;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import cobra.mvc.center.item.domain.BookDTO;

@Repository
public class BookDAOImpl implements BookDAO {

	//객체주입
	@Inject
	private SqlSession sqlSession;

	//도서추가
	@Override
	public int insertbook(BookDTO dto) {
		int cnt = 0;
		
		BookDAO dao = sqlSession.getMapper(BookDAO.class);
		cnt = dao.insertbook(dto);	
		
		return cnt;
	}

	//등록된 책 숫자
	@Override
	public int getBookCount() {
		int cnt = 0;
		
		BookDAO dao = sqlSession.getMapper(BookDAO.class);
		cnt = dao.getBookCount();
		
		return cnt;
	}

	//등록된 도서전부 불러오기
	@Override
	public ArrayList<BookDTO> getBooks(Map<String, Object> daoMap) {
		
		ArrayList<BookDTO> dtos = null;
		
		BookDAO dao = sqlSession.getMapper(BookDAO.class);
		dtos = (ArrayList<BookDTO>) dao.getBooks(daoMap);
		
		return dtos;
	}

	//도서분류
	@Override
	public ArrayList<BookDTO> getCategory(Map<String, Object> daoMap) {
		
		ArrayList<BookDTO> dtos = null;
		
		BookDAO dao = sqlSession.getMapper(BookDAO.class);
		dtos = (ArrayList<BookDTO>) dao.getCategory(daoMap);
		
		return dtos;
	}

	//도서 상세정보
	@Override
	public BookDTO getBook(String book_id) {
		BookDTO dto = null;
		
		BookDAO dao = sqlSession.getMapper(BookDAO.class);
		dto = dao.getBook(book_id);
		
		return dto;
	}

	//도서 수정처리
	@Override
	public int updateBook(BookDTO dto) {
		int cnt = 0;
		
		BookDAO dao = sqlSession.getMapper(BookDAO.class);
		cnt = dao.updateBook(dto);	
		
		return cnt;
	}

	@Override
	public int deleteBook(String book_id) {
		int cnt = 0;
		
		BookDAO dao = sqlSession.getMapper(BookDAO.class);
		cnt = dao.deleteBook(book_id);
		
		return cnt;
	}
	
	
	
	
}
