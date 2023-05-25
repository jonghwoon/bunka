package cobra.mvc.center.item.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cobra.mvc.center.item.service.book.BookServiceImpl;
import cobra.mvc.center.item.service.rend.RendServiceImpl;
import cobra.mvc.center.item.service.reserv.ReservServiceImpl;


/**
 * Handles requests for the application home page.
 */
@Controller
public class ItemController {

	//���� ���, ����, ���, �󼼳�������
	@Inject				
	BookServiceImpl bookService;
	
	//�뿩 ����
	@Inject
	RendServiceImpl rendService;
	
	//���� ����
	@Inject
	ReservServiceImpl reservService;
	
	//����ȭ��
    @RequestMapping(value = "/main.item")
    public String main(Model model) {

        return "/item/main";
    }
    
    @RequestMapping(value = "/search.item")
    public String search(HttpServletRequest req, Model model) {
    	
    	return "/item/search";
    }
    
    //�󼼰˻� ������
    @RequestMapping(value = "/advSearch.item")
    public String advSearch(HttpServletRequest req, Model model) {
    	System.out.println("/item/advSearch");
    	
    	return "/item/advSearch";
    }
    
    //�Խ���
    @RequestMapping(value = "/bbs.item")
    public String bbs(HttpServletRequest req, Model model) {
    	System.out.println("/item/bbs");
    	
    	return "/item/bbs";
    }
    
    //�������
    @RequestMapping(value = "/bookList.item")
    public String bookList(HttpServletRequest req, Model model) throws Exception {
    	System.out.println("/item/bookList");
    	
    	model.addAttribute("req", req);
    	bookService.bookList(model);
    	
    	return "/item/bookList";
    }
    
    //�˻����
    @RequestMapping(value = "/resultBook.item")
    public String resultBook(HttpServletRequest req, Model model) throws Exception {
    	
    	return "/item/book/resultBook";
    }
    
    //�������
    @RequestMapping(value = "/bookInsert.item")
    public String bookInsert(HttpServletRequest req, Model model) {
    	System.out.println("/item/bookInsert");
    	
    	return "/item/book/bookInsert";
    }
    
    //�������ó��
    @RequestMapping(value = "/bookInsertPro.item")
    public String bookInsertPro(HttpServletRequest req, Model model) throws Exception {
    	System.out.println("/item/book/bookInsertPro");
    	
    	model.addAttribute("req", req);
		bookService.insertBookPro(model);
    	
    	return "/item/book/bookInsertPro";
    }
    
    //���� ����
    @RequestMapping(value = "/deleteBookPro.item")
    public String deleteBookPro(HttpServletRequest req, Model model) throws Exception {
    	System.out.println("/item/book/deleteBookPro");
    	
    	model.addAttribute("req", req);
    	bookService.deletePro(model);
    	
    	return "/item/book/deleteBookPro";
    }
    
    //�۸��
  	@RequestMapping(value = "/list.item")
  	public String list(HttpServletRequest req, Model model) throws Exception {
  		System.out.println("/item/list");
  		
  		return "/item/bbs";
  	}
  	
  	//���� �� ����
  	@RequestMapping(value = "/bookDetail.item")
  	public String detail(HttpServletRequest req, Model model) throws Exception {
  		System.out.println("/item/book/bookDetail");
  		
  		model.addAttribute("req", req);
		bookService.bookDetail(model);
  		
  		return "/item/book/bookDetail";
  	}
  	
  	//���� ��������
  	@RequestMapping(value = "/updateBook.item")
  	public String updateform(HttpServletRequest req, Model model) throws Exception {
  		System.out.println("/item/book/updateBook");
  		
  		model.addAttribute("req", req);
		bookService.updateform(model);
  		
  		return "/item/book/updateBook";
  	}
  	
