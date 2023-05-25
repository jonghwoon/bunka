package cobra.mvc.center.common.service;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.filechooser.FileNameExtensionFilter;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import cobra.mvc.center.common.domain.DTO;
import cobra.mvc.center.common.domain.FileDTO;
import cobra.mvc.center.common.persistence.DAOImpl;

@Service
public class BmsServiceImpl extends HandlerUtil implements BmsService{

	@Inject				
	DAOImpl dao;
	
	// �Ϲ� �ڵ鷯 ===========================================================
	
	@Override
	public int login(DTO dto, HttpServletRequest req){
		// �α� =====================================================
		System.out.println("  �� login(DTO dto, HttpServletRequest req)");
		
		// �ʱ�ȭ ===================================================		
		initHandlerUtil(req);
		
		// ��� =====================================================
			//logout ��ɽ� ���� �α��� ������ ����
		
			if(getVar("logout")!=null){
				req.getSession().setAttribute("id", null);
				req.getSession().setAttribute("name", null);
				req.getSession().setAttribute("grade", null);

				// ���� ���� �ʰ� ����
				return 0;	 
			}
			
			//�Է°� ������ �ٽ��ѹ� üũ 
			if(getVar("id")==null || getVar("passwd")==null) return 0;
			
			// DTO üũ
			int cnt = play(dto,"check",req);
			cnt = cnt>1 ? 0 : cnt;
			
			// ���ǿ� ������ �Ҵ�
			if(cnt==1){
				dto = (DTO)getVar("dto");	// �Է��� dto �� �������� �ʾҴ�. ���ϱ�? �ٽ� �־�����. 
				
				String id 	 = dto.getValue("id");
				String name = dto.getValue("name");
				String grade= dto.getValue("grade");
				
				req.getSession().setAttribute("id"  , id);
				req.getSession().setAttribute("name", name);
				req.getSession().setAttribute("grade", grade);	
				
				setVar("dtos","");
				setVar("dto","");
				
				setVar("idCnt",cnt);
			}			
			
			// ������ �α��� �ð� ������Ʈ 
				// ���� �߰� 
			
		// ��ȯ =====================================================
		return cnt;
	}
	@Override
	public int play(DTO dto, String query, HttpServletRequest req){
		// �α� =====================================================
		System.out.println("  �� Play in  : " + query);		
		// �ʱ�ȭ ===================================================
		initHandlerUtil(req);
		
		for(String name : dto.getNames()){
			String value = (String)getVar(name);
			if(value!=null && value!="")
				dto.setValue(name, value);	
		}
		
		ArrayList<DTO> dtos = new ArrayList<DTO>();
		int cnt=0;
		
		// ���� =====================================================
		Object result = dao.PlayQuery(dto, query);
		
		// ���� ��� ================================================
		Class<?> resultClass = result.getClass();
		if (resultClass == Integer.class)		cnt = (int)result;
		if (resultClass == ArrayList.class)	dtos= (ArrayList<DTO>) result;
		
		// ��ȯ =====================================================
		
		if(dtos.size()!=0) {
			req.setAttribute("dtos", dtos);
			cnt = dtos.size();
			dto = cnt==1 ? dtos.get(0) : dto;			
		}
		req.setAttribute("dto",dto);
		req.setAttribute("cnt",cnt);
		
		d("  �� Play out : " + query + " / cnt : " + cnt);
		
		return cnt;
	}
		
