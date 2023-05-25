package cobra.mvc.center.sports.controller;



import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cobra.mvc.center.sports.service.SportsServiceImpl;

@Controller
@RequestMapping("*.sports")
public class SportsController { 
	
	@Inject
	SportsServiceImpl service;
	
	
	// �׳� �������� ������ 

	@RequestMapping(value = "/menu_middle")
	public String menu_middle(HttpServletRequest req, Model model) throws Exception{	return "/sports/menu_middle";}
	
	@RequestMapping(value = "/soccer_empty")
	public String soccer_empty(HttpServletRequest req, Model model) throws Exception{	return "/sports/soccer_empty";}
	
	
	
	
	
	// ó�� ������
	
	@RequestMapping(value = "/soccerview")
	public String soccerview(HttpServletRequest req, Model model) throws Exception{
		
		model.addAttribute("req", req);
		
		
		return "/sports/soccerview";
	}
	
	@RequestMapping(value = "/club")
	public String club(HttpServletRequest req, Model model) throws Exception{
		model.addAttribute("req", req);
		service.userinfo(model);
		
		return "/sports/club";
	}
	
	@RequestMapping(value = "/passwdchk")
	public String passwdchk(HttpServletRequest req, Model model) throws Exception{
		model.addAttribute("req", req);
		service.passwdchk(model);
		
		return "/sports/passwdchk";
	}
	
	@RequestMapping(value = "/clubadd")
	public String clubadd(HttpServletRequest req, Model model) throws Exception{
		model.addAttribute("req", req);
		service.clubadd(model);
		
		return "/sports/clubadd";
	}
	
	@RequestMapping(value = "/clubchk")
	public String clubchk(HttpServletRequest req, Model model) throws Exception{
		model.addAttribute("req", req);
		service.clubchk(model);
		
		return "/sports/main";
	}
	
	
	@RequestMapping(value = "/main")
	public String sports(HttpServletRequest req, Model model) throws Exception{
		
		model.addAttribute("req", req);
		
		service.loginchk(model);
		
		return "/sports/main";
	}
	
	@RequestMapping(value = "/calendar")
	public String calendar(HttpServletRequest req, Model model) throws Exception{
		
		model.addAttribute("req", req);
		
		service.calendarchk(model);
		
		return "/sports/calendar";
	}
	
	@RequestMapping(value = "/soccer")
	public String soccer(HttpServletRequest req, Model model) throws Exception{
		
		
		
		return "/sports/soccer";
	}
	
	@RequestMapping(value = "/placelist")
	public String placelist(HttpServletRequest req, Model model) throws Exception{
		
		model.addAttribute("req", req);
		
		return "/sports/placelist";
	}
	@RequestMapping(value = "/test1")
	public String sports1(HttpServletRequest req, Model model) throws Exception{
		
		model.addAttribute("req", req);
		service.userinfo(model);
		
		return "/sports/test1";
	}
	
	//���� �Է�
	@RequestMapping(value = "/fieldinsert")
	public String fieldinsert(HttpServletRequest req, Model model) throws Exception{
		
		model.addAttribute("req", req);
		
		
		return "fieldinsert";
	}
	
	
	//���� ��� ó��
	@RequestMapping(value = "/fieldPro")
	public String fieldPro(HttpServletRequest req, Model model) throws Exception{
		
		model.addAttribute("req", req);
		service.fieldinsert(model);
		
		return "/sports/fieldPro";
	}
	
	//�ʵ� ����
	@RequestMapping(value="/fieldselect")
	public String fieldselect(HttpServletRequest req, Model model) throws Exception{
		
		model.addAttribute("req", req);
		
		service.fieldselect(model);
		
		return "/sports/fieldselect";
	}

	//���� ���
	@RequestMapping(value = "/place")
	public String place(HttpServletRequest req, Model model) throws Exception{
		
		model.addAttribute("req", req);
		
		service.place(model);
		
		return "/sports/place";
	}
	//���� �Է�
	@RequestMapping(value = "/newteam")
	public String newteam(HttpServletRequest req, Model model) throws Exception{
		
		model.addAttribute("req", req);
		service.clubinfo(model);
		
		return "/sports/newteam";
	}
	//�� �� ���
	@RequestMapping(value = "/newteamPro")
	public String newteamPro(HttpServletRequest req, Model model) throws Exception{
		
		model.addAttribute("req", req);
		service.newteam(model);
		
		return "/sports/newteamPro";
	}
	
