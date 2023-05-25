package cobra.mvc.center.item.persistence.book;

import java.util.ArrayList;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import cobra.mvc.center.item.domain.BookDTO;

@Repository
public class BookDAOImpl implements BookDAO {

	//��ü����
	@Inject
	private SqlSession sqlSession;

	//�����߰�
	@Override
	public int insertbook(BookDTO dto) {
		int cnt = 0;
		
		BookDAO dao = sqlSession.getMapper(BookDAO.class);
		cnt = dao.insertbook(dto);	
		
		return cnt;
	}

	//��ϵ� å ����
	@Override
	public int getBookCount() {
		int cnt = 0;
		
		BookDAO dao = sqlSession.getMapper(BookDAO.class);
		cnt = dao.getBookCount();
		
		return cnt;
	}

	//��ϵ� �������� �ҷ�����
	@Override
	public ArrayList<BookDTO> getBooks(Map<String, Object> daoMap) {
		
		ArrayList<BookDTO> dtos = null;
		
		BookDAO dao = sqlSession.getMapper(BookDAO.class);
		dtos = (ArrayList<BookDTO>) dao.getBooks(daoMap);
		
		return dtos;
	}

	//�����з�
	@Override
	public ArrayList<BookDTO> getCategory(Map<String, Object> daoMap) {
		
		ArrayList<BookDTO> dtos = null;
		
		BookDAO dao = sqlSession.getMapper(BookDAO.class);
		dtos = (ArrayList<BookDTO>) dao.getCategory(daoMap);
		
		return dtos;
	}

	//���� ������
	@Override
	public BookDTO getBook(String book_id) {
		BookDTO dto = null;
		
		BookDAO dao = sqlSession.getMapper(BookDAO.class);
		dto = dao.getBook(book_id);
		
		return dto;
	}

	//���� ����ó��
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
