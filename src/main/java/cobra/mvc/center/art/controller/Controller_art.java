package cobra.mvc.center.art.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import cobra.mvc.center.art.domain.ShowDTO;
import cobra.mvc.center.art.domain.ShowMemberResDTO;
import cobra.mvc.center.art.domain.ShowMemberResExDTO;
import cobra.mvc.center.art.domain.ShowResDTO;
import cobra.mvc.center.art.service.ServiceImpl_art;
import cobra.mvc.center.common.domain.DTO;
import cobra.mvc.center.common.domain.MemberDTO;
import cobra.mvc.center.common.service.BmsServiceImpl;
import cobra.mvc.center.common.service.HandlerUtil;

@Controller
public class Controller_art extends HandlerUtil{
	
	@Inject		BmsServiceImpl 	service;	
	@Inject		ServiceImpl_art 	service_art;	
	
	ModelAndView mv = new ModelAndView(); // ModelAndView mv = new ModelAndView();
	
	@RequestMapping(value = "*.art" ,method = {RequestMethod.GET , RequestMethod.POST})
	public ModelAndView crossRoad_art(HttpServletRequest req, Model model) throws Exception{		
		
		// ���ڿ� ���� ==================================================================================		
		String viewPage = req.getServletPath();
		viewPage = viewPage.replace("/", "").replace(".art", "");;
		
		// �α� =========================================================================================
		System.out.println("�� " + viewPage + ".art In");

		// DTO �б� - ������ �̸��� ���� ================================================================
		
		String dtoParse;	// what �� ȣ���� ������ �̸��� ���� dto �� �����Ѵ�.  
		if(viewPage.contains("what"))	dtoParse = req.getHeader("REFERER");		
		else							dtoParse = viewPage;
		
		d("dtoParse : " + dtoParse);
		
		DTO dto = null;	
		
		//������ �ּҿ� ����  DTO �б�
		if(dtoParse.contains("inky"))					dto = null;	// ������ ������ �����ؼ� �ܼ��� ������ ���͸� �Ѵ�. 
		else if	(dtoParse.contains("show_member_res"))	dto = new ShowMemberResDTO();
		else if	(dtoParse.contains("show_res"))			dto = new ShowResDTO();		
		else if	(dtoParse.contains("show"))				dto = new ShowDTO();
		else if	(dtoParse.contains("member"))			dto = new MemberDTO();
				
		// ���Ͽ� cnt ����
		int cnt = 0;
		
		// ��ɿ� ���� �б� ========================================================================================================	
		String query ="";
		switch(viewPage){
		
			// ���ͼ�Ʈ ============================================================================================================
			case "test" 						:	viewPage ="show_reservation_form";			break;			
			case "ex" 							:	viewPage ="exhibition_form";				break;
			case "play" 						:	viewPage ="play";							break;
			// Show ================================================================================================================			
			case "show_reservation_form"		:	dto = new ShowDTO();	break;
			case "show_reservation_title"		:	dto = new ShowDTO();	service_art.showFind(dto,req); 	break;
			case "show_reservation_popup"		:	dto = new ShowDTO();	query = "check";		break; 
			case "show_reservation_date"		:	dto = new ShowDTO();	query = "check";		break;
			case "show_reservation_date_none"	:	dto = new ShowDTO();							break;
			case "show_reservation_detail"		:	dto = new ShowDTO();	query = "check";		break;
			
			case "show_reservation_seat"				:	dto = new ShowResDTO();	cnt = service_art.showSeatView(dto, req);	break;
			case "show_reservation_seat_editmode"		:	dto = new ShowDTO(); 	cnt = service_art.showSeatView(dto, req);	break;	// �׽�Ʈ��
			case "show_reservation_seat_editmode_pro"	:	dto = new ShowDTO();	query = "update";  							break;  	
			case "show_reservation_seat_watchdog"		:	dto = new ShowResDTO();	query = "check";							break;	// �ǽð� �¼� ���� ����
			case "show_member_info"						:	dto = new ShowMemberResExDTO(); query = "check";					break;
			
				// show ��� ������ ================================================================================================ 
				case "show_reservation_pro"		:	dto = new ShowResDTO(); 		cnt = service_art.showResPro(dto, req);		break;
				case "show_reservation_back"	:	dto = new ShowMemberResDTO(); 	cnt = service_art.showResBack(dto, req);	break;
				
			// exhibition ==========================================================================================================
			case "exhibition_form" 				:												break;
			
			// Art main sub ========================================================================================================
			case  "main_sub_show"				:	viewPage = "main_sub";		cnt = service.main_sub(dto,req);	break;
			//admin_table
			
			// Case Admin ==========================================================================================================
			
			case "admin_show_form" 				:	cnt = service.SearchAndPaging(dto,req);	break;
			case "admin_show_res_form"	 		:	cnt = service.SearchAndPaging(dto,req);	break;
			case "admin_show_member_res_form" 	:	cnt = service.SearchAndPaging(dto,req);	break;
			
			case "admin_what_addPro" 		:	query = "insert";					break;
			case "admin_what_deletePro" 	:	query = "delete";					break;
			case "admin_what_updatePro" 	:	query = "update";					break;
			
			// Default =============================================================================================================					
			// Case Through page ========================================================================			
			case "index"						:	break;
						
			// Default ==================================================================================
			default :	break;
			// ==========================================================================================
						
		}
		
		// ������ ���� ==================================================================================
		if(query!="")
				cnt = service.play(dto,query,req);

		// ����� =======================================================================================
		System.out.println("�� " + viewPage + ".jsp Out");
		System.out.println("      �� cnt : " + cnt + ";");
		
		// ����   =======================================================================================		
		
		req.setAttribute("cnt", cnt);
		mv.setViewName("art/" + viewPage);		
		
		return mv;
	}
	
}
