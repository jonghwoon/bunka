package cobra.mvc.center.circle.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import cobra.mvc.center.circle.domain.CirRequestDTO;
import cobra.mvc.center.circle.domain.CirboardDTO;
import cobra.mvc.center.circle.domain.CircleDTO;
import cobra.mvc.center.circle.domain.CircleInfoDTO;
import cobra.mvc.center.circle.domain.CirqboardDTO;
import cobra.mvc.center.circle.domain.CirroungeDTO;
import cobra.mvc.center.circle.service.CircleServiceImpl;
import cobra.mvc.center.common.domain.DTO;
import cobra.mvc.center.common.service.BmsServiceImpl;
import cobra.mvc.center.common.service.HandlerUtil;



@Controller
public class CircleController extends HandlerUtil{
	
	@Inject						//인젝션 실패한다. @Service  절대 빼먹지 말자 
	BmsServiceImpl service;	//ServiceImpl service  = new ServiceImpl();

	@Inject
	CircleServiceImpl service_circle;
	
	//@Inject
	ModelAndView mv = new ModelAndView(); // ModelAndView mv = new ModelAndView();
	
	@RequestMapping(value = "*.circle" ,method = {RequestMethod.GET , RequestMethod.POST})
	public ModelAndView crossRoad(HttpServletRequest req, Model model) throws Exception{		
		
		// 문자열 정제 ==================================================================================		
		String viewPage = req.getServletPath();
		viewPage = viewPage.replace("/", "").replace(".circle", "");
		
		// 로그 =========================================================================================
		System.out.println("★ " + viewPage + ".circle In");

		// DTO 분기 - 페이지 이름에 따른 ================================================================
		
		String dtoParse;	// what 은 호출한 페이지 이름에 따라 dto 를 선택한다.  
		if(viewPage.contains("what"))	dtoParse = req.getHeader("REFERER");		
		else							dtoParse = viewPage;
		
		d("dtoParse : " + dtoParse);
		
		DTO dto = null;
		//목적지 주소에 따라  DTO 분기 
		/*		
		if		(dtoParse.contains("board"))	dto = new BoardDTO(); 
		else if	(dtoParse.contains("book"))		dto = new BookDTO();
		else if	(dtoParse.contains("chart"))	dto = new ChartDTO();
		else if	(dtoParse.contains("member"))	dto = new MemberDTO();
		else if	(dtoParse.contains("basket"))	dto = new BasketDTO();
		else if	(dtoParse.contains("basketEx"))	dto = new BasketDTO();
		else if	(dtoParse.contains("orderEx"))	dto = new BasketDTO();
		else									dto = new BookDTO();
 		*/					
		// 기능에 따라 분기 =============================================================================	
		String query ="";
		switch(viewPage){			
			// Case Book ================================================================================
			//동아리 신청 게시판
			case "main"							:	dto = new CirboardDTO(); 	service_circle.Board(model, dto, req); 			dto = new CirqboardDTO();	 service_circle.Qboard(model, dto, req); 	break;
			case "board"						:	dto = new CirboardDTO();	service_circle.Board(model, dto, req);			break;
			case "viewContents"					:	dto = new CirboardDTO();	service_circle.ViewContents(model, dto, req); 	break;
			case "boardModi"					:	dto = new CirboardDTO();	service_circle.BoardModi(model, dto, req); 		break;
			case "boardModiPro"					:	dto = new CirboardDTO();	service_circle.BoardModiPro(model, dto, req); 	break;
			case "boardDel"						:	dto = new CirboardDTO();	service_circle.BoardDel(model, dto, req); 		break;
			case "writePro"						:	dto = new CirboardDTO();	service_circle.writePro(model, dto, req); 		break;
			//검색 
			case "searchResult"					:	dto = new CircleInfoDTO();	service_circle.searchResult(model, dto, req); 	break;
			case "viewCircle"					:	dto = new CircleInfoDTO();	service_circle.viewCircle(model, dto, req); 	break;
			//질문 게시판
			case "qboard"						:	dto = new CirqboardDTO();	service_circle.Qboard(model, dto, req); 		break;
			case "qviewContents"				:	dto = new CirqboardDTO();	service_circle.QViewContents(model, dto, req); 	break;
			case "qboardModi"					:	dto = new CirqboardDTO();	service_circle.QBoardModi(model, dto, req); 	break;
			case "qboardModiPro"				:	dto = new CirqboardDTO();	service_circle.QBoardModiPro(model, dto, req); 	break;
			case "qboardDel"					:	dto = new CirqboardDTO();	service_circle.QBoardDel(model, dto, req); 		break;
			case "qwritePro"					:	dto = new CirqboardDTO();	service_circle.QwritePro(model, dto, req); 		break;
			//검색 기능
			case "searchrounge"					:	dto = new CirroungeDTO();	service_circle.searchResult(model, dto, req); 	break;
			case "viewCircleInfo"				:	dto = new CircleInfoDTO();	service_circle.viewCircleInfo(model, dto, req); break;
			//동아리 신청
			case "request"						:	dto = new CirRequestDTO();	service_circle.request(model, dto, req); 		break;
			//관리페이지
			//동아리 관리 
			case "admin_circle_form"			:	dto = new CircleInfoDTO();	service_circle.admin_circle_form(model, dto, req); break;
			case "admin_circle_addPro"			:	dto = new CircleInfoDTO();	service_circle.admin_circle_addPro(model, dto, req); break;
			case "admin_circle_deletePro"		:	dto = new CircleInfoDTO();	service_circle.admin_circle_deletePro(model, dto, req); break;
			case "admin_circle_updatePro"		:	dto = new CircleInfoDTO();	service_circle.admin_circle_updatePro(model, dto, req); break;
			//회원 관리
			case "admin_member_form"			:	dto = new CircleDTO();		service_circle.admin_member_form(model, dto, req); break;
			case "admin_member_addPro"			:	dto = new CircleDTO();		service_circle.admin_member_addPro(model, dto, req); break;
			case "admin_member_deletePro"		:	dto = new CircleDTO();		service_circle.admin_member_deletePro(model, dto, req); break;
			case "admin_member_updatePro"		:	dto = new CircleDTO();		service_circle.admin_member_updatePro(model, dto, req); break;
			//동아리 신청 게시판관리
			case "admin_board_form"				:	dto = new CirboardDTO();	service_circle.admin_board_form(model, dto, req); break;
			case "admin_board_addPro"			:	dto = new CirboardDTO();	service_circle.admin_board_addPro(model, dto, req); break;
			case "admin_board_deletePro"		:	dto = new CirboardDTO();	service_circle.admin_board_deletePro(model, dto, req); break;
			case "admin_board_updatePro"		:	dto = new CirboardDTO();	service_circle.admin_board_updatePro(model, dto, req); break;
			//질문 게시판관리
			case "admin_qboard_form"			:	dto = new CirqboardDTO();	service_circle.admin_qboard_form(model, dto, req); break;
			case "admin_qboard_addPro"			:	dto = new CirqboardDTO();	service_circle.admin_qboard_addPro(model, dto, req); break;
			case "admin_qboard_deletePro"		:	dto = new CirqboardDTO();	service_circle.admin_qboard_deletePro(model, dto, req); break;
			case "admin_qboard_updatePro"		:	dto = new CirqboardDTO();	service_circle.admin_qboard_updatePro(model, dto, req); break;
			//동아리 가입신청관리
			case "admin_request_form"			:	dto = new CirRequestDTO();	service_circle.admin_request_form(model, dto, req); break;
			case "admin_request_addPro"			:	dto = new CirRequestDTO();	service_circle.admin_request_addPro(model, dto, req); break;
			case "admin_request_deletePro"		:	dto = new CirRequestDTO();	service_circle.admin_request_deletePro(model, dto, req); break;
			case "admin_request_updatePro"		:	dto = new CirRequestDTO();	service_circle.admin_request_updatePro(model, dto, req); break;
			// Case Member ==============================================================================1
			
			
			// Case Through page ========================================================================			
			case "writeForm"					:	break;
			case "search"						:	break;
			case "qwriteForm"					:	break;
			// Default ==================================================================================
			default 							:	break;
			// ==========================================================================================			
		}
		
		// 쿼리문 실행 ==================================================================================
		if(query!="")
			service.play(dto,query,req);

		// 디버그 =======================================================================================
		System.out.println("☆ " + viewPage + ".jsp Out");
		
		// 리턴   =======================================================================================		
		mv.setViewName("circle/" + viewPage);		
		return mv;
	}
	
}
