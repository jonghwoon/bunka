package cobra.mvc.center.item.service.book;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import cobra.mvc.center.item.domain.BookDTO;
import cobra.mvc.center.item.persistence.book.BookDAO;
import cobra.mvc.center.item.persistence.item.RandomNumberGenerator;
import cobra.mvc.center.item.persistence.rend.RendDAO;
import cobra.mvc.center.item.persistence.reserv.ReservDAO;

@Service
public class BookServiceImpl implements BookService {

	@Inject
	BookDAO dao;
	
	@Inject
	RendDAO rdao;
	
	@Inject
	ReservDAO redao;
	
	//��������ϱ�
	@Override
	public void insertBookPro(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		//�ٱ��� ����
		BookDTO dto = new BookDTO();
		
		//�Է��� ���� ���
		String library = null;
		if(req.getParameter("library").equals("1")){
			library = "A";
			System.out.println(library);
		} else if(req.getParameter("library").equals("2")) {
			library = "B";
			System.out.println(library);
		} else if(req.getParameter("library").equals("3")) {
			library = "C";
			System.out.println(library);
		}
		
		dto.setBook_id(library);
		dto.setBook_library(req.getParameter("library"));
		dto.setBook_value(1);
		dto.setBook_isbn(req.getParameter("isbn"));
		dto.setBook_title(req.getParameter("title"));
		dto.setBook_origin(req.getParameter("origin"));
		dto.setBook_author(req.getParameter("author"));
		dto.setBook_trans(req.getParameter("trans"));
		dto.setBook_publisher(req.getParameter("publisher"));
		dto.setBook_keyword(req.getParameter("keyword"));
		dto.setBook_publishdate(Date.valueOf(req.getParameter("publishDate")));
		dto.setBook_incomedate(Date.valueOf(req.getParameter("incomedate")));
		dto.setBook_index(req.getParameter("index"));
		dto.setBook_origin(req.getParameter("origin"));
		dto.setBook_categorybig(req.getParameter("selectbasic"));
		dto.setBook_categorymid(req.getParameter("selectsub"));
		int rn = RandomNumberGenerator.randomNumber(2);
		String book_img = "book_" + rn + ".jpg";
		dto.setBook_img(book_img);
		dto.setBook_img_path(req.getParameter("book_img_path"));
		
		System.out.println(dto.toString());
		
		int val = 0;
		int cnt = 0;
		val = Integer.parseInt(req.getParameter("value"));
		
		for(int i = 0; i < val; i++) {
			cnt += dao.insertbook(dto);
		}
		
		//setAttribute
		model.addAttribute("cnt", cnt);
		
	}

	//������ϰ˻�
	@Override
	public void bookList(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		int pageSize = 5;		//���������� ����� �� ����
		int pageBlock = 5;		//����� ������ ����
		
		int cnt = 0;			//��������
		int start = 0;			//���� ������ ���۹�ȣ : rownum
		int end = 0;			//���� ������ ����ȣ
		int number = 0;			//����� �� ��ȣ
		String pageNum = null;	//������ ��ȣ
		int currentPage = 0;	//���� ������
		
		int pageCount = 0;		//������ ����
		int startPage = 0;		//���� ������
		int endPage = 0;		//������ ������
		
		//��������
		cnt = dao.getBookCount();
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";	//���� ���� �� ù�������� 1�������� ����
		}
		
		currentPage = (Integer.parseInt(pageNum)); //���������� ����
		
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); //������ ���� (�۰���/ �������� ǥ���� ����) + (�۰��� / ������ ǥ���� �������� �������� ������ +1 ������ +0);
		
		start = (currentPage - 1) * pageSize + 1;	//���������� ���۹�ȣ 
		end = start + pageSize - 1;					//���������� ����ȣ
		
		if(end > cnt) end = cnt;					//����ȣ�� ���� �� �������� ũ�� cnt�� ���� 
		
		//����� ������ȣ
		number = cnt - (currentPage - 1) * pageSize;
		ArrayList<BookDTO> dtos = new ArrayList<BookDTO>();
		Map<String, Object> daoMap = new HashMap<String, Object>();
		if(cnt > 0) {
			daoMap.put("start", start);
			daoMap.put("end", end);
			
			dtos = dao.getBooks(daoMap); //��ϵ� ���� ��ȸ
			model.addAttribute("dtos", dtos);
		}
		
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage = pageCount;
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("number", number);
		model.addAttribute("pageNum", pageNum);
		
		if(cnt > 0) {
			model.addAttribute("cnt", cnt);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageBlock", pageBlock);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("currentPage", currentPage);
		}
		
	}

	//����������
	@Override
	public void bookDetail(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		//�α��� Ȯ��
		String id = (String) req.getSession().getAttribute("id");
		
		String book_id = req.getParameter("book_id");
		int pageNum = 0;
		int number = 0;
		
		if(req.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(req.getParameter("pageNum"));
		}
		
		if(req.getParameter("number") != null) {
			number = Integer.parseInt(req.getParameter("number"));
		}
					
		//�� ������ ��������
		BookDTO dto = dao.getBook(book_id);
		
		model.addAttribute("id", id);
		model.addAttribute("dto", dto);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("number", number);
		
	}
	
	//���� ������
	@Override
	public void updateform(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		//�α��� Ȯ��
		String id = (String) req.getSession().getAttribute("id");
		
		String book_id = req.getParameter("book_id");
		
		//�� ���� ��������
		BookDTO dto = dao.getBook(book_id);
		
		model.addAttribute("id", id);
		model.addAttribute("dto", dto);
	}

	//���� ���� ó��
	@Override
	public void updatePro(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		//�ٱ��� ����
		BookDTO dto = new BookDTO();
		
		dto.setBook_id(req.getParameter("book_id"));
		dto.setBook_isbn(req.getParameter("isbn"));
		dto.setBook_title(req.getParameter("title"));
		dto.setBook_origin(req.getParameter("origin"));
		dto.setBook_author(req.getParameter("author"));
		dto.setBook_trans(req.getParameter("trans"));
		dto.setBook_publisher(req.getParameter("publisher"));
		dto.setBook_keyword(req.getParameter("keyword"));
		dto.setBook_publishdate(Date.valueOf(req.getParameter("publishDate")));
		dto.setBook_incomedate(Date.valueOf(req.getParameter("incomedate")));
		dto.setBook_index(req.getParameter("index"));
		dto.setBook_origin(req.getParameter("origin"));
		dto.setBook_categorybig(req.getParameter("selectbasic"));
		dto.setBook_categorymid(req.getParameter("selectsub"));
		dto.setBook_img(req.getParameter("book_img"));
		dto.setBook_img_path(req.getParameter("book_img_path"));
		
		int cnt = dao.updateBook(dto);
		
		//setAttribute
		model.addAttribute("cnt", cnt);
		
	}

	//���� ����ó��
	@Override
	public void deletePro(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		String book_id = req.getParameter("book_id");
		
		int cnt = 0;
		int rendState = rdao.checkRentState(book_id);
		if(rendState != 0) {
			cnt = -2;
		} else {
			cnt = redao.delReserv(book_id); //���� ����
			cnt += dao.deleteBook(book_id);	//���� ����
		}
		
		model.addAttribute("cnt", cnt);
	}

}
