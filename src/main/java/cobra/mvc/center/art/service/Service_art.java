package cobra.mvc.center.art.service;

import javax.servlet.http.HttpServletRequest;

import cobra.mvc.center.common.domain.DTO;

public interface Service_art {
	// �Ϲ� =============================================================	
	
	
	// Ư�� =============================================================
	int showFind(DTO dto, HttpServletRequest req);
	int showResPro(DTO dto, HttpServletRequest req);
	int showSeatView(DTO dto, HttpServletRequest req);
	int showResBack(DTO dto, HttpServletRequest req);	
}
