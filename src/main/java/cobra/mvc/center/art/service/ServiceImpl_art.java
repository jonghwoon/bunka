package cobra.mvc.center.art.service;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;


import cobra.mvc.center.common.domain.DTO;
import cobra.mvc.center.common.persistence.DAOImpl;
import cobra.mvc.center.common.service.HandlerUtil;
import cobra.mvc.center.art.domain.ShowDTO;
import cobra.mvc.center.art.domain.ShowMemberResDTO;
import cobra.mvc.center.art.domain.ShowResDTO;
import cobra.mvc.center.art.persistence.DAO_art_Impl;

@Service
public class ServiceImpl_art extends HandlerUtil implements Service_art{

	@Inject		DAOImpl dao;	
	@Inject		DAO_art_Impl dao_art;
	
	@Override	// 공연 조회하기
	public int showFind(DTO dto, HttpServletRequest req) {
		// 로그 =====================================================
		System.out.println("  ▶ showFind in  : " );		
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
		dtos = dao_art.showFind(dto);
		
		// 디버그 ===================================================
			//for(DTO d:dtos) d.getInfo();
		
		// 변수 담기 ================================================
		
	
		// 반환 =====================================================
		
		if(dtos.size()!=0) {
			setVar("dtos", dtos);
			cnt = dtos.size();
			dto = cnt==1 ? dtos.get(0) : dto;
		}
		
		setVar("dto",dto);
		
		d("  ▷ showFind out :  / cnt : " + cnt);
		return cnt;
				
	}
	
	@Override	//날짜 조회하기
	public int showSeatView(DTO dto, HttpServletRequest req) {
		// 로그 =====================================================
			System.out.println("  ▶ showSeatView in  : " );		
		
		// 공연번호와 날짜를 가져온다.
			// 초기화 ===================================================
			initHandlerUtil(req);
			
			for(String name : dto.getNames()){
				Object value = getVar(name);
				if(value!=null && value!="")
					dto.set(name, value);	
			}
			
			ArrayList<DTO> dtos = new ArrayList<DTO>();			
			int cnt=0;

			// res_date 와 show_num 를 디버그한다.
				d("res_date " + dto.get("res_date"));
				d("show_num " + dto.get("show_num"));
				d("res_date " + req.getParameter("res_date"));
				d("show_num " + req.getParameter("show_num"));
				
		// 해당 날짜의 예약 상태가 있는지 조회
			cnt = dao.myCheck(dto).size();
						
		// 없다면 좌석 정보를 가져와 생성
			if(cnt==0){
				// 공연 번호로 좌석정보 조회
				DTO dtoT = new ShowDTO();			
				dtoT.setValue("show_num",dto.getValue("show_num"));
				dtos = dao.myCheck(dtoT);
				
				// 받아온 좌석정보 dto에 담는다.  
				if(dtos!=null && dtos.size()==1)
					dto.setValue("seat",dtos.get(0).getValue("seat"));
				
				// 좌석 예약 정보를 생성한다. 
					// 예약정보 키값이++ 되어야 하는데.. 음...				
				cnt = dao.myInsert(dto);
			}
			
		// 가져온다.			
			dtos = dao.myCheck(dto);
			
		// 리턴한다.
			if(dtos.size()!=0) {
				setVar("dtos", dtos);
				cnt = dtos.size();
				dto = cnt==1 ? dtos.get(0) : dto;
			}			
			setVar("dto",dto);
			
			
			d("  ▷ showSeatView :  / cnt : " + cnt);
			return cnt;
	}
	
	@Override	// 예약 취소하기
	public int showResBack(DTO dto, HttpServletRequest req) {	//미완성
		// 로그 =====================================================
		System.out.println("  ▶ showResBack in  : " );		
			
	// 변수를 받아온다. // 받은것은 showResDTO
		// 초기화 ===================================================
		initHandlerUtil(req);
		
		for(String name : dto.getNames()){
			Object value = getVar(name);
			if(value!=null && value!="")
				dto.set(name, value);	
		}
		
		ArrayList<DTO> dtos = new ArrayList<DTO>();			
		int cnt=0;
		
		// 들어오는 변수 목록 // 거의다 memberResDTO 의 요건
			//id
			//show_num
			//res_date
			//seat
			//seat_code
				
		// 예약 좌석 현황을 받아온다. 
			// 전시 번호와 날짜를 불러와 담는다.
			DTO resDto = new ShowResDTO();
			resDto.setValue("show_num", dto.getValue("show_num"));
			resDto.setValue("res_date", dto.getValue("res_date"));
			dtos = dao.myCheck(resDto);
			
			// 에러 1101 : 이전 예약 현황을 불러올 수 없다면 리턴.   
			if(dtos==null || dtos.size()!=1)
				return 1101;
			
			String show_seat	= dtos.get(0).getValue("seat");	// 예약된 현황
			String now_seat	= (String)getVar("seat");		// 예약한 
		
		// 예약 좌석 중 '2'를 '1'로 바꿔서 업로드한다. 
			//now_seat 중 '2' 인 자리를 찾아 show_seat 에서 1로 바꾼다.
			
			int i=0;
			char[] show_seat_chars = show_seat.toCharArray();
			for(char s : now_seat.toCharArray()){
				if(s=='2')
					// 에러 1102 : 예약 상황 불일치
					if(show_seat.toCharArray()[i]!='3')
						return 1102; 
					else
						show_seat_chars[i]='1';	
				i++;
			}
			
		// 예약 좌석 현황을 바꾼다.			
			show_seat = String.valueOf(show_seat_chars);
			resDto.setValue("seat",show_seat);
			cnt = dao.myUpdate(resDto);
			
			// 에러 1103 : 좌석 업데이트 실패
			if(cnt!=1)	return 1103;
			
		// 멤버 예약정보에서 삭제한다.			
			cnt = dao.myDelete(dto);	
			
			// 에러 1104 : 멤버 정보 삭제 실패
			if(cnt!=1)	return 1104;
			
			d("cnt"+cnt);

		// 로그 =====================================================
		System.out.println("  ▷ showResBack in  : " );
		
		// 리턴 =====================================================
		return cnt;
	}
	
