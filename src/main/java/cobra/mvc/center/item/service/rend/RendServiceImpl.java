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
	
	//�����뿩â
	@Override
	public void rendBook(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		//�α��� Ȯ��
		String id = (String) req.getSession().getAttribute("id");
		
		String book_id = req.getParameter("book_id");
		int pageNum = 0;
		int number = 0;
		
		//����Ȯ��
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
		
		//�� ������ ��������
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

	//�������
	@Override
	public void regUser(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		//�� �޾ƿ���
		String id = (String) req.getSession().getAttribute("id");
		
		int cnt = dao.register(id);
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("id", id);
	}

	//���� �뿩 ó��
	@Override
	public void rendBookPro(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		Map<String, Object> daoMap = new HashMap<String, Object>();
		
		//�뿩 ���� Ȯ��
		int cnt = 0;
		//�� �޾ƿ���
		String id = (String) req.getSession().getAttribute("id");
		String book_id = req.getParameter("book_id");
		int rend_key = Integer.parseInt(req.getParameter("rend_key"));
		
		daoMap.put("rend_key", rend_key);
		daoMap.put("id", id);
		daoMap.put("book_id", book_id);
		//�뿩���� üũ
		MemberDTO penalty = dao.checkPenalty(id); //�������ѱⰣ
		int maxbook = dao.getRendCount(id);		  //�ִ�뿩����
		
		
		if(maxbook >= 3) { //3�� �̻��̸� �߰� ���� �Ұ�
			cnt = -3;
			
		} else if(maxbook < 3) { //3�� �̸��� ��� ���� ����
			int queue = 999999;
			String queueCheck = rdao.checkQueue(daoMap); //�������
			int checkState = rdao.checkReservState(book_id);//���൵������ Ȯ��
			
			if(queueCheck != null) {
				queue = Integer.parseInt(rdao.checkQueue(daoMap)); //������� �Է�
			} 
			
			if(queue > 1 && checkState > 0) { //������ �ְ� ���� ������ 1���� �ƴϸ�
				//�뿩 �켱������ ����
				cnt = -4;
			} else {
				if(penalty.getUser_penalty() < 0) { //�뿩������ �ִ��� Ȯ��
					//�뿩���� ��¥
					Date start = penalty.getUser_penaltydate();
					
					LocalDate check1 = start.toLocalDate(); //�뿩���� ��¥
					LocalDate end = LocalDate.now();		//���ó�¥
					
					//���ó�¥ - �뿩���� ��¥
					Period checknow = Period.between(check1, end);
					int check = checknow.getDays();
					
					if(check > 0) { //�뿩���� ��¥�� �������� �뿩����
						cnt = dao.delPenalty(id); //���� ����
						
						rdao.reservCancel(daoMap); //���� ����
						rdao.updateQueue(book_id); //�ٸ� ����� ���� ���� ���
						cnt += dao.rendBook(daoMap); //�뿩ó��
						rdao.delQueue(book_id);     //0���� �������
					} else {
						cnt = -2; //���� �뿩 ���� ��
					}
					
				} else {
					//�뿩ó��
					cnt = dao.rendBook(daoMap);
					rdao.reservCancel(daoMap); //�������
					rdao.updateQueue(book_id); //�ٸ� ����� ���� ���� ���
					rdao.delQueue(book_id);    //0������ ���� ����
				}
			}
			
		}
		
		model.addAttribute("cnt", cnt);
		
	}

	//�뿩�������
	@Override
	public void rendList(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		int rendCount = 0;			//���� ��������
		//�� �޾ƿ���
		String id = (String) req.getSession().getAttribute("id");
		
		//�α��� üũ
		if(id != null) {
			rendCount = dao.getRendCount(id);
		} else {
			rendCount = -1;
		}
		
		ArrayList<RendDTO> dtos = new ArrayList<RendDTO>();

		if(rendCount > 0) {
			
			dtos = dao.getRendList(id); //��ϵ� ���� ��ȸ
			model.addAttribute("dtos", dtos);
			
		} 
		
		model.addAttribute("id", id);
		model.addAttribute("rendCount", rendCount);
		model.addAttribute("dtos", dtos);
		System.out.println("rendCount : " + rendCount);
	}

	//�뿩��
	@Override
	public void rendDetail(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		//�α��� Ȯ��
		String id = (String) req.getSession().getAttribute("id");
		
		String book_id = req.getParameter("book_id");
		
		BookDTO bdto = dao.getDetail(book_id);
		RendDTO rdto = dao.getRendDetail(book_id);
		
		Date end = rdto.getRend_end();		//�뿩����������������
		
		LocalDate last = null;
		if(end != null) {
			last = end.toLocalDate();	//�뿩��������¥
		} else {
			last = LocalDate.now();
		}
		
		LocalDate today = LocalDate.now();		//���ó�¥
		
		//���ó�¥ - �ݳ� ��¥
		Period checknow = Period.between(last, today);
		int check = checknow.getDays();
		
		model.addAttribute("id", id);
		model.addAttribute("bdto", bdto);
		model.addAttribute("rdto", rdto);
		model.addAttribute("check", check);
	}

	//�ݳ�ó��
	@Override
	public void returnBookPro(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		String id = (String) req.getSession().getAttribute("id");
		String book_id = req.getParameter("book_id");
		int check = Integer.parseInt(req.getParameter("check"));
		int cnt = 0;
		
		//�ݳ��� Ȯ��
		if(check > 0) {
			dao.setPenalty(id);	//�̿�����  
			dao.returnBook(book_id); //�ݳ�ó��
			cnt = -2;
		} else {
			cnt = dao.returnBook(book_id); //�ݳ�ó��
		}
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("id", id);
	}

}


