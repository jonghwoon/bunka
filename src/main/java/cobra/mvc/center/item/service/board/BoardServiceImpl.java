package cobra.mvc.center.item.service.board;

import javax.inject.Inject;

import cobra.mvc.center.item.persistence.board.BoardDAO;

public class BoardServiceImpl implements BoardService {
	
	@Inject
	BoardDAO dao;
/*
	//�Խ��� �۸��
	@Override
	public void list(Model model) throws Exception {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		int pageSize = 10;		//���������� ����� �� ����
		int pageBlock = 5;		//����� ������ ����
		
		int cnt = 0;			//�۰���
		int start = 0;			//���� ������ ���۹�ȣ : rownum
		int end = 0;			//���� ������ ����ȣ
		int number = 0;			//����� �� ��ȣ
		String pageNum = null;	//������ ��ȣ
		int currentPage = 0;	//���� ������
		
		int pageCount = 0;		//������ ����
		int startPage = 0;		//���� ������
		int endPage = 0;		//������ ������
	
		//�� ���� ���ϱ�
		cnt = dao.getCount();

		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";	//���� ���� �� ù�������� 1�������� ����
		}
		
		currentPage = (Integer.parseInt(pageNum)); //���������� ����
		
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); //������ ���� (�۰���/ �������� ǥ���� ����) + (�۰��� / ������ ǥ���� �������� �������� ������ +1 ������ +0);
		
		start = (currentPage - 1) * pageSize + 1;	//���������� ���۹�ȣ 
		end = start + pageSize - 1;					//���������� ����ȣ
		
		if(end > cnt) end = cnt;					//����ȣ�� ���� �� �������� ũ�� cnt�� ���� 
		
		//����� �۹�ȣ
		number = cnt - (currentPage - 1) * pageSize;
		ArrayList<BoardDTO> dtos = new ArrayList<BoardDTO>();
		Map<String, Object> daoMap = new HashMap<String, Object>();
		
		if(cnt > 0) {	//�Խñ� �����ȸ
			daoMap.put("start", start);
			daoMap.put("end", end);

			String search = null;
			
			search = req.getParameter("search");
			daoMap.put("search", search);
			
			if(search == null) {
				dtos = dao.getArticles(daoMap);
				model.addAttribute("dtos", dtos);
			} else {
				dtos = dao.getSearch(daoMap);
				model.addAttribute("dtos", dtos);
			}
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
		
	}*/
}