	@Override	// 예약하기
	public int showResPro(DTO dto, HttpServletRequest req) {
		// 로그 =====================================================
			System.out.println("  ▶ showResPro in  : " );		
				
		// 변수를 받아온다. // 받은것은 showResDTO
			// 초기화 ===================================================
			initHandlerUtil(req);
			
			for(String name : dto.getNames()){
				Object value = getVar(name);
				if(value!=null && value!="")
					dto.set(name, value);	
			}
			
			ArrayList<DTO> dtos = new ArrayList<DTO>();			
			int cnt=0;
			
			// 들어오는 변수 목록 // 거의다 memberResDTO 의 요건
				//id
				//show_num
				//res_date
				//seat
				//seat_code 
			
			
		// 좌석 현황을 비교한다.
			// 전시 번호와 날짜를 불러와 담는다.
			DTO resDto = dto.getNew();
			resDto.setValue("show_num", dto.getValue("show_num"));
			resDto.setValue("res_date", dto.getValue("res_date"));
			dtos = dao.myCheck(resDto);
			
			// 에러 1001 : 이전 예약 현황을 불러올 수 없다면 리턴.   
			if(dtos==null || dtos.size()!=1)
				return 1001;
			
			String show_seat = dtos.get(0).getValue("seat");
			String now_seat = (String)getVar("seat");
			
			
			// 에러 1002 : 두 좌석의 길이가 다르다면 리턴.
			if(show_seat.length()!=now_seat.length())
				return 1002;
			
			// 에러 1003 : 두 좌석의 예약 상태가 다르다면 리턴
			// 0좌석X , 1빈 , 2선택, 3예약
				// 예약을 신청한 자료와 비교한다. = 상태가 2인 곳의 인덱스가 모두 1이어야한다.
			int i=0;
			char[] show_seat_chars = show_seat.toCharArray();
			for(char s : now_seat.toCharArray()){
				if(s=='2')
					if(show_seat.toCharArray()[i]!='1')
						return 1003;
					else
						show_seat_chars[i]='3';
				i++;
			}
 			
		// 기존 좌석 업데이트
			show_seat = String.valueOf(show_seat_chars);
			
			//debug 
			d("show_seat : " + show_seat);
			d("now_seat : "  + now_seat);
			
		//변경된 좌석을 담고
		resDto.setValue("seat", show_seat);
			
		// 예약 상황 업데이트 
			// => 예약 상황 업데이트는 문서의 맨 마지막에 업데이트 한다. 
		
		
		// 회원의 예약 기록을 넣어준다.
			// 회원 예약 DTO에 데이터를 넣는다. 
			DTO memberDto = new ShowMemberResDTO();
						
			String[] names = {"id","show_num","res_date"};
				// 조회에 필요한 것들만 넣는다.
			for(String name : names){
				Object value = getVar(name);
				if(value!=null && value!="")
					memberDto.set(name, value);
			}
						
			// 회원의 예약 기록을 찾는다.
			cnt = dao.myCheck(memberDto).size();
			
			// 에러 1004 : 예약 기록이 중복 존재할 경우 리턴 - 이미 예약이 있습니다. 해당 일의 예약을 취소후 이용해주세요.
				// 예약 상황 업데이트를 그래서 뒤로 빼야 한다. 
			if(cnt==1)
				return 1004;
			
			// 업데이트 내용 추가 후 회원 예약 기록을 추가한다.
				memberDto.set("seat", getVar("seat"));
				memberDto.set("seat_code", getVar("seat_code"));				
			cnt = dao.myInsert(memberDto);
			
			// 에러 1005 : 멤버 예약정보가 추가되지 않으면 리턴
			if(cnt==0)
				return 1005;
			
		// 예약 상황 업데이트 	
			cnt = dao.myUpdate(resDto);
			// 에러 1006 : 예약 상황 업데이트 되지 않는다면 리턴  
			if(cnt==0)
				return 1006;
			
		// 상황을 리턴한다.
			
		return cnt;
	}
	
}	