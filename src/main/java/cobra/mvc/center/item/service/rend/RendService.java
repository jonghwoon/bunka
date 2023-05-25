package cobra.mvc.center.item.service.rend;

import org.springframework.ui.Model;

public interface RendService {

	public void rendBook(Model model) throws Exception; //도서 대여
	
	public void regUser(Model model) throws Exception; //유저등록
	
	public void rendBookPro(Model model) throws Exception; //도서대여처리
	
	public void rendList(Model model) throws Exception; //대여리스트
	
	public void rendDetail(Model model) throws Exception; //대여 상세
	
	public void returnBookPro(Model model) throws Exception; //반납처리
}
