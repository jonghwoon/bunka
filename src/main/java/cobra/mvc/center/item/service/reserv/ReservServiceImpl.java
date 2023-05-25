package cobra.mvc.center.item.service.reserv;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import cobra.mvc.center.item.domain.ReservDTO;
import cobra.mvc.center.item.persistence.reserv.ReservDAO;

@Service
public class ReservServiceImpl implements ReservService{
	
	@Inject
	ReservDAO dao;
	
	//예약처리
	@Override
	public void reservBookPro(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		Map<String, Object> daomap = new HashMap<String,Object>();
		
		String id = (String) req.getSession().getAttribute("id");
		String book_id = req.getParameter("book_id");
		
		daomap.put("id", id);
		daomap.put("book_id", book_id);
		
		ReservDTO dto = dao.checkReserv(book_id);
		
		int reserv_number = dto.getReserv_number();
		int reserv_count = dto.getReserv_count();
		
		daomap.put("reserv_number", reserv_number);
		daomap.put("reserv_count", reserv_count);
		
		int reservCount = dao.countReserv(id);	//예약 숫자확인
		String cancel = req.getParameter("cancel"); //취소
		int reservCheck = dao.preReserv(daomap); //중복확인
		
		int cnt = 0;
		
		if(cancel != null) {
			//예약취소
			dao.reservCancel(daomap);
			cnt = -2;
			
		} else {
			if(reservCheck != 0) { //중복예약
				cnt = -4;
			} else {
				//예약 최대치 확인
				if(reservCount < 3) {
					//예약처리
					cnt = dao.reservation(daomap);
				} else {
					//예약 최대로 인해 실패
					cnt = -3;
				}
			}
		}
		
		model.addAttribute("book_id", book_id);
		model.addAttribute("id", id);
		model.addAttribute("cnt", cnt);
	}

	//예약목록가져오기
	@Override
	public void reservList(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		int reservCount = 0;			//예약한 도서갯수
		//값 받아오기
		String id = (String) req.getSession().getAttribute("id");
		
		//로그인 체크
		if(id != null) {
			reservCount = dao.countReserv(id);
		} else {
			reservCount = -1;
		}
		
		ArrayList<ReservDTO> dtos = new ArrayList<ReservDTO>();

		if(reservCount > 0) {
			
			dtos = dao.reservList(id); //등록된 도서 조회
			model.addAttribute("dtos", dtos);
		} 
		
		model.addAttribute("id", id);
		model.addAttribute("reservCount", reservCount);
		model.addAttribute("dtos", dtos);
		
	}

}
