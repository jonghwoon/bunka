package cobra.mvc.center.item.persistence.rend;

import java.util.ArrayList;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import cobra.mvc.center.item.domain.BookDTO;
import cobra.mvc.center.item.domain.MemberDTO;
import cobra.mvc.center.item.domain.RendDTO;

@Repository
public class RendDAOImpl implements RendDAO {

	@Inject
	private SqlSession sqlSession;
	
	//도서대출상태확인
	@Override
	public int checkRentState(String book_id) {
		int cnt = 0;
		
		RendDAO dao = sqlSession.getMapper(RendDAO.class);
		cnt = dao.checkRentState(book_id);
		
		return cnt;
	}

	//도서 대여하기
	@Override
	public int rendBook(Map<String, Object> daoMap) {
		int cnt = 0;
		
		RendDAO dao = sqlSession.getMapper(RendDAO.class);
		cnt = dao.rendBook(daoMap);
		
		return cnt;
	}

	//이용자 페널티 체크하기
	@Override
	public MemberDTO checkPenalty(String id) {
		MemberDTO dto = null;
		
		RendDAO dao = sqlSession.getMapper(RendDAO.class);
		dto = dao.checkPenalty(id);
		
		return dto;
	}

	//도서 + 대여정보가져오기
	@Override
	public BookDTO getDetail(String book_id) {
		BookDTO dto = null;
		
		RendDAO dao = sqlSession.getMapper(RendDAO.class);
		dto = dao.getDetail(book_id);
		
		return dto;
	}

	//유저 등록 확인
	@Override
	public String checkUserReg(String id) {
		String cnt = null;
		
		RendDAO dao = sqlSession.getMapper(RendDAO.class);
		cnt = dao.checkUserReg(id);
		
		return cnt;
	}

	//유저 등록
	@Override
	public int register(String id) {
		int cnt = 0;
		
		RendDAO dao = sqlSession.getMapper(RendDAO.class);
		cnt = dao.register(id);
		
		return cnt;
	}

	//제한해제
	@Override
	public int delPenalty(String id) {
		int cnt = 0;
		
		RendDAO dao = sqlSession.getMapper(RendDAO.class);
		cnt = dao.delPenalty(id);
		
		return cnt;
	}
	
	//대여한 책 숫자 확인
	@Override
	public int getRendCount(String id) {
		int cnt = 0;
		
		RendDAO dao = sqlSession.getMapper(RendDAO.class);
		cnt = dao.getRendCount(id);
		
		return cnt;
	}

	//대여한 도서 목록
	@Override
	public ArrayList<RendDTO> getRendList(String id) {
		ArrayList<RendDTO> dtos = null;
		
		RendDAO dao = sqlSession.getMapper(RendDAO.class);
		dtos = dao.getRendList(id);
		
		return dtos;
	}
	
	//빌린책 상세
	@Override
	public RendDTO getRendDetail(String book_id) {
		RendDTO dto = null;
		
		RendDAO dao = sqlSession.getMapper(RendDAO.class);
		dto = dao.getRendDetail(book_id);
		
		return dto;
	}

	//이용제한 설정
	@Override
	public int setPenalty(String id) {
		int cnt = 0;
		
		RendDAO dao = sqlSession.getMapper(RendDAO.class);
		cnt = dao.setPenalty(id);
		
		return cnt;
	}

	//도서반납
	@Override
	public int returnBook(String book_id) {
		int cnt = 0;
		
		RendDAO dao = sqlSession.getMapper(RendDAO.class);
		cnt = dao.returnBook(book_id);
		
		return cnt;
	}

	//대여키 받아오기
	@Override
	public int getRend_key(String book_id) {
		int cnt = 0;
		
		RendDAO dao = sqlSession.getMapper(RendDAO.class);
		cnt = dao.getRend_key(book_id);
		
		return cnt;
	}

}