	@Override
	public int SearchAndPaging(DTO dto, HttpServletRequest req){		
		// �ʿ� ���� ��� ============================================
			// nextPage		�����ϴ� ��������ȣ 
			// mesureOfPage �������� ���̴� �Խù� ��
			// �Խù��� ��� ������ �޾ƿ;� �ϴ��� ���
		
		// �ʱ�ȭ ====================================================	
		initHandlerUtil(req);		
		for(String name : dto.getNames()){
			String value = (String)getVar(name);
			if(value!=null && value!="")
				dto.setValue(name, value);	
		}
		ArrayList<DTO> dtos = new ArrayList<DTO>();
		int cnt=0;
		
		// ���� ��� =================================================		
		String nextPage 		= (String)getVar("nextPage");
		String measureOfPage 	= (String)getVar("measureOfPage");
		
		nextPage	 = nextPage==null 		? "1"  : nextPage;
		measureOfPage= measureOfPage==null 	? "15" : measureOfPage;
		
		int startIdx =1 , endIdx = 15;	// �ʱⰪ�� ����	
		if(nextPage!="" && measureOfPage!=""){
			int nextp 	 = Integer.parseInt(nextPage); 
			int measure = Integer.parseInt(measureOfPage); 
			startIdx = (nextp-1)* measure + 1;
			endIdx   =  nextp 	* measure;
		}
		
		// ===========================================================	
		cnt = dao.myCount(dto);
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("start"	, startIdx);
		map.put("end"	, endIdx);
		map.put("dto", dto);
		
		dtos = dao.mySearchAndPaging(map);
		
		setVar("dtos", dtos);
		setVar("dto" , dto);
		setVar("cnt" , cnt);
		
		setVar("nextPage", nextPage);
		
		return cnt;
	}
	
	// Ư�� �ڵ鷯 ===========================================================	
	@Override
	public int main_sub(DTO dto, HttpServletRequest req) {
		int cnt=0;
		req.setAttribute("measureOfPage", "3");
		req.setAttribute("nextPage", "1");
		cnt = SearchAndPaging(dto, req);
		return cnt;
	}
	
	public void upload(FileDTO fdto, HttpServletRequest req) throws IOException {
		initHandlerUtil(req);
		// ���� ũ�� 15MB�� ���� ����..
				//int sizeLimit = 1024*1024*15;
		
		// ���� �غ� =============================================== 
		int cnt = 0;
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)req;
		// id �ε� =================================================
		String id = (String)multipartRequest.getParameter("id");
			//debug 
				//d(id);
		
