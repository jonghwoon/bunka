package cobra.mvc.center.common.service;

import javax.servlet.http.HttpServletRequest;

import cobra.mvc.center.common.domain.DTO;

public interface BmsService {	
	
	// �Ϲ� =============================================================
		int play (DTO dto, String query, HttpServletRequest req);
		int SearchAndPaging(DTO dto, HttpServletRequest req);
		int login(DTO dto, HttpServletRequest req);
	
	
	// Ư�� =============================================================
		// ����ȭ�� ���� �ε带 ���� DTO : �ֽ� 3���� �� ��� �����͸� �ε��Ͽ� ����ȭ�� ���꿡 �����Ѵ�.  
		int main_sub(DTO dto, HttpServletRequest req);
		
	
	
	
}
