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
	
	@Inject						//������ �����Ѵ�. @Service  ���� ������ ���� 
	BmsServiceImpl service;	//ServiceImpl service  = new ServiceImpl();
		
	//@Inject
	ModelAndView mv = new ModelAndView(); // ModelAndView mv = new ModelAndView();
	
	@RequestMapping(value = "*.common" ,method = {RequestMethod.GET , RequestMethod.POST})
	public ModelAndView crossRoad(HttpServletRequest req, HttpServletResponse res, Model model) throws Exception{		
		
		// ���ڿ� ���� ==================================================================================		
		String viewPage = req.getServletPath();
		viewPage = viewPage.replace("/", "").replace(".common", "");;
		
		// �α� =========================================================================================
		System.out.println("�� " + viewPage + ".common In");

		// DTO �б� - ������ �̸��� ���� ================================================================
		
		String dtoParse;	// what �� ȣ���� ������ �̸��� ���� dto �� �����Ѵ�.  
		if(viewPage.contains("what"))	dtoParse = req.getHeader("REFERER");		
		else							dtoParse = viewPage;
		
		d("dtoParse : " + dtoParse);
		
		DTO dto = null;	
		
		//������ �ּҿ� ����  DTO �б�
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
		

		
		// ��ɿ� ���� �б� =============================================================================	
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
			// �ӽ� �Ҵ�
			
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
		
		// ������ ���� ==================================================================================
		if(query!="")
				service.play(dto,query,req);

		// ����� =======================================================================================
		System.out.println("�� " + viewPage + ".jsp Out");
		
		// ����   =======================================================================================		
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
        //blob�� �ڷḦ �������� �����ΰ�ü ���� �� �Ű����� idx�� �ش� ������ ������
        /*        
        //byte�� �迭 image����
        byte[] image= null;
        //domain��ü�� imagefile�� byte�迭�� ����
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
		
        //���� ������ ������ ����
        res.setContentType("image/jpg");
        
        //���信 ���� ����(byte)�� ����
        res.setContentLength(image.length);
    
        //OutputStream ����
        OutputStream os = res.getOutputStream();
        
        //������ ����Ʈ �迭�� b.length����Ʈ�� �� ��� ��Ʈ���� ����.
        os.write(image);
        
        //�ش� �ƿ�ǲ��Ʈ���� ���۸��Ǿ� �����ִ� �����͸� ���� ��Ʈ������ ����. 
        //�Ϲ�������  ���۰� ���� �ƿ��ƽ�Ʈ���� write�۾��� �ϴ��� ��ùݿ����� �ʰ� 
        //���۰� ���ų� flush�� ȣ���Ͽ��� �׶����� �ݿ��Ѵٰ���.
        os.flush();
        
        /*
        String viewPage = req.getServletPath();
		viewPage = viewPage.replace("/", "").replace(".do", ".jsp");;		
        mv.setViewName("common/" + viewPage);
        */
		
    }
	
}
