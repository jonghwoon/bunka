package cobra.mvc.center.common.persistence;

import java.util.ArrayList;
import java.util.HashMap;

import cobra.mvc.center.common.domain.DTO;
import cobra.mvc.center.common.domain.FileDTO;


public interface DAO {
	
	// ���� ��ɾ� 1
	public ArrayList<DTO> myCheck(DTO dto);
	public ArrayList<DTO> mySearch(DTO dto);
	public ArrayList<DTO> mySelect(DTO dto);
	
	// ���� ��ɾ� 2
	public int myCount (DTO dto);
	public int myUpdate(DTO dto);
	public int myDelete(DTO dto);
	public int myInsert(DTO dto);
	
	// ���� ��ɾ� 3
	public ArrayList<DTO> mySearchAndPaging(HashMap<String, Object> map);
	
	// sql�� ����
	ArrayList<DTO> sqlSelect(HashMap<String, String> map);
	public int 		sqlInsert(HashMap<String, String> map);
	public int 		sqlUpdate(HashMap<String, String> map);
	
	// �׽�Ʈ��	
	public ArrayList<DTO> myTest(DTO dto);
	
	// Ư��
	int	fileUpload(FileDTO fdto);
	int	fileUpdate(FileDTO fdto);
	DTO fileDownload(DTO dto);
	
	
}
