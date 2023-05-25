package cobra.mvc.center.item.persistence.reserv;

import java.util.ArrayList;
import java.util.Map;

import cobra.mvc.center.item.domain.ReservDTO;

public interface ReservDAO {

	public int getReserv_key(String book_id);	//����Ű ��������
	
	public ReservDTO checkReserv(String book_id);	//������� ��������
	
	public int checkReservState(String id); //���� �������� Ȯ���ϱ�
	
	public int countReserv(String id); //���� �� Ȯ�� 3��������
	
	public int reservation(Map<String, Object> daomap); //����ó��
	
	public ArrayList<ReservDTO> reservList(String id); //���� ��� ��������
	
	public int reservCancel(Map<String, Object> daomap); //�������
	
	public int delReserv(String book_id);	//���� ���� �� ���� ����
	
	public int preReserv(Map<String, Object> daomap); //���� �ߺ�Ȯ��
	
	public String checkQueue(Map<String, Object> daomap);	//������� Ȯ��
	
	public void updateQueue(String book_id);	//������� ���
	
	public void delQueue(String book_id);	//���� ���� 0���� �����ϱ�
}
