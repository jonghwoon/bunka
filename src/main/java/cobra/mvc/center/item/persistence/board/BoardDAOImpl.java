package cobra.mvc.center.item.persistence.board;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cobra.mvc.center.item.domain.BoardDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	//객체주입
	@Autowired
	private SqlSession sqlSession; //sqlSession: 참조변수
	
	//숫자구하기
	@Override
	public int getCount() {
		int cnt = 0;
		
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		cnt = dao.getCount();
			
		return cnt;
	}

	//숫자판별
	public boolean isNum(String str) {
		boolean result = false;
		
		try {
			Integer.parseInt(str);
			result = true;
		} catch(NumberFormatException e1){
			System.out.println("숫자아님");
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	//게시글뿌리기
	@Override
	public ArrayList<BoardDTO> getArticles(Map<String, Object> daoMap) {
		//1. 큰바구니 
		ArrayList<BoardDTO> dtos = null;
		
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dtos = (ArrayList<BoardDTO>) dao.getArticles(daoMap);
		//1. 큰바구니 생성
		//2. 작은 바구니 생성
		//3. 게시글 1건을 읽어 rs를 작은 바구니에 담는다
		//4. 큰바구니 (ArrayList dtos)에 작은 바구니를 담는다.
		
		return dtos;
	}

	//검색결과뿌리기
	@Override
	public ArrayList<BoardDTO> getSearch(Map<String, Object> daoMap) {
		//1. 큰바구니 
		ArrayList<BoardDTO> dtos = null;
		
		int num = 0;
		
		String numcheck = (String) daoMap.get("search");
		
		//숫자판별
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
