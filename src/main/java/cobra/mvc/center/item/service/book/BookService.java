package cobra.mvc.center.item.service.book;

import org.springframework.ui.Model;

public interface BookService {

	public void insertBookPro(Model model) throws Exception; //�������ó��

	public void bookList(Model model) throws Exception; //�������
	
	public void bookDetail(Model model) throws Exception; //����������
	
	public void updateform(Model model) throws Exception; //������������ ��

	public void updatePro(Model model) throws Exception; //�������� ó��
	
	public void deletePro(Model model) throws Exception; //�������� ó��
	
}
