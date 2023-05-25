package cobra.mvc.center.item.persistence.reserv;

import java.util.ArrayList;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import cobra.mvc.center.item.domain.ReservDTO;

@Repository
public class ReservDAOImpl implements ReservDAO {

	@Inject
	private SqlSession sqlSession;
	
	//예약키 가져오기
	@Override
	public int getReserv_key(String book_id) {
		int cnt = 0;
		
		ReservDAO dao = sqlSession.getMapper(ReservDAO.class);
		cnt = dao.getReserv_key(book_id);
		
		return cnt;
	}
	
	//예약 상태 확인하기
	public ReservDTO checkReserv(String book_id) {
		ReservDTO dto = null;
		
		ReservDAO dao = sqlSession.getMapper(ReservDAO.class);
		dto = dao.checkReserv(book_id);
		
		return dto;
	}

	//지금 책 예약 중인지 확인
	@Override
	public int checkReservState(String id) {
		int cnt = 0;
		
		ReservDAO dao = sqlSession.getMapper(ReservDAO.class);
		cnt = dao.checkReservState(id);
		
		return cnt;
	}

	//최대예약치 확인
	@Override
	public int countReserv(String id) {
		int cnt = 0;
		
		ReservDAO dao = sqlSession.getMapper(ReservDAO.class);
		cnt = dao.countReserv(id);
		
		return cnt;
	}

	//예약처리
	@Override
	public int reservation(Map<String, Object> daomap) {
		int cnt = 0;
		
		ReservDAO dao = sqlSession.getMapper(ReservDAO.class);
		cnt = dao.reservation(daomap);
		
		return cnt;
	}

	//예약목록
	@Override
	public ArrayList<ReservDTO> reservList(String id) {
		ArrayList<ReservDTO> dtos = null;
		
		ReservDAO dao = sqlSession.getMapper(ReservDAO.class);
		dtos = dao.reservList(id);
		
		return dtos;
	}
	
	//예약취소
	@Override
	public int reservCancel(Map<String, Object> daomap) {
		int cnt = 0;
		
		ReservDAO dao = sqlSession.getMapper(ReservDAO.class);
		cnt = dao.reservCancel(daomap);
		
		return cnt;
	}

	//예약 삭제
	@Override
	public int delReserv(String book_id) {
		int cnt = 0;
		
		ReservDAO dao = sqlSession.getMapper(ReservDAO.class);
		cnt = dao.delReserv(book_id);
		
		return cnt;
	}
	
	//중복예약 확인
	@Override
	public int preReserv(Map<String, Object> daomap) {
		int cnt = 0;
		
		ReservDAO dao = sqlSession.getMapper(ReservDAO.class);
		cnt = dao.preReserv(daomap);
		
		return cnt;
	}

	//순위확인
	@Override
	public String checkQueue(Map<String, Object> daomap) {
		String cnt = null;
		
		ReservDAO dao = sqlSession.getMapper(ReservDAO.class);
		cnt = dao.checkQueue(daomap);
		
		return cnt;
	}

	//예약순위 상승
	@Override
	public void updateQueue(String book_id) {
		
		ReservDAO dao = sqlSession.getMapper(ReservDAO.class);
		dao.updateQueue(book_id);
		
	}

	//예약순위가 0이하되면 삭제하기
	@Override
	public void delQueue(String book_id) {
		
		ReservDAO dao = sqlSession.getMapper(ReservDAO.class);
		dao.delQueue(book_id);
		
	}

}
