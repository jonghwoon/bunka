package cobra.mvc.center.item.service.rend;

import org.springframework.ui.Model;

public interface RendService {

	public void rendBook(Model model) throws Exception; //���� �뿩
	
	public void regUser(Model model) throws Exception; //�������
	
	public void rendBookPro(Model model) throws Exception; //�����뿩ó��
	
	public void rendList(Model model) throws Exception; //�뿩����Ʈ
	
	public void rendDetail(Model model) throws Exception; //�뿩 ��
	
	public void returnBookPro(Model model) throws Exception; //�ݳ�ó��
}
