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
	
	//�����������Ȯ��
	@Override
	public int checkRentState(String book_id) {
		int cnt = 0;
		
		RendDAO dao = sqlSession.getMapper(RendDAO.class);
		cnt = dao.checkRentState(book_id);
		
		return cnt;
	}

	//���� �뿩�ϱ�
	@Override
	public int rendBook(Map<String, Object> daoMap) {
		int cnt = 0;
		
		RendDAO dao = sqlSession.getMapper(RendDAO.class);
		cnt = dao.rendBook(daoMap);
		
		return cnt;
	}

	//�̿��� ���Ƽ üũ�ϱ�
	@Override
	public MemberDTO checkPenalty(String id) {
		MemberDTO dto = null;
		
		RendDAO dao = sqlSession.getMapper(RendDAO.class);
		dto = dao.checkPenalty(id);
		
		return dto;
	}

	//���� + �뿩������������
	@Override
	public BookDTO getDetail(String book_id) {
		BookDTO dto = null;
		
		RendDAO dao = sqlSession.getMapper(RendDAO.class);
		dto = dao.getDetail(book_id);
		
		return dto;
	}

	//���� ��� Ȯ��
	@Override
	public String checkUserReg(String id) {
		String cnt = null;
		
		RendDAO dao = sqlSession.getMapper(RendDAO.class);
		cnt = dao.checkUserReg(id);
		
		return cnt;
	}

	//���� ���
	@Override
	public int register(String id) {
		int cnt = 0;
		
		RendDAO dao = sqlSession.getMapper(RendDAO.class);
		cnt = dao.register(id);
		
		return cnt;
	}

	//��������
	@Override
	public int delPenalty(String id) {
		int cnt = 0;
		
		RendDAO dao = sqlSession.getMapper(RendDAO.class);
		cnt = dao.delPenalty(id);
		
		return cnt;
	}
	
	//�뿩�� å ���� Ȯ��
	@Override
	public int getRendCount(String id) {
		int cnt = 0;
		
		RendDAO dao = sqlSession.getMapper(RendDAO.class);
		cnt = dao.getRendCount(id);
		
		return cnt;
	}

	//�뿩�� ���� ���
	@Override
	public ArrayList<RendDTO> getRendList(String id) {
		ArrayList<RendDTO> dtos = null;
		
		RendDAO dao = sqlSession.getMapper(RendDAO.class);
		dtos = dao.getRendList(id);
		
		return dtos;
	}
	
	//����å ��
	@Override
	public RendDTO getRendDetail(String book_id) {
		RendDTO dto = null;
		
		RendDAO dao = sqlSession.getMapper(RendDAO.class);
		dto = dao.getRendDetail(book_id);
		
		return dto;
	}

	//�̿����� ����
	@Override
	public int setPenalty(String id) {
		int cnt = 0;
		
		RendDAO dao = sqlSession.getMapper(RendDAO.class);
		cnt = dao.setPenalty(id);
		
		return cnt;
	}

	//�����ݳ�
	@Override
	public int returnBook(String book_id) {
		int cnt = 0;
		
		RendDAO dao = sqlSession.getMapper(RendDAO.class);
		cnt = dao.returnBook(book_id);
		
		return cnt;
	}

	//�뿩Ű �޾ƿ���
	@Override
	public int getRend_key(String book_id) {
		int cnt = 0;
		
		RendDAO dao = sqlSession.getMapper(RendDAO.class);
		cnt = dao.getRend_key(book_id);
		
		return cnt;
	}

}
