package cobra.mvc.center.item.service.book;

import org.springframework.ui.Model;

public interface BookService {

	public void insertBookPro(Model model) throws Exception; //도서등록처리

	public void bookList(Model model) throws Exception; //도서목록
	
	public void bookDetail(Model model) throws Exception; //도서상세정보
	
	public void updateform(Model model) throws Exception; //도서정보수정 폼

	public void updatePro(Model model) throws Exception; //도서수정 처리
	
	public void deletePro(Model model) throws Exception; //도서삭제 처리
	
}
