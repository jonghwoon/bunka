package cobra.mvc.center.sports.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import cobra.mvc.center.sports.domain.BlacklistDTO;
import cobra.mvc.center.sports.domain.ClubDTO;
import cobra.mvc.center.sports.domain.FieldDTO;
import cobra.mvc.center.sports.domain.GraphDTO;
import cobra.mvc.center.sports.domain.MatchingDTO;
import cobra.mvc.center.sports.domain.PlayerDTO;
import cobra.mvc.center.sports.domain.ReservationDTO;
import cobra.mvc.center.sports.domain.TeamDTO;
import cobra.mvc.center.sports.domain.TeamaskDTO;
import cobra.mvc.center.sports.domain.UserDTO;
import cobra.mvc.center.sports.persistence.SportsDAO;

@Service
public class SportsServiceImpl implements SportsService {
	
	@Inject
	SportsDAO dao;
	
	//회원 정보
	@Override
	public void userinfo(Model model) throws Exception {
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest req=(HttpServletRequest) map.get("req");
		
		String name= (String) req.getSession().getAttribute("name");
		System.out.println(name);
		
		
		UserDTO dto=dao.user(name);
		
		model.addAttribute("dto", dto);
		
		
	}

	//구장 등록
	@Override
	public void fieldinsert(Model model) throws Exception {
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest req=(HttpServletRequest) map.get("req");
		
		int cnt = 0;
		String idx= req.getParameter("place");
		String place=req.getParameter("place");
		int price=Integer.parseInt(req.getParameter("price"));
		String field=req.getParameter("field");
		String fsize=req.getParameter("fsize");
		
		Map<String,Object> daoMap=new HashMap<String, Object>();
		daoMap.put("idx", idx);
		daoMap.put("place", place);
		daoMap.put("price", price);
		daoMap.put("field", field);
		daoMap.put("fsize", fsize);
		
		cnt=dao.fieldinsert(daoMap);
		
		model.addAttribute("cnt", cnt);
	}

	//구장 목록
	@Override
	public void place(Model model) throws Exception {
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest req=(HttpServletRequest) map.get("req");
		String idx = req.getParameter("name");
		int cnt = 0;
		String id= (String) req.getSession().getAttribute("id");
		
			
		
		
		System.out.println(idx);
		
		FieldDTO dto = dao.place(idx);
		System.out.println(id);
		TeamDTO team=dao.teamidselect(id);
		PlayerDTO ply=dao.playerselect(id);
		if(ply != null){
		ply.getTeam();
		
			System.out.println(ply.getTeam());
			model.addAttribute("ply", ply);
				
		model.addAttribute("dto", dto);
		model.addAttribute("team", team);
			cnt=1;
		}else{
			cnt = 0;
		}
		model.addAttribute("cnt", cnt);
		
	}

	//팀 등록
	@Override
	public void newteam(Model model) throws Exception {
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest req=(HttpServletRequest) map.get("req");
		int cnt=0;
		String grade="";
		
		System.out.println(req.getParameter("skill"));
		
		if(req.getParameter("skill").equals("1")){
			grade="하";
		}else if(req.getParameter("skill").equals("2")){
			grade="중";
		}else{
			grade="상";
		}
		
		Map<String, Object> daoMap=new HashMap<String, Object>();
		daoMap.put("id", req.getParameter("userid"));
		daoMap.put("team", req.getParameter("team"));
		daoMap.put("leader", req.getParameter("leader"));
		daoMap.put("place", req.getParameter("place"));
		daoMap.put("lineup", req.getParameter("lineup"));
		daoMap.put("PR", req.getParameter("PR"));
		daoMap.put("grade", grade);
		
		try{
		 cnt=dao.teaminsert(daoMap);
		}catch(Exception e){
			e.printStackTrace();
		}
		 
		model.addAttribute("cnt", cnt);
	}

	//팀 목록
	@Override
	public void teamlist(Model model) throws Exception {
		
		
		
		
		List<TeamDTO> dto = dao.teamlist();
		
		model.addAttribute("dto", dto);
		
		
	}

