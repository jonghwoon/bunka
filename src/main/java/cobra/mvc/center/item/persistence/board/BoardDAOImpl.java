package cobra.mvc.center.item.persistence.board;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cobra.mvc.center.item.domain.BoardDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	//��ü����
	@Autowired
	private SqlSession sqlSession; //sqlSession: ��������
	
	//���ڱ��ϱ�
	@Override
	public int getCount() {
		int cnt = 0;
		
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		cnt = dao.getCount();
			
		return cnt;
	}

	//�����Ǻ�
	public boolean isNum(String str) {
		boolean result = false;
		
		try {
			Integer.parseInt(str);
			result = true;
		} catch(NumberFormatException e1){
			System.out.println("���ھƴ�");
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	//�ԽñۻѸ���
	@Override
	public ArrayList<BoardDTO> getArticles(Map<String, Object> daoMap) {
		//1. ū�ٱ��� 
		ArrayList<BoardDTO> dtos = null;
		
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dtos = (ArrayList<BoardDTO>) dao.getArticles(daoMap);
		//1. ū�ٱ��� ����
		//2. ���� �ٱ��� ����
		//3. �Խñ� 1���� �о� rs�� ���� �ٱ��Ͽ� ��´�
		//4. ū�ٱ��� (ArrayList dtos)�� ���� �ٱ��ϸ� ��´�.
		
		return dtos;
	}

	//�˻�����Ѹ���
	@Override
	public ArrayList<BoardDTO> getSearch(Map<String, Object> daoMap) {
		//1. ū�ٱ��� 
		ArrayList<BoardDTO> dtos = null;
		
		int num = 0;
		
		String numcheck = (String) daoMap.get("search");
		
		//�����Ǻ�
		if(isNum(numcheck)) {
			num = Integer.parseInt(numcheck);
			daoMap.put("num", num);
		} else {
			daoMap.put("num", 0);
		}
		
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dtos = (ArrayList<BoardDTO>) dao.getSearch(daoMap);
		
		
		return dtos;
	}

}
