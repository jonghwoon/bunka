package cobra.mvc.center.sports.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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

@Repository
public class SportsDAOImpl implements SportsDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public UserDTO user(String name) {
		UserDTO dto=null;
		
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		dto=dao.user(name);
		
		
		return dto;
	}

	@Override
	public int fieldinsert(Map<String, Object> daoMap) {
		int cnt=0;
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		cnt=dao.fieldinsert(daoMap);
		
		return cnt;
	}

	@Override
	public FieldDTO place(String idx) {
		FieldDTO dto = null;
		
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		dto=dao.place(idx);
		
		return dto;
	}

	@Override
	public int teaminsert(Map<String, Object> daoMap) {
		int cnt = 0;
		
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		cnt = dao.teaminsert(daoMap);
		
		
		
		return cnt;
	}

	@Override
	public List<TeamDTO> teamlist() {
		List<TeamDTO> dto = null;
		
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		dto=dao.teamlist();
		
		return dto;
	}

	@Override
	public int teamdelete(String team) {
		int cnt=0;
		
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		cnt=dao.teamdelete(team);
		
		return cnt;
	}
	
	//팀 선택
	@Override
	public TeamDTO teamselect(String team) {
		TeamDTO dto = null;
		
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		dto = dao.teamselect(team);
		
		
		return dto;
	}
	
	//팀 정보 변경
	@Override
	public int teamswitch(Map<String, Object> daoMap) {
		int cnt=0;
		
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		cnt=dao.teamswitch(daoMap);
		
		return cnt;
	}

	@Override
	public int fieldchange(Map<String, Object> daoMap) {
		
		int cnt=0;
		
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		cnt=dao.fieldchange(daoMap);
		
		return cnt;
	
	}

	@Override
	public List<FieldDTO> fieldselect(String idx) {
		List<FieldDTO> dto= null;
		
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		dto=dao.fieldselect(idx);
		
		return dto;
	}

	@Override
	public List<ReservationDTO> matchinglist(Map<String, Object> daoMap) {
		List<ReservationDTO> dto=null;
		
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		dto=dao.matchinglist(daoMap);
		
		
		return dto;
	}

	@Override
	public int matchinginsert(Map<String, Object> daoMap) {
		int cnt = 0;
		
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		cnt=dao.matchinginsert(daoMap);
		
		return cnt;
	}

	@Override
	public int matchingcancle(Map<String, Object> daoMap) {
		int cnt = 0;
		
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		cnt=dao.matchingcancle(daoMap);
		
		return cnt;
	}

	@Override
	public int blacklistadd(Map<String, Object> daoMap) {
		int cnt = 0;
		
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		cnt=dao.blacklistadd(daoMap);
		
		return cnt;
	}

	@Override
	public List<PlayerDTO> playerinfo(String team) {
		List<PlayerDTO> play=null;
		
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		play=dao.playerinfo(team);
		
		return play;
	}

	@Override
	public PlayerDTO playerselect(String id) {
		PlayerDTO ply=null;
		
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		ply=dao.playerselect(id);
		
		return ply;
	}

	@Override
	public int playeradd(Map<String, Object> daoMap) {
		int cnt = 0;
		
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		cnt = dao.playeradd(daoMap);
		
		return cnt;
	}

	@Override
	public int playerdelete(String id) {
		int cnt = 0;
		
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		cnt=dao.playerdelete(id);
		
		return cnt;
	}

	@Override
	public int reservation(Map<String, Object> daoMap) {
		int cnt=0;
		
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		cnt=dao.reservation(daoMap);
		
		
		
		return cnt;
	}
	
	
	//예약 현황
	@Override
	public List<ReservationDTO> calendarchk(String fieldname) {
		List<ReservationDTO> dto=null;
		
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		dto=dao.calendarchk(fieldname);
		
		
		
		return dto;
	}

	@Override
	public int yellowadd(Map<String, Object> daoMap) {
		int cnt=0;
		
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		cnt=dao.yellowadd(daoMap);
		
		return cnt;
	}

	@Override
	public List<BlacklistDTO> blacklist(String chk) {
		
		List<BlacklistDTO> dto=null;
		
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		dto=dao.blacklist(chk);
		
		return dto;
	}

	@Override
	public int clubchk(String id) {
		int cnt=0;
		
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		cnt=dao.clubchk(id);
		
		return cnt;
	}

	@Override
	public int idchk(String id) {
		int cnt = 0;
		
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		cnt=dao.idchk(id);
		
		return cnt;
	}

	@Override
	public int passwdchk(Map<String, Object> daoMap) {
		
		int cnt = 0;
		
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		cnt=dao.passwdchk(daoMap);
		
		return cnt;
		
		
	}

	@Override
	public int clubadd(Map<String, Object> daoMap) {
		int cnt=0;
		
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		cnt=dao.clubadd(daoMap);
		
		return cnt;
	}

	@Override
	public ClubDTO clubinfo(String id) {
		ClubDTO dto=null;
		
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		dto=dao.clubinfo(id);
		
		
		return dto;
	}

	@Override
	public List<ReservationDTO> reservationchk(String team) {
		List<ReservationDTO> dto=null;
				
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		dto=dao.reservationchk(team);
				
		return dto;
	}

	@Override
	public int rescancle(Map<String, Object> daoMap) {
		int cnt=0;
		
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		cnt = dao.rescancle(daoMap);
		return cnt;
	}

	@Override
	public TeamDTO teamidselect(String id) {
		TeamDTO dto=null;
		
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		dto=dao.teamidselect(id);
		
		
		return dto;
	}

	@Override
	public int teamask(Map<String, Object> daoMap) {
		int cnt=0;
		
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		cnt=dao.teamask(daoMap);
		
		return cnt;
	}

	@Override
	public TeamDTO teamsearch(String team) {
		TeamDTO dto=null;
		
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		dto=dao.teamsearch(team);
		
		return dto;
	}

	@Override
	public void playerupdate(String team) {
		
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		dao.playerupdate(team);
		
	}

	@Override
	public void reservationdelete(String team) {
		
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		dao.reservationdelete(team);
		
	}

	@Override
	public int matchingask(Map<String, Object> daoMap) {
		int cnt=0;
		
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		cnt=dao.matchingask(daoMap);
		
		return cnt;
	}

	@Override
	public List<MatchingDTO> matchingcom() {
		List<MatchingDTO> dtos=null;
		
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		dtos=dao.matchingcom();
		
		return dtos;
	}

	@Override
	public void reservationupdate(Map<String, Object> res) {
		
		
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		dao.reservationupdate(res);
		
	}

	@Override
	public int blacklistdel(String team) {
		
		int cnt = 0;
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		cnt=dao.blacklistdel(team);
				
		return cnt;
	}

	@Override
	public List<TeamaskDTO> teamasklist(String team) {
		List<TeamaskDTO> ask= null;
		
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		ask=dao.teamasklist(team);
		
		return ask;
	}

	@Override
	public int askok(Map<String, Object> daoMap) {
		int cnt=0;
		
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		cnt=dao.askok(daoMap);
		
		return cnt;
	}

	@Override
	public void askdelete(String id) {
		
		
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		dao.askdelete(id);
		
	}

	@Override
	public List<BlacklistDTO> blacklistadmin(String chk) {
		List<BlacklistDTO> dtos= null;
		
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		dtos=dao.blacklistadmin(chk);
		
		
		return dtos;
	}

	@Override
	public int blacklistupdate(String team) {
		int cnt=0;
		
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		cnt=dao.blacklistupdate(team);
		
		return cnt;
	}

	@Override
	public TeamaskDTO asklist(String id) {
		TeamaskDTO dto=null;
				
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);		
		dto=dao.asklist(id);
		
		return dto;
	}

	@Override
	public void rematching(Map<String, Object> res) {
		
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		dao.rematching(res);
		
	}

	@Override
	public UserDTO useridselect(String id) {
		UserDTO dto=null;
		
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		dto=dao.useridselect(id);
		
		return dto;
	}

	@Override
	public GraphDTO dataidselect(String id) {
		GraphDTO dto=null;
		
		SportsDAO dao=sqlSession.getMapper(SportsDAO.class);
		dto=dao.dataidselect(id);
		
		return dto;
	}



}