	@Override
	public void teamdelete(Model model) throws Exception {

		Map<String, Object> map=model.asMap();
		HttpServletRequest req=(HttpServletRequest) map.get("req");
		
		String id=(String) req.getSession().getAttribute("id");
		String passwd=req.getParameter("passwd");
		String team=req.getParameter("team");
		/*System.out.println(id);
		System.out.println(passwd);
		System.out.println(team);*/
		
		int cnt=0;
		
		System.out.println(id);
		PlayerDTO dto=dao.playerselect(id);
		
		Map<String, Object> daoMap=new HashMap<String, Object>();
		daoMap.put("id", id);
		daoMap.put("passwd", passwd);
		
		if(dto.getGrade().equals("리더")){
			cnt=dao.passwdchk(daoMap);
			if(cnt == 1){
				 dao.teamdelete(team);
				 dao.playerdelete(id);
				 dao.playerupdate(team);
				 dao.reservationdelete(team);
				 cnt=3;
			}else{
				cnt = 4;
			}
		}else{
			cnt=2;
		}
		
		
		model.addAttribute("cnt", cnt);
		
	}

	public void teamselect(Model model) {
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest req=(HttpServletRequest) map.get("req");
		
		String team=req.getParameter("team");
		
		System.out.println(team);
		
		TeamDTO dto= dao.teamselect(team);
		
		model.addAttribute("dto", dto);
		
		
	}

	

	

	@Override
	public void fieldselect(Model model) throws Exception {
		

		Map<String, Object> map=model.asMap();
		HttpServletRequest req=(HttpServletRequest) map.get("req");
		String idx = req.getParameter("idx");
		
		List<FieldDTO> dto=dao.fieldselect(idx);
		
		model.addAttribute("dto", dto);
	}

	public void matchinglist(Model model) {
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest req=(HttpServletRequest) map.get("req");
		int cnt=0;
		
		String grade=req.getParameter("gradechk");
		String team=req.getParameter("team");
		Map<String, Object> daoMap=new HashMap<String, Object>();
		daoMap.put("grade", grade);
		daoMap.put("team", team);
		
		List<ReservationDTO> dtos=dao.matchinglist(daoMap);
		
		
		String[] times =new String[dtos.size()];
		
		
		if(dtos.size() != 0){
		
		String time=null;	
		String[] ltime= new String[dtos.size()];
			for(int i=0; i<dtos.size(); i++){
				ltime[i] = dtos.get(i).getTime();
			
			String point=ltime[i].substring(0, 1);
				switch(point){
					case "0" : time = "07:00~09:00"; break;
					case "1" : time = "09:00~11:00"; break;
					case "2" : time = "11:00~13:00"; break;
					case "3" : time = "13:00~15:00"; break;
					case "4" : time = "15:00~17:00"; break;
					case "5" : time = "17:00~19:00"; break;
					case "6" : time = "19:00~21:00"; break;
					case "7" : time = "21:00~23:00"; break;
				}
				System.out.println("time : "+ time);
				System.out.println("i:"+i);
				times[i] = time;
			}
			
		}else{
			cnt=1;
		}
		model.addAttribute("cnt", cnt);
		model.addAttribute("times", times);
		model.addAttribute("dtos", dtos);
		
	}

	@Override
	public void matchinginsert(Model model) throws Exception {
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest req=(HttpServletRequest) map.get("req");
		
		int cnt=0;
		String team=req.getParameter("team");
		String date=req.getParameter("date");
		String lineup=req.getParameter("lineup");
		
		TeamDTO dto=(TeamDTO) dao.teamselect(team);
		
		
		Map<String, Object> daoMap=new HashMap<String, Object>();
		daoMap.put("team", dto.getTeam());
		daoMap.put("id", dto.getId());
		daoMap.put("leader", dto.getLeader());
		daoMap.put("grade", dto.getGrade());
		daoMap.put("lineup", lineup);
		daoMap.put("matching", "on");
		daoMap.put("day", date);
		cnt=dao.matchinginsert(daoMap);
		
		model.addAttribute("cnt", cnt);
		
		
	}

