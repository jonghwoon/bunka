package cobra.mvc.center.circle.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import cobra.mvc.center.common.domain.DTO;

public interface CircleService {	
	
	// 일반 =============================================================
	public int Board(Model model, DTO dto, HttpServletRequest req) throws Exception;
	public void ViewContents(Model model, DTO dto, HttpServletRequest req) throws Exception;
	public void BoardModi(Model model, DTO dto, HttpServletRequest req) throws Exception;
	public int BoardModiPro(Model model, DTO dto, HttpServletRequest req) throws Exception;
	public int BoardDel(Model model, DTO dto, HttpServletRequest req) throws Exception;
	public int writePro(Model model, DTO dto, HttpServletRequest req) throws Exception;
	
	public ArrayList<DTO> searchResult(Model model, DTO dto, HttpServletRequest req) throws Exception;
	public ArrayList<DTO> viewCircle(Model model, DTO dto, HttpServletRequest req) throws Exception;
	
	public int Qboard(Model model, DTO dto, HttpServletRequest req) throws Exception;
	public void QViewContents(Model model, DTO dto, HttpServletRequest req) throws Exception;
	public void QBoardModi(Model model, DTO dto, HttpServletRequest req) throws Exception;
	public int QBoardModiPro(Model model, DTO dto, HttpServletRequest req) throws Exception;
	public int QBoardDel(Model model, DTO dto, HttpServletRequest req) throws Exception;
	public int QwritePro(Model model, DTO dto, HttpServletRequest req) throws Exception;
	
	public ArrayList<DTO> searchrounge(Model model, DTO dto, HttpServletRequest req) throws Exception;
	public ArrayList<DTO> roungeinfo(Model model, DTO dto, HttpServletRequest req) throws Exception;
	public int request(Model model, DTO dto, HttpServletRequest req) throws Exception;
	public ArrayList<DTO> viewCircleInfo(Model model, DTO dto, HttpServletRequest req) throws Exception;
	
	public int admin_circle_form(Model model,DTO dto, HttpServletRequest req) throws Exception;
	public int admin_circle_addPro(Model model, DTO dto, HttpServletRequest req) throws Exception;
	public int admin_circle_deletePro(Model model,DTO dto, HttpServletRequest req) throws Exception;
	public int admin_circle_updatePro(Model model,DTO dto, HttpServletRequest req) throws Exception;
	
	public int admin_member_form(Model model,DTO dto, HttpServletRequest req) throws Exception;
	public int admin_member_addPro(Model model, DTO dto, HttpServletRequest req) throws Exception;
	public int admin_member_deletePro(Model model,DTO dto, HttpServletRequest req) throws Exception;
	public int admin_member_updatePro(Model model,DTO dto, HttpServletRequest req) throws Exception;
	
	public int admin_board_form(Model model,DTO dto, HttpServletRequest req) throws Exception;
	public int admin_board_addPro(Model model, DTO dto, HttpServletRequest req) throws Exception;
	public int admin_board_deletePro(Model model,DTO dto, HttpServletRequest req) throws Exception;
	public int admin_board_updatePro(Model model,DTO dto, HttpServletRequest req) throws Exception;
	
	public int admin_qboard_form(Model model,DTO dto, HttpServletRequest req) throws Exception;
	public int admin_qboard_addPro(Model model, DTO dto, HttpServletRequest req) throws Exception;
	public int admin_qboard_deletePro(Model model,DTO dto, HttpServletRequest req) throws Exception;
	public int admin_qboard_updatePro(Model model,DTO dto, HttpServletRequest req) throws Exception;
	
	public int admin_request_form(Model model,DTO dto, HttpServletRequest req) throws Exception;
	public int admin_request_addPro(Model model, DTO dto, HttpServletRequest req) throws Exception;
	public int admin_request_deletePro(Model model,DTO dto, HttpServletRequest req) throws Exception;
	public int admin_request_updatePro(Model model,DTO dto, HttpServletRequest req) throws Exception;
	
	// 특수 =============================================================
}