	//�� ���
	@RequestMapping(value="/teamlist")
	public String teamList(HttpServletRequest req, Model model) throws Exception{
		
		model.addAttribute("req", req);
		service.teamlist(model);
		
		return "/sports/teamlist";
	}
	
	
	//�� ����
	@RequestMapping(value="/teamdeleteform")
	public String teamdeleteform(HttpServletRequest req, Model model) throws Exception{
		
		
		model.addAttribute("req", req);
		
		service.adminchk(model);
		
		
		return "/sports/teamdeleteform";
	}
	
	
	//�� ����
	@RequestMapping(value="/teamdelete")
	public String teamdelete(HttpServletRequest req, Model model) throws Exception{
		
		model.addAttribute("req", req);
		service.teamdelete(model);
		
		return "/sports/teamdelete";
	}
	
	//�� ����
	@RequestMapping(value="/teaminfo")
	public String teamselect(HttpServletRequest req, Model model) throws Exception{
		
		model.addAttribute("req", req);
		
		service.teamselect(model);
		
		return "/sports/teaminfo";
	}
	
	//��Ī ���
	@RequestMapping(value="/matchinglist")
	public String matching(HttpServletRequest req, Model model) throws Exception{
		
		model.addAttribute("req", req);
		
		service.matchinglist(model);
		
		return "/sports/matchinglist";
	}
	
	//��Ī 
	@RequestMapping(value="/matchinginsert")
	public String matchinginsert(HttpServletRequest req, Model model) throws Exception{
		
		model.addAttribute("req", req);
		
		service.matchinginsert(model);
		
		return "/sports/matchinginsert";
	}
	
	//��Ī ��� ��� 
	@RequestMapping(value="/matchingcancle")
	public String matchingcancle(HttpServletRequest req, Model model) throws Exception{
		
		model.addAttribute("req", req);
		System.out.println("���ʴϱ�"+req.getParameter("times"));
		service.matchingcancle(model);
		
		return "/sports/matchingcancle";
	}
	
	//������ �Ǵ� �� ��� ��� and ������Ʈ ���
	@RequestMapping(value="/yellowcard")
	public String yellowcard(HttpServletRequest req, Model model) throws Exception{
		
		model.addAttribute("req", req);
		
		service.yellowcard(model);
		
		return "/sports/yellowcard";
	
	}
	//���� ����
	@RequestMapping(value="/playerselect")
	public String playerselect(HttpServletRequest req, Model model) throws Exception{
		
		model.addAttribute("req", req);
		
		service.playerselect(model);
		
		return "/sports/playerselect";
	
	}
	
	//���� ���
	@RequestMapping(value="/playeradd")
	public String playeradd(HttpServletRequest req, Model model) throws Exception{
		
		model.addAttribute("req", req);
		
		service.playeradd(model);
		
		return "/sports/playeradd";
	
	}
	
	//���� ���
	@RequestMapping(value="/playeraddform")
	public String playeraddform(HttpServletRequest req, Model model) throws Exception{
		
		model.addAttribute("req", req);
		
		service.playeraddform(model);
		
		return "/sports/playeraddform";
	
	}
	
	
	//���� ���� ���
	@RequestMapping(value="/playerinfo")
	public String playerinfo(HttpServletRequest req, Model model) throws Exception{
		
		model.addAttribute("req", req);
		
		service.playerinfo(model);
		
		return "/sports/teaminfo";
	
	}
	
	//���� ���� ��
	@RequestMapping(value="/playerdeleteform")
	public String playerdeleteform(HttpServletRequest req, Model model) throws Exception{
		
		model.addAttribute("req", req);
		
		req.getParameter("id");
		req.getParameter("name");
		service.adminchk(model);
		
		
		return "/sports/playerdeleteform";
	
	}
	
	
	//���� Ż��
	@RequestMapping(value="/playerdelete")
	public String playerdelete(HttpServletRequest req, Model model) throws Exception{
		
		model.addAttribute("req", req);
		
		service.playerdelete(model);
		
		return "/sports/playerdelete";
	
	}
	
	//���� ���� 
	@RequestMapping(value="/reservation")
	public String reservation(HttpServletRequest req, Model model) throws Exception{
		
		model.addAttribute("req", req);
		
		
		service.teamsearch(model);
		
		
		return "/sports/reservation";
	
	}
	
	//���� ���� ó��
	@RequestMapping(value="/reservationPro")
	public String reservationPro(HttpServletRequest req, Model model) throws Exception{
		
		model.addAttribute("req", req);
		
		service.reservationPro(model);
		
		service.calendarchk(model);
		
		return "/sports/reservationPro";
	
	}
	