	@Override
	public void matchingcancle(Model model) throws Exception {
		

		Map<String, Object> map=model.asMap();
		HttpServletRequest req=(HttpServletRequest) map.get("req");
		
		int cnt = 0;
		String id=(String) req.getSession().getAttribute("id");
		String team1=req.getParameter("team1");
		String team2=req.getParameter("team2");
		String day=req.getParameter("day");
		String times=req.getParameter("times");
		
		System.out.println("req :"+ req==null);
		
		System.out.println(team1);
		System.out.println(team2);
		System.out.println(day);
		System.out.println(times);
		
		String point=null;
		Map<String, Object> daoMap=new HashMap<String, Object>();
		daoMap.put("team1", team1);
		daoMap.put("team2", team2);
		daoMap.put("day", day);
		
		/*String[] hour={"07:00~09:00", "09:00~11:00", "11:00~13:00", "15:00~17:00", "17:00~19:00", "19:00~21:00", "21:00~23:00"};
		 point = hour.(times);*/
			
		/*for(int i=0; i<8; i++){
			if(times.equals(hour[i])){
				 point= Integer.toString(i); 
			}
		}*/
		
		switch(times){
			case "07:00~09:00" : point = "0"; break;
			case "09:00~11:00" : point = "1"; break;
			case "11:00~13:00" : point = "2"; break;
			case "13:00~15:00" : point = "3"; break;
			case "15:00~17:00" : point = "4"; break;
			case "17:00~19:00" : point = "5"; break;
			case "19:00~21:00" : point = "6"; break;
			case "21:00~23:00" : point = "7"; break;
		}
		
		String time=point+"."+day;
		
		System.out.println(time);
		Map<String, Object> res=new HashMap<String, Object>();
		res.put("team1", team1);
		res.put("time", time);
		
		PlayerDTO dto=dao.playerselect(id);
		
		if(dto.getGrade().equals("리더")){
		
		dao.rematching(res);
		cnt = dao.matchingcancle(daoMap);
		}
		
		model.addAttribute("cnt", cnt);
		
	}

	@Override
	public void yellowcard(Model model) throws Exception {
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest req=(HttpServletRequest) map.get("req");
		
		int cnt= 0;
		String team=req.getParameter("team");
		String content=req.getParameter("content");
		
		TeamDTO dto=dao.teamselect(team);
		
		Map<String, Object> daoMap=new HashMap<String, Object>();
		daoMap.put("team", dto.getTeam());
		daoMap.put("leader", dto.getLeader());
		daoMap.put("content", content);
		
		
		if(dto.getYellow().equals("0")){
			
			cnt=dao.yellowadd(daoMap);
			
		}else{
			dao.blacklistadd(daoMap);
			cnt=2;
		}
		
		model.addAttribute("cnt", cnt);
	}

	@Override
	public void playerinfo(Model model) throws Exception {
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest req=(HttpServletRequest) map.get("req");
		
		String team =req.getParameter("team");
		System.out.println(team);
		
		List<PlayerDTO> play=dao.playerinfo(team);
		
		model.addAttribute("play", play);
		
	}
	
	//스포츠센터 가입
	@Override
	public void playerselect(Model model) throws Exception {
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest req=(HttpServletRequest) map.get("req");
		
		String id=(String) req.getSession().getAttribute("id");
		
		PlayerDTO dto =dao.playerselect(id);
		
		model.addAttribute("dto", dto);
		
	}

	@Override
	public void playeradd(Model model) throws Exception {
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest req=(HttpServletRequest) map.get("req");
		
		int cnt = 0;
		
		String team=req.getParameter("team");
		String id=(String) req.getSession().getAttribute("id");
		String place=req.getParameter("place");
		String age=req.getParameter("age");
		String position=req.getParameter("position");
		String address=req.getParameter("address");
		String ability=req.getParameter("ability");
		String grade=req.getParameter("grade");
		String name=(String) req.getSession().getAttribute("name");
		
		Map<String, Object> daoMap=new HashMap<String, Object>();
		daoMap.put("id", id);
		daoMap.put("place", place);
		daoMap.put("team", team);
		daoMap.put("age", age);
		daoMap.put("position", position);
		daoMap.put("address", address);
		daoMap.put("ability", ability);
		daoMap.put("grade", grade);
		daoMap.put("name", name);
		
		
		cnt=dao.playeradd(daoMap);
		
		model.addAttribute("cnt", cnt);
		
	}

