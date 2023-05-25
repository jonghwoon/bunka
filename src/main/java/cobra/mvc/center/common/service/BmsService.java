package cobra.mvc.center.common.service;

import javax.servlet.http.HttpServletRequest;

import cobra.mvc.center.common.domain.DTO;

public interface BmsService {	
	
	// 일반 =============================================================
		int play (DTO dto, String query, HttpServletRequest req);
		int SearchAndPaging(DTO dto, HttpServletRequest req);
		int login(DTO dto, HttpServletRequest req);
	
	
	// 특수 =============================================================
		// 메인화면 서브 로드를 위한 DTO : 최신 3건의 새 등록 데이터를 로드하여 메인화면 서브에 전달한다.  
		int main_sub(DTO dto, HttpServletRequest req);
		
	
	
	
}