	//������Ʈ ���
	@RequestMapping(value="/blacklist")
	public String blacklist(HttpServletRequest req, Model model) throws Exception{
		
		model.addAttribute("req", req);
		
		service.blacklist(model);
	
		return "/sports/blacklist";

	}
	
	

	//���� Ȯ��
	@RequestMapping(value="/reservationchk")
	public String reservationchk(HttpServletRequest req, Model model) throws Exception{
		
		model.addAttribute("req", req);
		service.reservationchk(model);
		
		return "/sports/reservationchk";

	}
	
	
	
	//���� ���
	@RequestMapping(value="/rescancle")
	public String rescancle(HttpServletRequest req, Model model) throws Exception{
		
		model.addAttribute("req", req);
		model.addAttribute("team", req.getParameter("team"));
		model.addAttribute("fieldname", req.getParameter("fieldname"));
		model.addAttribute("time", req.getParameter("time"));
		
		System.out.println(req.getParameter("team"));
		
		service.rescancle(model);
		
		return "/sports/rescancle";

	}
	
	
	
	//�� ����
	@RequestMapping(value="/teamadmin")
	public String teamadmin(HttpServletRequest req, Model model) throws Exception{
		
		model.addAttribute("req", req);
		
		service.teamadmin(model);
		
		return "/sports/teamadmin";

	}
	
	
	//���Խ�û
	@RequestMapping(value="/teamask")
	public String teamask(HttpServletRequest req, Model model) throws Exception{
		
		model.addAttribute("req", req);
		
		String team=req.getParameter("team");
		String name=(String) req.getSession().getAttribute("name");
		System.out.println(name);
		model.addAttribute("name", name);
		model.addAttribute("team", team);
		
		
		
		return "/sports/teamask";

	}
	
	//���Խ�û ó��
	@RequestMapping(value="/teamaskPro")
	public String teamaskPro(HttpServletRequest req, Model model) throws Exception{
		
		model.addAttribute("req", req);
		
		service.teamask(model);
		
		return "/sports/teamaskPro";

	}
	
	
	
	//��Ī ��û
	@RequestMapping(value="/matchingask")
	public String matchingask(HttpServletRequest req, Model model) throws Exception{
		
		model.addAttribute("req", req);
		
		service.matchingask(model);
		
		return "/sports/matchingask";

	}
	
	//��Ī ����
	@RequestMapping(value="/matchingcom")
	public String matchingcom(HttpServletRequest req, Model model) throws Exception{
		
		model.addAttribute("req", req);
		
		service.matchingcom(model);
		
		return "/sports/matchingcom";

	}
	
	//������Ʈ ����
	@RequestMapping(value="/blacklistdel")
	public String blacklistdel(HttpServletRequest req, Model model) throws Exception{
		
		model.addAttribute("req", req);
		service.blacklistdel(model);
		return "/sports/blacklistdel";

	}
	
	@RequestMapping(value="/newblacklist")
	public String newblacklist(HttpServletRequest req, Model model) throws Exception{
		
		model.addAttribute("req", req);
		return "/sports/newblacklist";

	}
	
	
	@RequestMapping(value="/blacklistadd")
	public String blacklistadd(HttpServletRequest req, Model model) throws Exception{
		
		model.addAttribute("req", req);
		service.blacklistadd(model);
		return "/sports/blacklistadd";

	}
	
	
	
	@RequestMapping(value="/askok")
	public String askok(HttpServletRequest req, Model model) throws Exception{
		
		model.addAttribute("req", req);
		service.askok(model);
		
		return "/sports/askok";

	}
	
	
	@RequestMapping(value="/blacklistadmin")
	public String blacklistadmin(HttpServletRequest req, Model model) throws Exception{
		
		model.addAttribute("req", req);
		service.blacklistadmin(model);
		
		return "/sports/blacklistadmin";

	}
	
	
	
	
	@RequestMapping(value="/blacklistupdate")
	public String blacklistupdate(HttpServletRequest req, Model model) throws Exception{
		
		model.addAttribute("req", req);
		service.blacklistupdate(model);
		
		return "/sports/blacklistupdate";

	}
	
	//�ɷ�ġ �׷���
	@RequestMapping(value="/graph")
	public String graph(HttpServletRequest req, Model model) throws Exception{
		
		model.addAttribute("req", req);
		
		service.graph(model);
		
		return "/sports/graphtest";

	}
	

	
}