	public void playerdelete(Model model) {
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest req=(HttpServletRequest) map.get("req");
		
		int cnt=0;
		
		String id= req.getParameter("delid");
		
		cnt=dao.playerdelete(id);
		
		model.addAttribute("cnt", cnt);
	}

	@Override
	public void reservationPro(Model model) throws Exception {
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest req=(HttpServletRequest) map.get("req");
		
		int cnt=0;
		
		
		String time=req.getParameter("time");
		String name=req.getParameter("name");
		String fieldname=req.getParameter("fieldname");
		String lineup=req.getParameter("lineup");
		String team=req.getParameter("team");
		String grade=req.getParameter("grade");
		int matching=0;
		
		if(req.getParameter("matching") != null){
			matching=Integer.parseInt("1");
		}
		Map<String, Object> daoMap=new HashMap<String, Object>();
		daoMap.put("time", time);
		daoMap.put("name", name);
		daoMap.put("fieldname", fieldname);
		daoMap.put("lineup", lineup);
		daoMap.put("team", team);
		daoMap.put("grade", grade);
		daoMap.put("matching", matching);
		
		System.out.println("time"+ time);
		System.out.println("name"+ name);
		System.out.println("fieldname"+ fieldname);
		System.out.println("lineup"+ lineup);
		System.out.println("team"+ team);
		System.out.println("grade"+ grade);
		System.out.println("matching"+ matching);
		
		
		
		
		
		cnt=dao.reservation(daoMap);
		
		model.addAttribute("cnt", cnt);
		
	}

	@Override
	public void calendarchk(Model model) throws Exception {
		Map<String, Object> map=model.asMap();
		HttpServletRequest req=(HttpServletRequest) map.get("req");
		
		String fieldname = req.getParameter("fieldname");
		
		
		List<ReservationDTO> dto=dao.calendarchk(fieldname);
		String time="";
		String team="";
		
		
		for(int i=0; i<dto.size(); i++){
			 time += dto.get(i).getTime()+"-";
			 team += dto.get(i).getTeam()+"-";
		}
		
		model.addAttribute("time", time);
		model.addAttribute("team", team); 
		
		
		
	}

	@Override
	public void blacklist(Model model) throws Exception {
		
		
		String chk="1";
		System.out.println(chk);
		
		List<BlacklistDTO> dto=dao.blacklist(chk);
		
		model.addAttribute("dto", dto);
		
	}

	@Override
	public void clubchk(Model model) throws Exception {
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest req=(HttpServletRequest) map.get("req");
		
		int cnt= 0;
		
		String id=(String) req.getSession().getAttribute("id");
		System.out.println(id);
		//String name=(String) req.getSession().getAttribute("name");
		
		if(id==null){
			cnt=2;
		}else{
			cnt=dao.clubchk(id);
		}
		
		model.addAttribute("cnt", cnt);
	}

	@Override
	public void clubadd(Model model) throws Exception {
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest req=(HttpServletRequest) map.get("req");
		
		int cnt=0;
		String name= (String) req.getSession().getAttribute("name");
		UserDTO dto=dao.user(name);
		
		if(dto.getPasswd().equals(req.getParameter("passwd"))){
			Map<String, Object> daoMap=new HashMap<String, Object>();
			daoMap.put("id", dto.getId());
			daoMap.put("name", dto.getName());
			daoMap.put("passwd", req.getParameter("passwd"));
			daoMap.put("call", dto.getHp());
			daoMap.put("address", dto.getAddress());
			
			cnt= dao.clubadd(daoMap);
		}else{
			cnt=0;
		}
		
		
		
		
		
		model.addAttribute("cnt", cnt);
		
		
	}
	
	public void passwdchk(Model model) {
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest req=(HttpServletRequest) map.get("req");
		
		int cnt=0;
		
		String id = req.getParameter("userid");
		String passwd =req.getParameter("passwd");
		
		Map<String, Object> daoMap=new HashMap<String, Object>();
		daoMap.put("id", id);
		daoMap.put("passwd", passwd);
		
		
		int check=dao.idchk(id);
		
		if(check == 1){
			cnt=dao.passwdchk(daoMap);
		}
		
		model.addAttribute("cnt", cnt);
	}

