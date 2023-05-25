package cobra.mvc.center.item.persistence.board;

import java.util.ArrayList;
import java.util.Map;

import cobra.mvc.center.item.domain.BoardDTO;

public interface BoardDAO {

	//°¹¼ö±¸ÇÏ±â
	public int getCount();
	
	public ArrayList<BoardDTO> getArticles(Map<String, Object> daoMap);

	public ArrayList<BoardDTO> getSearch(Map<String, Object> daoMap);
}
