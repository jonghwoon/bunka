package cobra.mvc.center.art.service;

import javax.servlet.http.HttpServletRequest;

import cobra.mvc.center.common.domain.DTO;

public interface Service_art {
	// 일반 =============================================================	
	
	
	// 특수 =============================================================
	int showFind(DTO dto, HttpServletRequest req);
	int showResPro(DTO dto, HttpServletRequest req);
	int showSeatView(DTO dto, HttpServletRequest req);
	int showResBack(DTO dto, HttpServletRequest req);	
}
