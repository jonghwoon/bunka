package cobra.mvc.center.item.persistence.rend;

import java.util.ArrayList;
import java.util.Map;

import cobra.mvc.center.item.domain.BookDTO;
import cobra.mvc.center.item.domain.MemberDTO;
import cobra.mvc.center.item.domain.RendDTO;

public interface RendDAO {

	public int checkRentState(String book_id); //���� ������� Ȯ��
	
	public String checkUserReg(String id);	//ȸ�� ��� ���� Ȯ��
	
	public MemberDTO checkPenalty(String id); //ȸ���� �������� Ȯ��
	
	public int rendBook(Map<String, Object> daoMap);	//���� �����ϱ�
	
	public BookDTO getDetail(String book_id);	//���� ��������������
	
	public int register(String id);	//���� ���
	
	public int delPenalty(String id); //�̿����� ����
	
	public int setPenalty(String id); //�̿����� �߰�
	
	public int getRendCount(String id); //��������
	
	public ArrayList<RendDTO> getRendList(String id); //�뿩�� �������
	
	public RendDTO getRendDetail(String book_id); //�뿩���� ��
	
	public int returnBook(String book_id); //���� �ݳ�
	
	public int getRend_key(String book_id);	//�뿩Ű Ȯ��
	
}