	public void loginchk(Model model) {
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest req=(HttpServletRequest) map.get("req");
		int cnt=0;
		String id = (String)req.getSession().getAttribute("id");
		
		
			System.out.println(id);
			if(id == null){
				cnt = 2;
			}else{
				cnt=dao.clubchk(id);
			}
				System.out.println(cnt);
				
			model.addAttribute("cnt", cnt);
		}

	@Override
	public void clubinfo(Model model) throws Exception {
			
		Map<String, Object> map=model.asMap();
		HttpServletRequest req=(HttpServletRequest) map.get("req");
		
		String id=(String) req.getSession().getAttribute("id");
		
		ClubDTO dto=dao.clubinfo(id);
		
		model.addAttribute("dto", dto);
	}

	@Override
	public void reservationchk(Model model) throws Exception {
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest req=(HttpServletRequest) map.get("req");
		
		int cnt=0;
		
		String team=req.getParameter("team");
		List<ReservationDTO> dtos=dao.reservationchk(team);
		String[] times =new String[dtos.size()];
		
		
		if(dtos.size() != 0){
		
		String time=null;	
		String[] ltime= new String[dtos.size()];
			for(int i=0; i<dtos.size(); i++){
				ltime[i] = dtos.get(i).getTime();
			
			String point=ltime[i].substring(0, 1);
				switch(point){
					case "0" : time = "07:00~09:00"; break;
					case "1" : time = "09:00~11:00"; break;
					case "2" : time = "11:00~13:00"; break;
					case "3" : time = "13:00~15:00"; break;
					case "4" : time = "15:00~17:00"; break;
					case "5" : time = "17:00~19:00"; break;
					case "6" : time = "19:00~21:00"; break;
					case "7" : time = "21:00~23:00"; break;
				}
				System.out.println("time : "+ time);
				System.out.println("i:"+i);
				times[i] = time;
			}
			
		}else{
			cnt=1;
		}
		model.addAttribute("times", times);
		model.addAttribute("dto", dtos);
		model.addAttribute("cnt", cnt);
		
	}

	public void rescancle(Model model) {
		Map<String, Object> map=model.asMap();
		HttpServletRequest req=(HttpServletRequest) map.get("req");
		
		String id=(String) req.getSession().getAttribute("id");
		String time=req.getParameter("time");
		System.out.println("gggg: "+ time);
		String fieldname=req.getParameter("fieldname");
		String team=req.getParameter("team");
		System.out.println(team);
		System.out.println(fieldname);
		int cnt=0;
		PlayerDTO dto=dao.playerselect(id);
		
		Map<String, Object> daoMap=new HashMap<String, Object>();
		daoMap.put("time", time);
		daoMap.put("fieldname", fieldname);
		daoMap.put("team", team);
		
		/*switch(time){
		case "07:00~09:00" : break;
		case "09:00~11:00" : break;
		case "11:00~13:00" : break;
		case "13:00~15:00" : break;
		case "15:00~17:00" : break;
		case "17:00~19:00" : break;
		case "19:00~21:00" : break;
		case "21:00~23:00" : break;
		}*/
		
		System.out.println(dto.getGrade());
		
		if(dto.getGrade().equals("리더")){
			
			
			
			cnt=dao.rescancle(daoMap);
		}
		
		model.addAttribute("cnt", cnt);
	}

	@Override
	public void teamadmin(Model model) throws Exception {
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest req=(HttpServletRequest) map.get("req");
		
		int cnt=0;
		List<PlayerDTO> play=null;
		List<TeamaskDTO> ask = null;
		String id=(String) req.getSession().getAttribute("id");
		
		PlayerDTO dto=dao.playerselect(id);
		if(dto !=null){
			String team = dto.getTeam();
			System.out.println(team);
			
	
			if(dto.getGrade().equals("리더")){
				cnt = 1;
			 play = dao.playerinfo(team);
			 
			//여기 가입신청 목록
			 ask = dao.teamasklist(team);
			
			}else{
				cnt=0;
			}
		}
			if(ask != null){
			model.addAttribute("ask", ask);
		}
		
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("play", play);
		
	}

