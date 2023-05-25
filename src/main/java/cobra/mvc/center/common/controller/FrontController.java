package cobra.mvc.center.common.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cobra.mvc.center.art.domain.ShowDTO;
import cobra.mvc.center.common.domain.DTO;
import cobra.mvc.center.common.domain.FileDTO;
import cobra.mvc.center.common.domain.MemberDTO;
import cobra.mvc.center.common.persistence.DAO;
import cobra.mvc.center.common.service.BmsServiceImpl;
import cobra.mvc.center.common.service.HandlerUtil;

@Controller
public class FrontController extends HandlerUtil{
	
	@Inject						//인젝션 실패한다. @Service  절대 빼먹지 말자 
	BmsServiceImpl service;	//ServiceImpl service  = new ServiceImpl();
		
	//@Inject
	ModelAndView mv = new ModelAndView(); // ModelAndView mv = new ModelAndView();
	
	@RequestMapping(value = "*.common" ,method = {RequestMethod.GET , RequestMethod.POST})
	public ModelAndView crossRoad(HttpServletRequest req, HttpServletResponse res, Model model) throws Exception{		
		
		// 문자열 정제 ==================================================================================		
		String viewPage = req.getServletPath();
		viewPage = viewPage.replace("/", "").replace(".common", "");;
		
		// 로그 =========================================================================================
		System.out.println("★ " + viewPage + ".common In");

		// DTO 분기 - 페이지 이름에 따른 ================================================================
		
		String dtoParse;	// what 은 호출한 페이지 이름에 따라 dto 를 선택한다.  
		if(viewPage.contains("what"))	dtoParse = req.getHeader("REFERER");		
		else							dtoParse = viewPage;
		
		d("dtoParse : " + dtoParse);
		
		DTO dto = null;	
		
		//목적지 주소에 따라  DTO 분기
		if	(dtoParse.contains("show"))	dto = new ShowDTO();
		
		
		else if	(dtoParse.contains("member"))	dto = new MemberDTO();
		/*
		else if	(dtoParse.contains("book"))		dto = new BookDTO();
		else if	(dtoParse.contains("chart"))	dto = new ChartDTO();
		
		else if	(dtoParse.contains("basket"))	dto = new BasketDTO();
		else if	(dtoParse.contains("basketEx"))	dto = new BasketDTO();
		else if	(dtoParse.contains("orderEx"))	dto = new BasketDTO();
		else									dto = new BookDTO();
 		*/	
		

		
		// 기능에 따라 분기 =============================================================================	
		String query ="";
		switch(viewPage){			
			// Test Page ================================================================================
			case "test" 					:	dto = new MemberDTO();	query = "select";			break;
			case "test_search"				:	dto = new MemberDTO();	query = "search";			break;
			
			case "test_uploadPro"			:	service.upload(new FileDTO(),req); 					break;
			case "test_upload"				:	break;	
			
			case "test_download"			:	dto = new FileDTO(); 	req.setAttribute("filename", "guest2.jpg"); 
																		service.download(dto,req,res); break;
																		
			case "img"						:	dto = new FileDTO(); 	service.download(dto,req,res); break;
			
			// common pages =============================================================================
			case  "menu_top"				:	dto= new MemberDTO();	service.login(dto,req); 	break;			
			// 임시 할당
			
			case  "menu_bottom_left"		:	break;
			case  "menu_bottom_right"		:	break;			
			
			case  "guest_info_form"			:	dto= new MemberDTO();	query = "check";					break;			
			case  "guest_info_pro"			:	FileDTO fdto= new FileDTO();	service.upload(fdto,req); 	break;
			case  "guest_info_load"			:	break;
			
			// Case Member ==============================================================================			
			case "guest_member_addFormCheckPro"	:	dto= new MemberDTO();	query = "check";		break;
			case "guest_member_addPro"			:	dto= new MemberDTO();	query = "insert";		break;
			
			// Case Through page ========================================================================			
			case "index"					:	break;
			case "logout" 					:	break;
			
			// Admin page ===============================================================================
			//case "admin_show_form" 			:				
			case "admin_member_form" 		:	service.SearchAndPaging(dto,req);	break;
			
			case "admin_what_addPro" 		:	query = "insert";					break;
			case "admin_what_deletePro" 	:	query = "delete";					break;
			case "admin_what_updatePro" 	:	query = "update";					break;
			// Default ==================================================================================
			default :	break;
			// ==========================================================================================			
		}
		
		// 쿼리문 실행 ==================================================================================
		if(query!="")
				service.play(dto,query,req);

		// 디버그 =======================================================================================
		System.out.println("☆ " + viewPage + ".jsp Out");
		
		// 리턴   =======================================================================================		
		mv.setViewName("common/" + viewPage);		
		return mv;
	}
	
	/*
	@RequestMapping(value = "*.img" ,method = {RequestMethod.GET , RequestMethod.POST})
	public ModelAndView imgLoad(HttpServletRequest req, HttpServletResponse res, Model model) throws Exception{
		DTO dto = new FileDTO();
		req.setAttribute("filename", "guest2.jpg"); 
		service.download(dto,req,res); 
		
		byte[] binary = (byte[]) dto.get("binary");		
		String s64 = new sun.misc.BASE64Encoder().encode(binary);
		
		return mv;
	}
	*/
	
	@RequestMapping(value = "*.img", method = {RequestMethod.GET , RequestMethod.POST})
    public void previewStartHandler(HttpServletRequest req, HttpServletResponse res) throws Exception {    
		System.out.println("*.img in!");
        //blob형 자료를 가져오는 도메인객체 선언 및 매개변수 idx로 해당 데이터 얻어오기
        /*        
        //byte형 배열 image선언
        byte[] image= null;
        //domain객체의 imagefile을 byte배열로 받음
        image = (byte[])getImages.getUploadfile();
        */
		
		String imgPage = req.getServletPath();
		imgPage = imgPage.replace("/", "").replace(".img", ".jpg");
		System.out.println("v:"+imgPage);
		
        FileDTO dto = new FileDTO();
        req.setAttribute("filename", imgPage);
		service.download(dto,req,res);
		
		dto = (FileDTO)req.getAttribute("fdto");
		System.out.println("name" + dto.getFilename());
		System.out.println("byte" + dto.getBinary());

		byte[] image = dto.getBinary();
		
        //응답 내용의 유형을 설정
        res.setContentType("image/jpg");
        
        //응답에 대한 길이(byte)를 설정
        res.setContentLength(image.length);
    
        //OutputStream 생성
        OutputStream os = res.getOutputStream();
        
        //지정된 바이트 배열의 b.length바이트를 이 출력 스트림에 기입.
        os.write(image);
        
        //해당 아웃풋스트림에 버퍼링되어 남아있는 데이터를 실제 스트림으로 보냄. 
        //일반적으로  버퍼가 상요된 아웃픗스트림은 write작업을 하더라도 즉시반영되지 않고 
        //버퍼가 차거나 flush를 호출하여야 그때서야 반영한다고함.
        os.flush();
        
        /*
        String viewPage = req.getServletPath();
		viewPage = viewPage.replace("/", "").replace(".do", ".jsp");;		
        mv.setViewName("common/" + viewPage);
        */
		
    }
	
}
