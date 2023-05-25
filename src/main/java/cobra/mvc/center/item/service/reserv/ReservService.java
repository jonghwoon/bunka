package cobra.mvc.center.item.service.reserv;

import org.springframework.ui.Model;

public interface ReservService {

	public void reservBookPro(Model model) throws Exception; //도서예약처리
	
	public void reservList(Model model) throws Exception; //예약목록 불러오기
	
}
