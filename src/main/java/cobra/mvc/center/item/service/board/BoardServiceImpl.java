package cobra.mvc.center.item.service.board;

import javax.inject.Inject;

import cobra.mvc.center.item.persistence.board.BoardDAO;

public class BoardServiceImpl implements BoardService {
	
	@Inject
	BoardDAO dao;
/*
	//게시판 글목록
	@Override
	public void list(Model model) throws Exception {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		int pageSize = 10;		//한페이지에 출력할 글 갯수
		int pageBlock = 5;		//출력할 페이지 갯수
		
		int cnt = 0;			//글갯수
		int start = 0;			//현재 페이지 시작번호 : rownum
		int end = 0;			//현재 페이지 끝번호
		int number = 0;			//출력할 글 번호
		String pageNum = null;	//페이지 번호
		int currentPage = 0;	//현재 페이지
		
		int pageCount = 0;		//페이지 갯수
		int startPage = 0;		//시작 페이지
		int endPage = 0;		//마지막 페이지
	
		//글 갯수 구하기
		cnt = dao.getCount();

		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";	//값이 없을 때 첫페이지는 1페이지로 설정
		}
		
		currentPage = (Integer.parseInt(pageNum)); //현재페이지 설정
		
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); //페이지 갯수 (글갯수/ 페이지에 표시할 갯수) + (글갯수 / 페이지 표시할 갯수에서 나머지가 있으면 +1 없으면 +0);
		
		start = (currentPage - 1) * pageSize + 1;	//현재페이지 시작번호 
		end = start + pageSize - 1;					//현재페이지 끝번호
		
		if(end > cnt) end = cnt;					//끝번호가 남은 글 갯수보다 크면 cnt로 적용 
		
		//출력할 글번호
		number = cnt - (currentPage - 1) * pageSize;
		ArrayList<BoardDTO> dtos = new ArrayList<BoardDTO>();
		Map<String, Object> daoMap = new HashMap<String, Object>();
		
		if(cnt > 0) {	//게시글 목록조회
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