  	//���� ��������ó��
  	@RequestMapping(value = "/updateBookPro.item")
  	public String updateBookpro(HttpServletRequest req, Model model) throws Exception {
  		System.out.println("/item/book/updateBookPro");
  		
  		model.addAttribute("req", req);
		bookService.updatePro(model);
  		
  		return "/item/book/updateBookPro";
  	}
  	
  	//�뿩â
  	@RequestMapping(value = "/rendBook.item")
  	public String rendBook(HttpServletRequest req, Model model) throws Exception {
  		System.out.println("/item/book/rendBook");
  		
  		model.addAttribute("req", req);
		rendService.rendBook(model);
  		
  		return "/item/rendBook";
  	}
  	
  	//�뿩ó��
  	@RequestMapping(value = "/rendBookPro.item")
  	public String rendBookPro(HttpServletRequest req, Model model) throws Exception {
  		System.out.println("/item/book/rendBookPro");
  		
  		model.addAttribute("req", req);
  		rendService.rendBookPro(model);
  		
  		return "/item/book/rendBookPro";
  	}
  	
  	//�뿩����Ʈ
  	@RequestMapping(value = "/rendList.item")
  	public String rendList(HttpServletRequest req, Model model) throws Exception {
  		System.out.println("/item/book/rendList");
  		
  		model.addAttribute("req", req);
  		rendService.rendList(model);
  		
  		return "/item/book/rendList";
  	}
  	
  	//�뿩�� å ������
  	@RequestMapping(value = "/rendDetail.item")
  	public String rendDetail(HttpServletRequest req, Model model) throws Exception {
  		
  		model.addAttribute("req", req);
  		rendService.rendDetail(model);
  		
  		return "/item/book/rendDetail";
  	}
  	
  	//�ݳ�â
  	@RequestMapping(value = "/returnBook.item")
  	public String returnBook(HttpServletRequest req, Model model) throws Exception {
  		System.out.println("/item/book/returnBook");
  		
  		model.addAttribute("req", req);
  		
  		return "/item/book/returnBook";
  	}
  	
  	//�ݳ�ó��
  	@RequestMapping(value = "/returnBookPro.item")
  	public String returnBookPro(HttpServletRequest req, Model model) throws Exception {
  		System.out.println("/item/book/returnBookPro");
  		
  		model.addAttribute("req", req);
  		rendService.returnBookPro(model);
  		
  		return "/item/book/returnBookPro";
  	}
  	
  	//������
  	@RequestMapping(value = "/reservList.item")
  	public String reservList(HttpServletRequest req, Model model) throws Exception {
  		System.out.println("/item/book/reservList");
  		
  		model.addAttribute("req", req);
  		reservService.reservList(model);
  		
  		return "/item/book/reservList";
  	}
  	
  	//��������ó��
  	@RequestMapping(value = "/reservBookPro.item")
  	public String reservBookPro(HttpServletRequest req, Model model) throws Exception {
  		System.out.println("/item/book/reservBookPro");
  		
  		model.addAttribute("req", req);
  		reservService.reservBookPro(model);
  		
  		return "/item/book/reservBookPro";
  	}
  	
  	//�̿�ȳ��Խ���
  	@RequestMapping(value = "/guide.item")
  	public String guide(HttpServletRequest req, Model model) throws Exception {
  		System.out.println("/item/book/guide");
  		
  		return "/item/board/guide";
  	}
  	
  	//�̿��û
  	@RequestMapping(value = "/regForm.item")
  	public String regForm(HttpServletRequest req, Model model) throws Exception {
  		System.out.println("/item/book/regForm");
  		
  		model.addAttribute("req", req);
  		
  		return "/item/book/regForm";
  	}
  	
  	//�̿��û ó��
  	@RequestMapping(value = "/regdone.item")
  	public String regdone(HttpServletRequest req, Model model) throws Exception {
  		System.out.println("/item/book/regdone");
  		
  		model.addAttribute("req", req);
  		rendService.regUser(model);
  		
  		return "/item/book/regdone";
  	}
  	
}