		// ���� �ε� ===============================================
		java.util.Iterator<String> varNames = multipartRequest.getFileNames();
		while(varNames.hasNext()){	
			String varName = varNames.next();							//! ���⼭�� �������� �Ҵ�Ǵµ� �ϴ�. 
			MultipartFile mFile = multipartRequest.getFile(varName);	//! ���� �Ҵ� 
			String fileName = mFile.getOriginalFilename();				//! ���� �̸� �Ҵ�.
			
			//Debug
				//System.out.println("varName "+ varName);
				//System.out.println("fileName"+ fileName);
			
			
			//���̵� ������ ���� ���� ��� ���� ===========================================
				// ��� ��ΰ� �����Ѱ��� �����غ���?
			
			/*
		    File path1 = new File(".");
		    System.out.println(path1.getAbsolutePath());
		    */
		    
			//��� ����� - ��δ� ���� �б��ؾ� �ϴ°�?
			/*
		    String path1 = this.getClass().getResource("").getPath(); // ���� Ŭ������ ���� ��θ� �����´�.
		    System.out.println(path1); //--> ���� ��ΰ� ��µ�
			*/
		    //Set pathSet = req.getSession().getServletContext().getResourcePaths("/");
		    //System.out.println("path : " + );
			
			// String filepath  = application.getRealPath("/WEB-INF/" + dir[0]+ ".txt");
			
			
			String str = "";
			//str = req.getContextPath();														// 	/center
			//str = req.getServletPath();														//	/guest_info_pro.common
			//str = req.getRealPath("");														//	D:\DEV\apache-tomcat-8.5.13\wtpwebapps\center\		//��Ĺ �ּҳ� �̰� �ƴϿ�..
			//str = this.getClass().getResource("").getPath(); 									//  /D:/DEV/apache-tomcat-8.5.13/wtpwebapps/center/WEB-INF/classes/cobra/mvc/center/common/service/ //��Ĺ�ּ�.. �ȵȴ�.
			//str = File path1 = new File(".");	System.out.println(path1.getAbsolutePath());	//  // D:\DEV\eclipse\.
			//str = req.getSession().getServletContext().getRealPath("/");						//  D:\DEV\apache-tomcat-8.5.13\wtpwebapps\center\
			//str = req.getSession().getServletContext().getContext("").getRealPath("");		//  ��������
			//System.out.println("path : " + str);
			// ����θ� ã�� ���ߴ�.
			
			//  ��θ� �������� �����Ѵ�. 
			// String path="c:/resources/common/img/member_profile/";	// �̰͵� ���ȹ����� �ȵȴ�. ���ƾƾƾƾ�!!!
			
			/*
			if(id!=null)
				path = "./resources/common/img/member_profile/"+id+".jpg";
				//path = "D:/DEV/WORKS/center/src/main/webapp/resources/common/img/member_profile/"+id+".jpg";
			else
				path = "D:/DEV/WORKS/center/src/main/webapp/resources/common/file/"+fileName;
			*/
						
			String path = "D:/DEV/WORKS/center/src/main/webapp/resources/common/img/member_profile/";
			
			//int random  = (int)(Math.random() * 10000); // String.valueOf(Math.round((Math.random()*10000)));	
			
			//File file = new File("�����������Ұ��"+"�����̸�"); ========================
			//File file = new File(path+id+random+".jpg");
			
			
			/*
			if(mFile.getSize()==0) continue; 		//File Null Check	
				
			if(!file.exists())					 	//��λ� ������ �������� ���� ���	
			{	
				if(file.getParentFile().mkdirs()) 	//��ο� �ش��ϴ� ���丮���� ����	
				{
					try {file.createNewFile(); }	//���� ���� ����	
					catch (IOException e) {e.printStackTrace();}	
				}
			}
			try {
				mFile.transferTo(file);
				cnt=1;
			}			//�ӽ÷� ����� multipartFile�� ���� ���Ϸ� ���� 
			catch (IllegalStateException e) {	e.printStackTrace();} 
			catch (IOException e) {e.printStackTrace();}
			*/
			
			/*
			private String filename;
			private MultipartFile binary;
			*/
			fdto.setFilename(id+".jpg");
			fdto.setBinary(mFile.getBytes());
			
			

			//filename �� ã�´�.
			cnt = dao.myCount((DTO)fdto);
			
			if(cnt==0)	dao.fileUpload(fdto);
			else		dao.fileUpdate(fdto);
		}
		
		
		
		setVar("cnt", cnt);
		
		// ����
		// : 1 	����
		// : 400 ������ �������� ����
		// : 1000 ���� �뷮�� �ʹ� ũ��.

		
		
		//��ó: http://goldenraccoon.tistory.com/entry/MultpartHttpServletRequest��-����-����-���ε�-���� [Ȳ�ݳʱ��� ��α�]
		//��û ����ߴµ� �̺п��� ���� �����ؾ��ҵ�... 
		
		// �˻� : Ȯ���� , �뷮 , �����̹����ΰ�,  
		
		// ����Ŭ ������ 
			// NUM ������ȣ : 
			// CAT ī�װ� : ������ �ٸ���
			// NUM �Խ��ǹ�ȣ : 
			// ���ϸ� : 
			// ���� ���ϸ� :  
			// 
		
		
	}

	public void download(DTO fdto, HttpServletRequest req, HttpServletResponse res) throws IOException {
		initHandlerUtil(req);
		
		String filename = (String)req.getAttribute("filename");
		System.out.println("filename : " + filename);
		if(filename!=null){			
			fdto.setValue("filename", filename);			
			fdto = dao.fileDownload(fdto);			 
			req.setAttribute("fdto", fdto);
		}
		
	}	
}	