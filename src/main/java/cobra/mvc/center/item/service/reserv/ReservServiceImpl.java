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
	
	//����ó��
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
		
		int reservCount = dao.countReserv(id);	//���� ����Ȯ��
		String cancel = req.getParameter("cancel"); //���
		int reservCheck = dao.preReserv(daomap); //�ߺ�Ȯ��
		
		int cnt = 0;
		
		if(cancel != null) {
			//�������
			dao.reservCancel(daomap);
			cnt = -2;
			
		} else {
			if(reservCheck != 0) { //�ߺ�����
				cnt = -4;
			} else {
				//���� �ִ�ġ Ȯ��
				if(reservCount < 3) {
					//����ó��
					cnt = dao.reservation(daomap);
				} else {
					//���� �ִ�� ���� ����
					cnt = -3;
				}
			}
		}
		
		model.addAttribute("book_id", book_id);
		model.addAttribute("id", id);
		model.addAttribute("cnt", cnt);
	}

	//�����ϰ�������
	@Override
	public void reservList(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		int reservCount = 0;			//������ ��������
		//�� �޾ƿ���
		String id = (String) req.getSession().getAttribute("id");
		
		//�α��� üũ
		if(id != null) {
			reservCount = dao.countReserv(id);
		} else {
			reservCount = -1;
		}
		
		ArrayList<ReservDTO> dtos = new ArrayList<ReservDTO>();

		if(reservCount > 0) {
			
			dtos = dao.reservList(id); //��ϵ� ���� ��ȸ
			model.addAttribute("dtos", dtos);
		} 
		
		model.addAttribute("id", id);
		model.addAttribute("reservCount", reservCount);
		model.addAttribute("dtos", dtos);
		
	}

}
