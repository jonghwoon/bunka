package cobra.mvc.center.sports.service;

import org.springframework.ui.Model;

public interface SportsService {
	
	
	public void loginchk(Model model) throws Exception;
	
	
	public void userinfo(Model model) throws Exception;
	
	//시설가입 확인
	public void clubchk(Model model) throws Exception;
	
	//체육시설 가입
	public void clubadd(Model model) throws Exception;
	
	//구장 등록
	public void fieldinsert(Model model) throws Exception;
	
	//구장 목록
	public void place(Model model) throws Exception;
	
	//새팀 등록
	public void newteam(Model model) throws Exception;
	
	//팀 목록
	public void teamlist(Model model) throws Exception;
	
	//팀 삭제
	public void teamdelete(Model model) throws Exception;
	
	//팀 선택
	public void teamselect(Model model) throws Exception;
	
	//구장 선택
	public void fieldselect(Model model) throws Exception;
	
	//매칭 목록 matching
	public void matchinglist(Model model) throws Exception;
	
	//매칭 등록
	public void matchinginsert(Model model) throws Exception;
	
	//매칭 취소 
	public void matchingcancle(Model model) throws Exception;
	
	//경고 
	public void yellowcard(Model model) throws Exception;
	
	//선수 정보 
	public void playerinfo(Model model) throws Exception;
	
	//선수 가입 
	public void playerselect(Model model) throws Exception;
	
	//선수 등록 
	public void playeradd(Model model) throws Exception;
	
	//선수 탈퇴
	public void playerdelete(Model model) throws Exception;
	
	//구장 등록 
	public void reservationPro(Model model) throws Exception;
	
	//예약 현황
	public void calendarchk(Model model) throws Exception;
	
	//블랙리스트 목록 
	public void blacklist(Model model) throws Exception;
	
	//클럽원 정보 
	public void clubinfo(Model model) throws Exception;
	
	//예약 확인
	public void reservationchk(Model model) throws Exception;
	
	//예약 취소 
	public void rescancle(Model model) throws Exception;
	
	//팀 관리 
	public void teamadmin(Model model) throws Exception;
	
	//팀 가입신청
	public void teamask(Model model) throws Exception;
	
	//선수등록 폼 
	public void playeraddform(Model model) throws Exception;
	
	//아이디로 팀 검색
	public void teamsearch(Model model) throws Exception;
	
	//권한 체크
	public void adminchk(Model model) throws Exception;
	
	//비밀번호 체크
	public void passwdchk(Model model) throws Exception;
	
	//매칭 
	public void matchingask(Model model) throws Exception;
	
	//매칭 성사
	public void matchingcom (Model model) throws Exception;

	//블랙리스트 삭제
	public void blacklistdel(Model model) throws Exception;

	//블랙리스트 추가
	public void blacklistadd(Model model) throws Exception;
	
	//가입승인 
	public void askok(Model model) throws Exception;
	
	//블랙리스트 관리 
	public void blacklistadmin(Model model) throws Exception;
	
	//블랙리스트 등록 
	public void blacklistupdate(Model model) throws Exception;
	
	//그래프 
	public void graph(Model model) throws Exception;
}
