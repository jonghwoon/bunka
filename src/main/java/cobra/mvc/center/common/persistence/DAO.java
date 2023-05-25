package cobra.mvc.center.common.persistence;

import java.util.ArrayList;
import java.util.HashMap;

import cobra.mvc.center.common.domain.DTO;
import cobra.mvc.center.common.domain.FileDTO;


public interface DAO {
	
	// 공용 명령어 1
	public ArrayList<DTO> myCheck(DTO dto);
	public ArrayList<DTO> mySearch(DTO dto);
	public ArrayList<DTO> mySelect(DTO dto);
	
	// 공용 명령어 2
	public int myCount (DTO dto);
	public int myUpdate(DTO dto);
	public int myDelete(DTO dto);
	public int myInsert(DTO dto);
	
	// 공용 명령어 3
	public ArrayList<DTO> mySearchAndPaging(HashMap<String, Object> map);
	
	// sql문 전용
	ArrayList<DTO> sqlSelect(HashMap<String, String> map);
	public int 		sqlInsert(HashMap<String, String> map);
	public int 		sqlUpdate(HashMap<String, String> map);
	
	// 테스트용	
	public ArrayList<DTO> myTest(DTO dto);
	
	// 특수
	int	fileUpload(FileDTO fdto);
	int	fileUpdate(FileDTO fdto);
	DTO fileDownload(DTO dto);
	
	
}
