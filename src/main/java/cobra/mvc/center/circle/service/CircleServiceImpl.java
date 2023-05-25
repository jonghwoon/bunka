package cobra.mvc.center.circle.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import cobra.mvc.center.circle.persistence.CircleDAOImpl;
import cobra.mvc.center.common.domain.DTO;
import cobra.mvc.center.common.persistence.DAOImpl;
import cobra.mvc.center.common.service.HandlerUtil;

@Service
public class CircleServiceImpl extends HandlerUtil implements CircleService {
	@Inject	CircleDAOImpl dao_cir;
	@Inject	DAOImpl dao;
	
	@Override
	public int Board(Model model, DTO dto, HttpServletRequest req) throws Exception {
	
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
	
	@Override
	public void ViewContents(Model model, DTO dto, HttpServletRequest req) throws Exception {
		initHandlerUtil(req);
		String writer = req.getParameter("writer");
		String num = req.getParameter("num");
		String subject = req.getParameter("subject");
		String contents = req.getParameter("contents");
		model.addAttribute("writer", writer);
		model.addAttribute("num", num);
		model.addAttribute("subject", subject);
		model.addAttribute("contents", contents);
		for(String name : dto.getNames()){
			String value = (String)getVar(name);
			if(value!=null && value!="")
				dto.setValue(name, value);	
		}
		
		dao.myUpdate(dto);
	}

	@Override
	public void BoardModi(Model model, DTO dto, HttpServletRequest req) throws Exception {
		ArrayList<DTO> dtos;
		initHandlerUtil(req);
		for(String name : dto.getNames()){
			String value = (String)getVar(name);
			if(value!=null && value!="")
				dto.setValue(name, value);	
		}
		
		dtos = dao.myCheck(dto);
		if(dtos.size() == 1) {
			model.addAttribute("dtos", dtos);
		} else {
			model.addAttribute("cnt", 0);
		}
	}

	@Override
	public int BoardModiPro(Model model, DTO dto, HttpServletRequest req) throws Exception {
		initHandlerUtil(req);
		int cnt = 0;
		for(String name : dto.getNames()){
			String value = (String)getVar(name);
			if(value!=null && value!="")
				dto.setValue(name, value);	
		}
		cnt = dao.myUpdate(dto);
		return cnt;
	}

	@Override
	public int BoardDel(Model model, DTO dto, HttpServletRequest req) throws Exception {
		initHandlerUtil(req);
		int cnt = 0;
		ArrayList<DTO> dtos;
		for(String name : dto.getNames()){
			String value = (String)getVar(name);
			if(value!=null && value!="")
				dto.setValue(name, value);
		}
		dtos = dao.myCheck(dto);
		if(dtos.size() == 1) {
			cnt = dao.myDelete(dto);
			model.addAttribute("cnt", cnt);
		} else {
			model.addAttribute("cnt", cnt);
		}
		return cnt;
	}
	
	@Override
	public int writePro(Model model, DTO dto, HttpServletRequest req) throws Exception {
		initHandlerUtil(req);
		int cnt = 0;
		String num = "!CIRCLE_BOARD_SEQ.nextval";
		dto.setValue("num", num);
		
		for(String name : dto.getNames()){
			String value = (String)getVar(name);
			if(value!=null && value!="")
				dto.setValue(name, value);	
		}
		d("writer = " + dto.getValue("writer"));
	
		cnt = dao.myInsert(dto);
		
		if(cnt == 1) {
			model.addAttribute("cnt", cnt);
		} else {
			model.addAttribute("cnt", cnt);
		}
		return cnt;
	}

	@Override
	public ArrayList<DTO> searchResult(Model model, DTO dto, HttpServletRequest req) throws Exception {
		initHandlerUtil(req);
		ArrayList<DTO> dtos;
		for(String name : dto.getNames()){
			String value = (String)getVar(name);
			if(value!=null && value!="")
				dto.setValue(name, value);	
		}
		dtos = dao.mySelect(dto);
		model.addAttribute("dtos", dtos);
		return dtos;
	}
	
	@Override
	public ArrayList<DTO> viewCircle(Model model, DTO dto, HttpServletRequest req) throws Exception {
		initHandlerUtil(req);
		System.out.println("viewCircle service 탔당!!");
		ArrayList<DTO> dtos;
		for(String name : dto.getNames()){
			String value = (String)getVar(name);
			if(value!=null && value!="")
				dto.setValue(name, value);	
		}
		dtos = dao.mySelect(dto);
		model.addAttribute("dtos", dtos);
		return dtos;
	}
	
	@Override
	public int Qboard(Model model, DTO dto, HttpServletRequest req) throws Exception {
		initHandlerUtil(req);
		int cnt=0;
		for(String name : dto.getNames()){
			String value = (String)getVar(name);
			if(value!=null && value!="")
				dto.setValue(name, value);	
		}
		
		ArrayList<DTO> qdtos = new ArrayList<DTO>();
		
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
		cnt = dao.myCount(dto);
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("start"	, startIdx);
		map.put("end"	, endIdx);
		map.put("dto", dto);
		
		qdtos = dao.mySearchAndPaging(map);
		
		setVar("qdtos", qdtos);
		setVar("dto" , dto);
		setVar("cnt" , cnt);
		
		setVar("nextPage", nextPage);
		
		return cnt;
	}
	
	@Override
	public int QwritePro(Model model, DTO dto, HttpServletRequest req) throws Exception {
		initHandlerUtil(req);
		int cnt = 0;
		String num = "!CIRCLE_QBOARD_seq.nextval";
		dto.setValue("num", num);
		
		for(String name : dto.getNames()){
			String value = (String)getVar(name);
			if(value!=null && value!="")
				dto.setValue(name, value);	
		}
		d("writer = " + dto.getValue("writer"));
	
		cnt = dao.myInsert(dto);
		
		if(cnt == 1) {
			model.addAttribute("cnt", cnt);
		} else {
			model.addAttribute("cnt", cnt);
		}
		return cnt;
	}
	
	@Override
	public void QViewContents(Model model, DTO dto, HttpServletRequest req) throws Exception {
		initHandlerUtil(req);
		String writer = req.getParameter("writer");
		String num = req.getParameter("num");
		String subject = req.getParameter("subject");
		String contents = req.getParameter("contents");
		model.addAttribute("writer", writer);
		model.addAttribute("num", num);
		model.addAttribute("subject", subject);
		model.addAttribute("contents", contents);
		for(String name : dto.getNames()){
			String value = (String)getVar(name);
			if(value!=null && value!="")
				dto.setValue(name, value);	
		}
		
		dao.myUpdate(dto);
	}

	@Override
	public void QBoardModi(Model model, DTO dto, HttpServletRequest req) throws Exception {
		ArrayList<DTO> dtos;
		initHandlerUtil(req);
		for(String name : dto.getNames()){
			String value = (String)getVar(name);
			if(value!=null && value!="")
				dto.setValue(name, value);	
		}
		
		dtos = dao.myCheck(dto);
		if(dtos.size() == 1) {
			model.addAttribute("dtos", dtos);
		} else {
			model.addAttribute("cnt", 0);
		}
	}

	@Override
	public int QBoardModiPro(Model model, DTO dto, HttpServletRequest req) throws Exception {
		initHandlerUtil(req);
		int cnt = 0;
		for(String name : dto.getNames()){
			String value = (String)getVar(name);
			if(value!=null && value!="")
				dto.setValue(name, value);	
		}
		cnt = dao.myUpdate(dto);
		return cnt;
	}

	@Override
	public int QBoardDel(Model model, DTO dto, HttpServletRequest req) throws Exception {
		initHandlerUtil(req);
		int cnt = 0;
		ArrayList<DTO> dtos;
		for(String name : dto.getNames()){
			String value = (String)getVar(name);
			if(value!=null && value!="")
				dto.setValue(name, value);
		}
		dtos = dao.myCheck(dto);
		if(dtos.size() == 1) {
			cnt = dao.myDelete(dto);
			model.addAttribute("cnt", cnt);
		} else {
			model.addAttribute("cnt", cnt);
		}
		return cnt;
	}
	
	@Override
	public ArrayList<DTO> searchrounge(Model model, DTO dto, HttpServletRequest req) throws Exception {
		initHandlerUtil(req);
		ArrayList<DTO> dtos;
		for(String name : dto.getNames()){
			String value = (String)getVar(name);
			if(value!=null && value!="")
				dto.setValue(name, value);	
		}
		dtos = dao.mySelect(dto);
		model.addAttribute("dtos", dtos);
		return dtos;
	}
	
	@Override
	public ArrayList<DTO> roungeinfo(Model model, DTO dto, HttpServletRequest req) throws Exception {
		initHandlerUtil(req);
		ArrayList<DTO> dtos;
		for(String name : dto.getNames()){
			String value = (String)getVar(name);
			if(value!=null && value!="")
				dto.setValue(name, value);	
		}
		dtos = dao.mySelect(dto);
		model.addAttribute("dtos", dtos);
		return dtos;
	}
	
	@Override
	public int request(Model model, DTO dto, HttpServletRequest req) throws Exception {
		initHandlerUtil(req);
		int cnt;
		String num = "!CIRCLE_REQUEST_seq.nextval";
		dto.setValue("num", num);
		for(String name : dto.getNames()){
			String value = (String)getVar(name);
			if(value!=null && value!="")
				dto.setValue(name, value);	
		}
		cnt = dao.myInsert(dto);
		model.addAttribute("cnt", cnt);
		return cnt;
	}
	
	@Override
	public ArrayList<DTO> viewCircleInfo(Model model, DTO dto, HttpServletRequest req) throws Exception {
		initHandlerUtil(req);
		ArrayList<DTO> dtos;
		for(String name : dto.getNames()){
			String value = (String)getVar(name);
			if(value!=null && value!="")
				dto.setValue(name, value);	
		}
		dtos = dao.mySelect(dto);
		model.addAttribute("dtos", dtos);
		return dtos;
	}
	
	
	@Override
	public int admin_circle_form(Model model,DTO dto, HttpServletRequest req) throws Exception{		
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
	
	
	@Override
	public int admin_member_form(Model model,DTO dto, HttpServletRequest req) throws Exception{		
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
	
	@Override
	public int admin_board_addPro(Model model, DTO dto, HttpServletRequest req) throws Exception {
		initHandlerUtil(req);
		int cnt;
		String num = "!CIRBOARD_SEQ.nextval";
		dto.setValue("num", num);
		for(String name : dto.getNames()){
			String value = (String)getVar(name);
			if(value!=null && value!="")
				dto.setValue(name, value);	
		}
		cnt = dao.myInsert(dto);
		model.addAttribute("cnt", cnt);
		return cnt;
	}
	
	@Override
	public int admin_board_deletePro(Model model,DTO dto, HttpServletRequest req) throws Exception{		
		initHandlerUtil(req);
		int cnt = 0;
		ArrayList<DTO> dtos;
		for(String name : dto.getNames()){
			String value = (String)getVar(name);
			if(value!=null && value!="")
				dto.setValue(name, value);
		}
		dtos = dao.myCheck(dto);
		if(dtos.size() == 1) {
			cnt = dao.myDelete(dto);
			model.addAttribute("cnt", cnt);
		} else {
			model.addAttribute("cnt", cnt);
		}
		return cnt;
	}
	
	@Override
	public int admin_board_updatePro(Model model,DTO dto, HttpServletRequest req) throws Exception{		
		initHandlerUtil(req);
		int cnt = 0;
		for(String name : dto.getNames()){
			String value = (String)getVar(name);
			if(value!=null && value!="")
				dto.setValue(name, value);	
		}
		cnt = dao.myUpdate(dto);
		return cnt;
	}
	
	@Override
	public int admin_circle_addPro(Model model, DTO dto, HttpServletRequest req) throws Exception {
		initHandlerUtil(req);
		int cnt;
		String num = "!CENTER_CIRCLE_SEQ.nextval";
		dto.setValue("num", num);
		for(String name : dto.getNames()){
			String value = (String)getVar(name);
			if(value!=null && value!="")
				dto.setValue(name, value);	
		}
		cnt = dao.myInsert(dto);
		model.addAttribute("cnt", cnt);
		return cnt;
	}
	
	@Override
	public int admin_circle_deletePro(Model model,DTO dto, HttpServletRequest req) throws Exception{		
		initHandlerUtil(req);
		int cnt = 0;
		ArrayList<DTO> dtos;
		for(String name : dto.getNames()){
			String value = (String)getVar(name);
			if(value!=null && value!="")
				dto.setValue(name, value);
		}
		dtos = dao.myCheck(dto);
		if(dtos.size() == 1) {
			cnt = dao.myDelete(dto);
			model.addAttribute("cnt", cnt);
		} else {
			model.addAttribute("cnt", cnt);
		}
		return cnt;
	}
	
	@Override
	public int admin_circle_updatePro(Model model,DTO dto, HttpServletRequest req) throws Exception{		
		initHandlerUtil(req);
		int cnt = 0;
		for(String name : dto.getNames()){
			String value = (String)getVar(name);
			if(value!=null && value!="")
				dto.setValue(name, value);	
		}
		cnt = dao.myUpdate(dto);
		return cnt;
	}
	
	@Override
	public int admin_board_form(Model model,DTO dto, HttpServletRequest req) throws Exception{		
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
	
	@Override
	public int admin_member_addPro(Model model, DTO dto, HttpServletRequest req) throws Exception {
		initHandlerUtil(req);
		int cnt;
		String num = "!CIRCLE_REQUEST_seq.nextval";
		dto.setValue("num", num);
		for(String name : dto.getNames()){
			String value = (String)getVar(name);
			if(value!=null && value!="")
				dto.setValue(name, value);	
		}
		cnt = dao.myInsert(dto);
		model.addAttribute("cnt", cnt);
		return cnt;
	}
	
	@Override
	public int admin_member_deletePro(Model model,DTO dto, HttpServletRequest req) throws Exception{		
		initHandlerUtil(req);
		int cnt = 0;
		ArrayList<DTO> dtos;
		for(String name : dto.getNames()){
			String value = (String)getVar(name);
			if(value!=null && value!="")
				dto.setValue(name, value);
		}
		dtos = dao.myCheck(dto);
		if(dtos.size() == 1) {
			cnt = dao.myDelete(dto);
			model.addAttribute("cnt", cnt);
		} else {
			model.addAttribute("cnt", cnt);
		}
		return cnt;
	}
	
	@Override
	public int admin_member_updatePro(Model model,DTO dto, HttpServletRequest req) throws Exception{		
		initHandlerUtil(req);
		int cnt = 0;
		for(String name : dto.getNames()){
			String value = (String)getVar(name);
			if(value!=null && value!="")
				dto.setValue(name, value);	
		}
		cnt = dao.myUpdate(dto);
		return cnt;
	}
	
	@Override
	public int admin_qboard_form(Model model,DTO dto, HttpServletRequest req) throws Exception{		
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
	
	@Override
	public int admin_qboard_addPro(Model model, DTO dto, HttpServletRequest req) throws Exception {
		initHandlerUtil(req);
		int cnt;
		String num = "!CIRCLE_QBOARD_SEQ.nextval";
		dto.setValue("num", num);
		for(String name : dto.getNames()){
			String value = (String)getVar(name);
			if(value!=null && value!="")
				dto.setValue(name, value);	
		}
		cnt = dao.myInsert(dto);
		model.addAttribute("cnt", cnt);
		return cnt;
	}
	
	@Override
	public int admin_qboard_deletePro(Model model,DTO dto, HttpServletRequest req) throws Exception{		
		initHandlerUtil(req);
		int cnt = 0;
		ArrayList<DTO> dtos;
		for(String name : dto.getNames()){
			String value = (String)getVar(name);
			if(value!=null && value!="")
				dto.setValue(name, value);
		}
		dtos = dao.myCheck(dto);
		if(dtos.size() == 1) {
			cnt = dao.myDelete(dto);
			model.addAttribute("cnt", cnt);
		} else {
			model.addAttribute("cnt", cnt);
		}
		return cnt;
	}
	
	@Override
	public int admin_qboard_updatePro(Model model,DTO dto, HttpServletRequest req) throws Exception{		
		initHandlerUtil(req);
		int cnt = 0;
		for(String name : dto.getNames()){
			String value = (String)getVar(name);
			if(value!=null && value!="")
				dto.setValue(name, value);	
		}
		cnt = dao.myUpdate(dto);
		return cnt;
	}
	
	@Override
	public int admin_request_form(Model model,DTO dto, HttpServletRequest req) throws Exception{		
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
	
	@Override
	public int admin_request_addPro(Model model, DTO dto, HttpServletRequest req) throws Exception {
		initHandlerUtil(req);
		int cnt;
		String num = "!CIRCLE_REQUEST_seq.nextval";
		dto.setValue("num", num);
		for(String name : dto.getNames()){
			String value = (String)getVar(name);
			if(value!=null && value!="")
				dto.setValue(name, value);	
		}
		cnt = dao.myInsert(dto);
		model.addAttribute("cnt", cnt);
		return cnt;
	}
	
	@Override
	public int admin_request_deletePro(Model model,DTO dto, HttpServletRequest req) throws Exception{		
		initHandlerUtil(req);
		int cnt = 0;
		ArrayList<DTO> dtos;
		for(String name : dto.getNames()){
			String value = (String)getVar(name);
			if(value!=null && value!="")
				dto.setValue(name, value);
		}
		dtos = dao.myCheck(dto);
		if(dtos.size() == 1) {
			cnt = dao.myDelete(dto);
			model.addAttribute("cnt", cnt);
		} else {
			model.addAttribute("cnt", cnt);
		}
		return cnt;
	}
	
	@Override
	public int admin_request_updatePro(Model model,DTO dto, HttpServletRequest req) throws Exception{		
		initHandlerUtil(req);
		int cnt = 0;
		for(String name : dto.getNames()){
			String value = (String)getVar(name);
			if(value!=null && value!="")
				dto.setValue(name, value);	
		}
		cnt = dao.myUpdate(dto);
		return cnt;
	}
	
}
