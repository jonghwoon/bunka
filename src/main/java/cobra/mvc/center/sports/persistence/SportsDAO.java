package cobra.mvc.center.sports.persistence;

import java.util.List;
import java.util.Map;

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

public interface SportsDAO {
	
	//회원 정보
	public UserDTO user(String name);
	
	//구장 등록
	public int fieldinsert(Map<String, Object> daoMap);

	public FieldDTO place(String idx);

	public int teaminsert(Map<String, Object> daoMap);

	public List<TeamDTO> teamlist();

	public int teamdelete(String team);

	public TeamDTO teamselect(String team);
	
	public TeamDTO teamidselect(String id);

	public int teamswitch(Map<String, Object> daoMap);

	public int fieldchange(Map<String, Object> daoMap);

	public List<FieldDTO> fieldselect(String idx);

	public List<ReservationDTO> matchinglist(Map<String, Object> daoMap);

	public int matchinginsert(Map<String, Object> daoMap);

	public int matchingcancle(Map<String, Object> daoMap);

	public int blacklistadd(Map<String, Object> daoMap);

	public List<PlayerDTO> playerinfo(String team);

	public PlayerDTO playerselect(String id);

	public int playeradd(Map<String, Object> daoMap);

	public int playerdelete(String id);

	public int reservation(Map<String, Object> daoMap);

	public List<ReservationDTO> calendarchk(String fieldname);

	public int yellowadd(Map<String, Object> daoMap);

	public List<BlacklistDTO> blacklist(String chk);

	public int clubchk(String id);

	public int idchk(String id);

	public int passwdchk(Map<String, Object> daoMap);

	public int clubadd(Map<String, Object> daoMap);

	public ClubDTO clubinfo(String id);

	public List<ReservationDTO> reservationchk(String team);

	public int teamask(Map<String, Object> daoMap);

	public TeamDTO teamsearch(String team);

	public int rescancle(Map<String, Object> daoMap);

	public void playerupdate(String team);

	public void reservationdelete(String team);

	public int matchingask(Map<String, Object> daoMap);

	public List<MatchingDTO> matchingcom();

	public void reservationupdate(Map<String, Object> res);

	public int blacklistdel(String team);

	public List<TeamaskDTO> teamasklist(String team);

	public int askok(Map<String, Object> daoMap);

	public void askdelete(String id);

	public List<BlacklistDTO> blacklistadmin(String chk);

	public int blacklistupdate(String team);

	public TeamaskDTO asklist(String id);

	public void rematching(Map<String, Object> res);

	public UserDTO useridselect(String id);

	public GraphDTO dataidselect(String id);
	
	

	
	
	
	

}
