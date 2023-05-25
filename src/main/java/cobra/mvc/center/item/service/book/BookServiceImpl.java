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
	
	//도서등록하기
	@Override
	public void insertBookPro(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		//바구니 생성
		BookDTO dto = new BookDTO();
		
		//입력한 내용 담기
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

	//도서목록검색
	@Override
	public void bookList(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		int pageSize = 5;		//한페이지에 출력할 글 갯수
		int pageBlock = 5;		//출력할 페이지 갯수
		
		int cnt = 0;			//도서갯수
		int start = 0;			//현재 페이지 시작번호 : rownum
		int end = 0;			//현재 페이지 끝번호
		int number = 0;			//출력할 글 번호
		String pageNum = null;	//페이지 번호
		int currentPage = 0;	//현재 페이지
		
		int pageCount = 0;		//페이지 갯수
		int startPage = 0;		//시작 페이지
		int endPage = 0;		//마지막 페이지
		
		//도서갯수
		cnt = dao.getBookCount();
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";	//값이 없을 때 첫페이지는 1페이지로 설정
		}
		
		currentPage = (Integer.parseInt(pageNum)); //현재페이지 설정
		
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); //페이지 갯수 (글갯수/ 페이지에 표시할 갯수) + (글갯수 / 페이지 표시할 갯수에서 나머지가 있으면 +1 없으면 +0);
		
		start = (currentPage - 1) * pageSize + 1;	//현재페이지 시작번호 
		end = start + pageSize - 1;					//현재페이지 끝번호
		
		if(end > cnt) end = cnt;					//끝번호가 남은 글 갯수보다 크면 cnt로 적용 
		
		//출력할 도서번호
		number = cnt - (currentPage - 1) * pageSize;
		ArrayList<BookDTO> dtos = new ArrayList<BookDTO>();
		Map<String, Object> daoMap = new HashMap<String, Object>();
		if(cnt > 0) {
			daoMap.put("start", start);
			daoMap.put("end", end);
			
			dtos = dao.getBooks(daoMap); //등록된 도서 조회
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

	//도서상세정보
	@Override
	public void bookDetail(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		//로그인 확인
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
					
		//상세 페이지 가져오기
		BookDTO dto = dao.getBook(book_id);
		
		model.addAttribute("id", id);
		model.addAttribute("dto", dto);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("number", number);
		
	}
	
	//도서 수정폼
	@Override
	public void updateform(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		//로그인 확인
		String id = (String) req.getSession().getAttribute("id");
		
		String book_id = req.getParameter("book_id");
		
		//상세 내용 가져오기
		BookDTO dto = dao.getBook(book_id);
		
		model.addAttribute("id", id);
		model.addAttribute("dto", dto);
	}

	//도서 수정 처리
	@Override
	public void updatePro(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		//바구니 생성
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

	//도서 삭제처리
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
			cnt = redao.delReserv(book_id); //예약 삭제
			cnt += dao.deleteBook(book_id);	//도서 삭제
		}
		
		model.addAttribute("cnt", cnt);
	}

}