	@Override
	public void teamask(Model model) throws Exception {
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest req=(HttpServletRequest) map.get("req");
		
		String name=req.getParameter("name");
		String team=req.getParameter("team");
		String id=req.getParameter("id");
		String place=req.getParameter("place");
		String age=req.getParameter("age");
		String position=req.getParameter("position");
		String address=req.getParameter("address");
		String ability=req.getParameter("ability");
		String grade=req.getParameter("grade");
		int cnt=0;
		
		PlayerDTO dto=dao.playerselect(id);
		
		if(dto == null){
		
		Map<String, Object> daoMap=new HashMap<String, Object>();
		daoMap.put("id", id);
		daoMap.put("place", place);
		daoMap.put("team", team);
		daoMap.put("age", age);
		daoMap.put("position", position);
		daoMap.put("address", address);
		daoMap.put("ability", ability);
		daoMap.put("grade", grade);
		daoMap.put("name", name);
		
		cnt=dao.teamask(daoMap);
		}
		
		model.addAttribute("cnt", cnt);
		
	}

	@Override
	public void playeraddform(Model model) throws Exception {
		Map<String, Object> map=model.asMap();
		HttpServletRequest req=(HttpServletRequest) map.get("req");
		
		String id=(String) req.getSession().getAttribute("id");
		String name=(String) req.getSession().getAttribute("name");
		TeamDTO dto=null;
		int cnt=0;
		
		dto=dao.teamidselect(id);
		
		model.addAttribute("name", name);
		model.addAttribute("cnt", cnt);
		model.addAttribute("dto", dto);
		
		
	}

	@Override
	public void teamsearch(Model model) throws Exception {
			
		Map<String, Object> map=model.asMap();
		HttpServletRequest req=(HttpServletRequest) map.get("req");
		
		String id=(String) req.getSession().getAttribute("id");
		PlayerDTO ply=dao.playerselect(id);
		String team=ply.getTeam();
		
		TeamDTO dto=dao.teamsearch(team);
		
		model.addAttribute("dto", dto);
		
	}

	@Override
	public void adminchk(Model model) throws Exception {
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest req=(HttpServletRequest) map.get("req");
		
		int cnt=0;
		TeamDTO dto=null;
		
		String id=(String) req.getSession().getAttribute("id");
		
		PlayerDTO ply=dao.playerselect(id);
		
		System.out.println(ply.getTeam());
		System.out.println(ply.getId());
		System.out.println(ply.getGrade());
		
		if(ply.getGrade().equals("리더")){
			cnt=1;
			dto=dao.teamidselect(id);
		}
		System.out.println(cnt);
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("dto", dto);
		
		}

	@Override
	public void matchingask(Model model) throws Exception {
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest req=(HttpServletRequest) map.get("req");
		
		String id= (String) req.getSession().getAttribute("id");
		String team1 = req.getParameter("team");
		String time = req.getParameter("time");
		String fieldname = req.getParameter("fieldname");
		String times=null;
		System.out.println(time);
		int spl=time.indexOf(".");
		String day=time.substring(spl+1);
		int cnt= 0;
		
		
		TeamDTO teamdto=dao.teamidselect(id);
		String team2=teamdto.getTeam();
		
		System.out.println(time);
		String point=time.substring(0, 1);
		switch(point){
			case "0" : times = "07:00~09:00"; break;
			case "1" : times = "09:00~11:00"; break;
			case "2" : times = "11:00~13:00"; break;
			case "3" : times = "13:00~15:00"; break;
			case "4" : times = "15:00~17:00"; break;
			case "5" : times = "17:00~19:00"; break;
			case "6" : times = "19:00~21:00"; break;
			case "7" : times = "21:00~23:00"; break;
		}
		Map<String, Object> daoMap=new HashMap<String, Object>();
		daoMap.put("team1", team1);
		daoMap.put("fieldname", fieldname);
		daoMap.put("team2", team2);
		daoMap.put("day", day);
		daoMap.put("times", times);
		
		cnt=dao.matchingask(daoMap);
		
		Map<String, Object> res=new HashMap<String, Object>();
		res.put("team1", team1);
		res.put("time", time);
		dao.reservationupdate(res);
		
		System.out.println(cnt);
		model.addAttribute("cnt", cnt);
		
		
		}

