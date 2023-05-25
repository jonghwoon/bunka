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
	
	//����Ű ��������
	@Override
	public int getReserv_key(String book_id) {
		int cnt = 0;
		
		ReservDAO dao = sqlSession.getMapper(ReservDAO.class);
		cnt = dao.getReserv_key(book_id);
		
		return cnt;
	}
	
	//���� ���� Ȯ���ϱ�
	public ReservDTO checkReserv(String book_id) {
		ReservDTO dto = null;
		
		ReservDAO dao = sqlSession.getMapper(ReservDAO.class);
		dto = dao.checkReserv(book_id);
		
		return dto;
	}

	//���� å ���� ������ Ȯ��
	@Override
	public int checkReservState(String id) {
		int cnt = 0;
		
		ReservDAO dao = sqlSession.getMapper(ReservDAO.class);
		cnt = dao.checkReservState(id);
		
		return cnt;
	}

	//�ִ뿹��ġ Ȯ��
	@Override
	public int countReserv(String id) {
		int cnt = 0;
		
		ReservDAO dao = sqlSession.getMapper(ReservDAO.class);
		cnt = dao.countReserv(id);
		
		return cnt;
	}

	//����ó��
	@Override
	public int reservation(Map<String, Object> daomap) {
		int cnt = 0;
		
		ReservDAO dao = sqlSession.getMapper(ReservDAO.class);
		cnt = dao.reservation(daomap);
		
		return cnt;
	}

	//������
	@Override
	public ArrayList<ReservDTO> reservList(String id) {
		ArrayList<ReservDTO> dtos = null;
		
		ReservDAO dao = sqlSession.getMapper(ReservDAO.class);
		dtos = dao.reservList(id);
		
		return dtos;
	}
	
	//�������
	@Override
	public int reservCancel(Map<String, Object> daomap) {
		int cnt = 0;
		
		ReservDAO dao = sqlSession.getMapper(ReservDAO.class);
		cnt = dao.reservCancel(daomap);
		
		return cnt;
	}

	//���� ����
	@Override
	public int delReserv(String book_id) {
		int cnt = 0;
		
		ReservDAO dao = sqlSession.getMapper(ReservDAO.class);
		cnt = dao.delReserv(book_id);
		
		return cnt;
	}
	
	//�ߺ����� Ȯ��
	@Override
	public int preReserv(Map<String, Object> daomap) {
		int cnt = 0;
		
		ReservDAO dao = sqlSession.getMapper(ReservDAO.class);
		cnt = dao.preReserv(daomap);
		
		return cnt;
	}

	//����Ȯ��
	@Override
	public String checkQueue(Map<String, Object> daomap) {
		String cnt = null;
		
		ReservDAO dao = sqlSession.getMapper(ReservDAO.class);
		cnt = dao.checkQueue(daomap);
		
		return cnt;
	}

	//������� ���
	@Override
	public void updateQueue(String book_id) {
		
		ReservDAO dao = sqlSession.getMapper(ReservDAO.class);
		dao.updateQueue(book_id);
		
	}

	//��������� 0���ϵǸ� �����ϱ�
	@Override
	public void delQueue(String book_id) {
		
		ReservDAO dao = sqlSession.getMapper(ReservDAO.class);
		dao.delQueue(book_id);
		
	}

}
