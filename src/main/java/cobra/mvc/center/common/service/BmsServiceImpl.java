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
	
	// 일반 핸들러 ===========================================================
	
	@Override
	public int login(DTO dto, HttpServletRequest req){
		// 로그 =====================================================
		System.out.println("  ▶ login(DTO dto, HttpServletRequest req)");
		
		// 초기화 ===================================================		
		initHandlerUtil(req);
		
		// 계산 =====================================================
			//logout 명령시 세션 로그인 데이터 삭제
		
			if(getVar("logout")!=null){
				req.getSession().setAttribute("id", null);
				req.getSession().setAttribute("name", null);
				req.getSession().setAttribute("grade", null);

				// 값을 담지 않고 리턴
				return 0;	 
			}
			
			//입력값 없는지 다시한번 체크 
			if(getVar("id")==null || getVar("passwd")==null) return 0;
			
			// DTO 체크
			int cnt = play(dto,"check",req);
			cnt = cnt>1 ? 0 : cnt;
			
			// 세션에 데이터 할당
			if(cnt==1){
				dto = (DTO)getVar("dto");	// 입력한 dto 는 변형되지 않았다. 왜일까? 다시 넣어주자. 
				
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
			
			// 마지막 로그인 시간 업데이트 
				// 이후 추가 
			
		// 반환 =====================================================
		return cnt;
	}
	@Override
	public int play(DTO dto, String query, HttpServletRequest req){
		// 로그 =====================================================
		System.out.println("  ▶ Play in  : " + query);		
		// 초기화 ===================================================
		initHandlerUtil(req);
		
		for(String name : dto.getNames()){
			String value = (String)getVar(name);
			if(value!=null && value!="")
				dto.setValue(name, value);	
		}
		
		ArrayList<DTO> dtos = new ArrayList<DTO>();
		int cnt=0;
		
		// 실행 =====================================================
		Object result = dao.PlayQuery(dto, query);
		
		// 변수 담기 ================================================
		Class<?> resultClass = result.getClass();
		if (resultClass == Integer.class)		cnt = (int)result;
		if (resultClass == ArrayList.class)	dtos= (ArrayList<DTO>) result;
		
		// 반환 =====================================================
		
		if(dtos.size()!=0) {
			req.setAttribute("dtos", dtos);
			cnt = dtos.size();
			dto = cnt==1 ? dtos.get(0) : dto;			
		}
		req.setAttribute("dto",dto);
		req.setAttribute("cnt",cnt);
		
		d("  ▷ Play out : " + query + " / cnt : " + cnt);
		
		return cnt;
	}
		
	@Override
	public int SearchAndPaging(DTO dto, HttpServletRequest req){		
		// 필요 변수 목록 ============================================
			// nextPage		가야하는 페이지번호 
			// mesureOfPage 페이지당 보이는 게시물 수
			// 게시물을 어디서 어디까지 받아와야 하는지 계산
		
		// 초기화 ====================================================	
		initHandlerUtil(req);		
		for(String name : dto.getNames()){
			String value = (String)getVar(name);
			if(value!=null && value!="")
				dto.setValue(name, value);	
		}
		ArrayList<DTO> dtos = new ArrayList<DTO>();
		int cnt=0;
		
		// 변수 계산 =================================================		
		String nextPage 		= (String)getVar("nextPage");
		String measureOfPage 	= (String)getVar("measureOfPage");
		
		nextPage	 = nextPage==null 		? "1"  : nextPage;
		measureOfPage= measureOfPage==null 	? "15" : measureOfPage;
		
		int startIdx =1 , endIdx = 15;	// 초기값을 대충	
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
	
	// 특수 핸들러 ===========================================================	
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
		// 파일 크기 15MB로 제한 차후..
				//int sizeLimit = 1024*1024*15;
		
		// 변수 준비 =============================================== 
		int cnt = 0;
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)req;
		// id 로드 =================================================
		String id = (String)multipartRequest.getParameter("id");
			//debug 
				//d(id);
		
		// 파일 로드 ===============================================
		java.util.Iterator<String> varNames = multipartRequest.getFileNames();
		while(varNames.hasNext()){	
			String varName = varNames.next();							//! 여기서는 변수명이 할당되는듯 하다. 
			MultipartFile mFile = multipartRequest.getFile(varName);	//! 파일 할당 
			String fileName = mFile.getOriginalFilename();				//! 파일 이름 할당.
			
			//Debug
				//System.out.println("varName "+ varName);
				//System.out.println("fileName"+ fileName);
			
			
			//아이디 유무에 따라 저장 경로 지정 ===========================================
				// 상대 경로가 가능한가도 생각해볼까?
			
			/*
		    File path1 = new File(".");
		    System.out.println(path1.getAbsolutePath());
		    */
		    
			//경로 만들기 - 경로는 언제 분기해야 하는가?
			/*
		    String path1 = this.getClass().getResource("").getPath(); // 현재 클래스의 절대 경로를 가져온다.
		    System.out.println(path1); //--> 절대 경로가 출력됨
			*/
		    //Set pathSet = req.getSession().getServletContext().getResourcePaths("/");
		    //System.out.println("path : " + );
			
			// String filepath  = application.getRealPath("/WEB-INF/" + dir[0]+ ".txt");
			
			
			String str = "";
			//str = req.getContextPath();														// 	/center
			//str = req.getServletPath();														//	/guest_info_pro.common
			//str = req.getRealPath("");														//	D:\DEV\apache-tomcat-8.5.13\wtpwebapps\center\		//톰캣 주소네 이거 아니여..
			//str = this.getClass().getResource("").getPath(); 									//  /D:/DEV/apache-tomcat-8.5.13/wtpwebapps/center/WEB-INF/classes/cobra/mvc/center/common/service/ //톰캣주소.. 안된다.
			//str = File path1 = new File(".");	System.out.println(path1.getAbsolutePath());	//  // D:\DEV\eclipse\.
			//str = req.getSession().getServletContext().getRealPath("/");						//  D:\DEV\apache-tomcat-8.5.13\wtpwebapps\center\
			//str = req.getSession().getServletContext().getContext("").getRealPath("");		//  에러난다
			//System.out.println("path : " + str);
			// 상대경로를 찾지 못했다.
			
			//  경로를 공통으로 지정한다. 
			// String path="c:/resources/common/img/member_profile/";	// 이것도 보안문제로 안된다. 으아아아아아!!!
			
			/*
			if(id!=null)
				path = "./resources/common/img/member_profile/"+id+".jpg";
				//path = "D:/DEV/WORKS/center/src/main/webapp/resources/common/img/member_profile/"+id+".jpg";
			else
				path = "D:/DEV/WORKS/center/src/main/webapp/resources/common/file/"+fileName;
			*/
						
			String path = "D:/DEV/WORKS/center/src/main/webapp/resources/common/img/member_profile/";
			
			//int random  = (int)(Math.random() * 10000); // String.valueOf(Math.round((Math.random()*10000)));	
			
			//File file = new File("파일을저장할경로"+"파일이름"); ========================
			//File file = new File(path+id+random+".jpg");
			
			
			/*
			if(mFile.getSize()==0) continue; 		//File Null Check	
				
			if(!file.exists())					 	//경로상에 파일이 존재하지 않을 경우	
			{	
				if(file.getParentFile().mkdirs()) 	//경로에 해당하는 디렉토리들을 생성	
				{
					try {file.createNewFile(); }	//이후 파일 생성	
					catch (IOException e) {e.printStackTrace();}	
				}
			}
			try {
				mFile.transferTo(file);
				cnt=1;
			}			//임시로 저장된 multipartFile을 실제 파일로 전송 
			catch (IllegalStateException e) {	e.printStackTrace();} 
			catch (IOException e) {e.printStackTrace();}
			*/
			
			/*
			private String filename;
			private MultipartFile binary;
			*/
			fdto.setFilename(id+".jpg");
			fdto.setBinary(mFile.getBytes());
			
			

			//filename 을 찾는다.
			cnt = dao.myCount((DTO)fdto);
			
			if(cnt==0)	dao.fileUpload(fdto);
			else		dao.fileUpdate(fdto);
		}
		
		
		
		setVar("cnt", cnt);
		
		// 상태
		// : 1 	성공
		// : 400 파일이 적합하지 않음
		// : 1000 파일 용량이 너무 크다.

		
		
		//출처: http://goldenraccoon.tistory.com/entry/MultpartHttpServletRequest로-다중-파일-업로드-구현 [황금너구리 블로그]
		//엄청 고생했는데 이분에게 많이 감사해야할듯... 
		
		// 검사 : 확장자 , 용량 , 실제이미지인가,  
		
		// 오라클 변수들 
			// NUM 고유번호 : 
			// CAT 카테고리 : 폴더가 다를것
			// NUM 게시판번호 : 
			// 파일명 : 
			// 실제 파일명 :  
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