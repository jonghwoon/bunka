package cobra.mvc.center.art.persistence;

import java.util.ArrayList;
import java.util.HashMap;

import cobra.mvc.center.common.domain.DTO;


public interface DAO_art {

	// 특수 명령어 1
	ArrayList<DTO> showFind(DTO dto);	// 기간 내의 공연을 검색한다. 
	

	
	
}
