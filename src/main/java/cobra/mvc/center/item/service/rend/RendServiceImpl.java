package cobra.mvc.center.item.service.rend;

import java.sql.Date;
import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import cobra.mvc.center.item.domain.BookDTO;
import cobra.mvc.center.item.domain.MemberDTO;
import cobra.mvc.center.item.domain.RendDTO;
import cobra.mvc.center.item.domain.ReservDTO;
import cobra.mvc.center.item.persistence.rend.RendDAO;
import cobra.mvc.center.item.persistence.reserv.ReservDAO;

@Service
public class RendServiceImpl implements RendService {

	@Inject
	RendDAO dao;
	
	@Inject
	ReservDAO rdao;
	
	//도서대여창
	@Override
	public void rendBook(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		//로그인 확인
		String id = (String) req.getSession().getAttribute("id");
		
		String book_id = req.getParameter("book_id");
		int pageNum = 0;
		int number = 0;
		
		//가입확인
		int user_reg = 0;
		if(id != null) {
			String nullCheck = dao.checkUserReg(id);
			
			if (nullCheck != null) {
				user_reg = Integer.parseInt(dao.checkUserReg(id));
			} else {
				user_reg = -2;
			}
			
		} else {
			user_reg = -1;
		}
		
		//상세 페이지 가져오기
		BookDTO dto = dao.getDetail(book_id);
		ReservDTO rdto = rdao.checkReserv(book_id);
		
		int rend_state = dao.checkRentState(book_id);
		int rend_key = dao.getRend_key(book_id);
		int reserv_key = rdao.getReserv_key(book_id);
		
		dto.setCatbig(req.getParameter("catbig"));
		dto.setCatmid(req.getParameter("catmid"));
		
		model.addAttribute("id", id);
		model.addAttribute("dto", dto);
		model.addAttribute("book_id", book_id);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("number", number);
		model.addAttribute("user_reg", user_reg);
		model.addAttribute("rend_state", rend_state);
		model.addAttribute("rend_key", rend_key);
		model.addAttribute("reserv_key", reserv_key);
		model.addAttribute("rdto", rdto);
		
	}

	//유저등록
	@Override
	public void regUser(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		//값 받아오기
		String id = (String) req.getSession().getAttribute("id");
		
		int cnt = dao.register(id);
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("id", id);
	}

	//도서 대여 처리
	@Override
	public void rendBookPro(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		Map<String, Object> daoMap = new HashMap<String, Object>();
		
		//대여 성공 확인
		int cnt = 0;
		//값 받아오기
		String id = (String) req.getSession().getAttribute("id");
		String book_id = req.getParameter("book_id");
		int rend_key = Integer.parseInt(req.getParameter("rend_key"));
		
		daoMap.put("rend_key", rend_key);
		daoMap.put("id", id);
		daoMap.put("book_id", book_id);
		//대여제한 체크
		MemberDTO penalty = dao.checkPenalty(id); //대출제한기간
		int maxbook = dao.getRendCount(id);		  //최대대여갯수
		
		
		if(maxbook >= 3) { //3권 이상이면 추가 대출 불가
			cnt = -3;
			
		} else if(maxbook < 3) { //3권 미만일 경우 대출 가능
			int queue = 999999;
			String queueCheck = rdao.checkQueue(daoMap); //예약순번
			int checkState = rdao.checkReservState(book_id);//예약도서인지 확인
			
			if(queueCheck != null) {
				queue = Integer.parseInt(rdao.checkQueue(daoMap)); //예약순번 입력
			} 
			
			if(queue > 1 && checkState > 0) { //예약이 있고 예약 순번이 1번이 아니면
				//대여 우선순위가 있음
				cnt = -4;
			} else {
				if(penalty.getUser_penalty() < 0) { //대여제한이 있는지 확인
					//대여제한 날짜
					Date start = penalty.getUser_penaltydate();
					
					LocalDate check1 = start.toLocalDate(); //대여제한 날짜
					LocalDate end = LocalDate.now();		//오늘날짜
					
					//오늘날짜 - 대여제한 날짜
					Period checknow = Period.between(check1, end);
					int check = checknow.getDays();
					
					if(check > 0) { //대여제한 날짜가 지났으면 대여가능
						cnt = dao.delPenalty(id); //제한 삭제
						
						rdao.reservCancel(daoMap); //예약 삭제
						rdao.updateQueue(book_id); //다른 사람들 예약 순위 상승
						cnt += dao.rendBook(daoMap); //대여처리
						rdao.delQueue(book_id);     //0이하 예약삭제
					} else {
						cnt = -2; //도서 대여 제한 중
					}
					
				} else {
					//대여처리
					cnt = dao.rendBook(daoMap);
					rdao.reservCancel(daoMap); //예약삭제
					rdao.updateQueue(book_id); //다른 사람들 예약 순위 상승
					rdao.delQueue(book_id);    //0이하의 예약 삭제
				}
			}
			
		}
		
		model.addAttribute("cnt", cnt);
		
	}

	//대여도서목록
	@Override
	public void rendList(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		int rendCount = 0;			//빌린 도서갯수
		//값 받아오기
		String id = (String) req.getSession().getAttribute("id");
		
		//로그인 체크
		if(id != null) {
			rendCount = dao.getRendCount(id);
		} else {
			rendCount = -1;
		}
		
		ArrayList<RendDTO> dtos = new ArrayList<RendDTO>();

		if(rendCount > 0) {
			
			dtos = dao.getRendList(id); //등록된 도서 조회
			model.addAttribute("dtos", dtos);
			
		} 
		
		model.addAttribute("id", id);
		model.addAttribute("rendCount", rendCount);
		model.addAttribute("dtos", dtos);
		System.out.println("rendCount : " + rendCount);
	}

	//대여상세
	@Override
	public void rendDetail(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		//로그인 확인
		String id = (String) req.getSession().getAttribute("id");
		
		String book_id = req.getParameter("book_id");
		
		BookDTO bdto = dao.getDetail(book_id);
		RendDTO rdto = dao.getRendDetail(book_id);
		
		Date end = rdto.getRend_end();		//대여마지막날가져오기
		
		LocalDate last = null;
		if(end != null) {
			last = end.toLocalDate();	//대여마지막날짜
		} else {
			last = LocalDate.now();
		}
		
		LocalDate today = LocalDate.now();		//오늘날짜
		
		//오늘날짜 - 반납 날짜
		Period checknow = Period.between(last, today);
		int check = checknow.getDays();
		
		model.addAttribute("id", id);
		model.addAttribute("bdto", bdto);
		model.addAttribute("rdto", rdto);
		model.addAttribute("check", check);
	}

	//반납처리
	@Override
	public void returnBookPro(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		String id = (String) req.getSession().getAttribute("id");
		String book_id = req.getParameter("book_id");
		int check = Integer.parseInt(req.getParameter("check"));
		int cnt = 0;
		
		//반납일 확인
		if(check > 0) {
			dao.setPenalty(id);	//이용제한  
			dao.returnBook(book_id); //반납처리
			cnt = -2;
		} else {
			cnt = dao.returnBook(book_id); //반납처리
		}
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("id", id);
	}

}