		@Override
		public void matchingcom(Model model) throws Exception {
			
			
			
			int cnt= 0;
			List<MatchingDTO> dtos=dao.matchingcom();
			
			if(dtos.size() != 0){
					
				cnt=1;
				
			}
			
			System.out.println("출력 여부 :" +cnt);
			model.addAttribute("dtos", dtos);
			model.addAttribute("cnt", cnt);
		}
		
		@Override
		public void blacklistdel(Model model) throws Exception {
			int cnt=0;
			Map<String, Object> Map=model.asMap();
			HttpServletRequest req=(HttpServletRequest) Map.get("req");
			
			String team=req.getParameter("team");
			String id=(String) req.getSession().getAttribute("id");
					
			System.out.println("team"+team);
			
			UserDTO dto=dao.useridselect(id);
			if(dto.getGrade() == 1000 || dto.getGrade() == 9999){
			
			cnt=dao.blacklistdel(team);
			
			}
			
			model.addAttribute("cnt", cnt);
			
		}
		
		@Override
		public void blacklistadd(Model model) throws Exception {
			int cnt=0;
			
			
			Map<String, Object> Map=model.asMap();
			HttpServletRequest req=(HttpServletRequest) Map.get("req");
		
			
			String team=req.getParameter("team");
			String leader=req.getParameter("leader");
			String content=req.getParameter("content");
			//String yellow=req.getParameter("yellow");
			
			Map.put("team", team);
			Map.put("leader", leader);
			Map.put("content", content);
			Map.put("chk", req.getParameter("chk"));
			//daoMap.put("yellow", yellow);
			
			cnt = dao.blacklistadd(Map);
			model.addAttribute("cnt", cnt);
			
		}

		@Override
		public void askok(Model model) throws Exception {
			
			Map<String, Object> Map=model.asMap();
			HttpServletRequest req=(HttpServletRequest) Map.get("req");
			
			int cnt=0;
			String id=req.getParameter("id");
			System.out.println(id);
			
			TeamaskDTO dto=dao.asklist(id);
			System.out.println(dto.getPlace());
			
			Map<String, Object> daoMap=new HashMap<String, Object>();
			daoMap.put("id", id);
			daoMap.put("place", dto.getPlace());
			daoMap.put("team", dto.getTeam());
			daoMap.put("age", dto.getAge());
			daoMap.put("position", dto.getPosition());
			daoMap.put("address", dto.getAddress());
			daoMap.put("ability", dto.getAbility());
			daoMap.put("name", dto.getName());
			daoMap.put("grade", dto.getGrade());
			
			
			cnt=dao.askok(daoMap);
			dao.askdelete(id);
			
			model.addAttribute("cnt", cnt);
			
		}

		public void blacklistadmin(Model model) {


			
			
			String chk="0";
			
			List<BlacklistDTO> dtos=dao.blacklistadmin(chk);
			
			model.addAttribute("dtos", dtos);
			
		}

		@Override
		public void blacklistupdate(Model model) throws Exception {
			
			Map<String, Object> map=model.asMap();
			HttpServletRequest req=(HttpServletRequest) map.get("req");
			
			String team= req.getParameter("team");
			int cnt=0;
			
			
			System.out.println(team);
			
			
			cnt=dao.blacklistupdate(team);
			
			model.addAttribute("cnt", cnt);
			
			
		}

		@Override
		public void graph(Model model) throws Exception {
			
			Map<String, Object> map=model.asMap();
			HttpServletRequest req=(HttpServletRequest) map.get("req");
			
			String id=req.getParameter("id");
			System.out.println(id);
			
			GraphDTO dto=dao.dataidselect(id);
			float agi=(float) (dto.getAgi()*0.1);
			float def=(float) (dto.getDef()*0.1);
			float hp=(float) (dto.getHp()*0.1);
			float mag=(float) (dto.getMag()*0.1);
			float mp=(float) (dto.getMp()*0.1);
			float str=(float) (dto.getStr()*0.1);
			
			GraphDTO dtos=new GraphDTO();
			dtos.setAgi(agi);
			dtos.setDef(def);
			dtos.setHp(hp);
			dtos.setMag(mag);
			dtos.setMp(mp);
			dtos.setStr(str);
			
			model.addAttribute("dtos", dtos);
			
		}

		

		
		
	}


