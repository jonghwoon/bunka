package cobra.mvc.center.item.persistence.book;

import java.util.ArrayList;
import java.util.Map;

import cobra.mvc.center.item.domain.BookDTO;

public interface BookDAO {

	public int insertbook(BookDTO dto);	//�������
	
	public int getBookCount();			//���� ����
	
	public ArrayList<BookDTO> getBooks(Map<String, Object> daoMap);	//��ϵ� �������
	
	public ArrayList<BookDTO> getCategory(Map<String, Object> daoMap); //�����з�
	
	public BookDTO getBook(String book_id); //���� ������
	
	public int updateBook(BookDTO dto); //���� ��������ó��
	
	public int deleteBook(String book_id);	//���� ����
}
