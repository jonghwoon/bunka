package cobra.mvc.center.common.persistence;

import java.util.ArrayList;
import java.util.HashMap;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import cobra.mvc.center.common.domain.DTO;
import cobra.mvc.center.common.domain.FileDTO;

@Repository
public class DAOImpl extends DAOAbst implements DAO {
	 
	public ArrayList<DTO> makeDTO(DTO dto, ArrayList<HashMap<String, Object>> mapArray){		
		ArrayList<DTO> dtos = new ArrayList<DTO>();
		
		for(HashMap<String, Object> map : mapArray){
			 DTO dtoT = dto.getNew();
			 for(String name : dtoT.getNames()){
				Object value = map.get(name);
				if(value!=null)
					dtoT.set(name,value);
			 }
			 dtos.add(dtoT);
		}		
		return dtos;
	}
	
	@Inject
	public SqlSession sqlSession;	// 종속 객체 주입

	// 메소드 호출용 ============================================================
	protected DAOImpl() {		
		methods = this.getClass().getDeclaredMethods();
	}	
	// ==========================================================================
	
	public DAOImpl getInstance(){
		return this;
	}	
		
	// 공용 명령어 ==============================================================
	/*
	@Override 
	public ArrayList<DTO> mySelect(DTO dto) {		
		DAO dao = sqlSession.getMapper(DAO.class);
		return dao.mySelect(dto);
	}
	*/
	
	@Override 
	public ArrayList<DTO> mySelect(DTO dto) {		
		DAO dao = sqlSession.getMapper(DAO.class);
		return dao.mySelect(dto);
	}
	
	@Override 
	public ArrayList<DTO> mySearch(DTO dto) {
		DAO dao = sqlSession.getMapper(DAO.class);		
		return dao.mySearch(dto);
	}
	
	@Override 
	public ArrayList<DTO> myCheck(DTO dto) {	
		DAO dao = sqlSession.getMapper(DAO.class);		
		return dao.myCheck(dto);
	}
		
	@Override 
	public int myInsert(DTO dto){
		DAO dao = sqlSession.getMapper(DAO.class);
		return dao.myInsert(dto);
	};
	
	@Override 
	public int myDelete(DTO dto){
		DAO dao = sqlSession.getMapper(DAO.class);
		return dao.myDelete(dto);
	};
	
	@Override 
	public int myUpdate(DTO dto){
		DAO dao = sqlSession.getMapper(DAO.class);
		return dao.myUpdate(dto);
	};

	public int myCount(DTO dto){
		System.out.println("    ●myCount(DTO dto)");		
		DAO dao = sqlSession.getMapper(DAO.class);
		return dao.myCount(dto);
	}

	@Override 
	public ArrayList<DTO> myTest(DTO dto) {
		DAO dao = sqlSession.getMapper(DAO.class);
		return dao.myTest(dto);
	}
	
	// 공용 명령어 3 =================================================
	@Override
	public ArrayList<DTO> mySearchAndPaging(HashMap<String,Object> map) {
		DAO dao = sqlSession.getMapper(DAO.class);		
		return dao.mySearchAndPaging(map);	
	}	
		
	// SQL 명령어 ====================================================
	@Override 
	public int sqlUpdate(HashMap<String,String> map){
		DAO dao = sqlSession.getMapper(DAO.class);
		System.out.println(map.get("sql"));
		return dao.sqlUpdate(map);
	};	
	
	@Override 
	public int sqlInsert(HashMap<String,String> map){
		DAO dao = sqlSession.getMapper(DAO.class);
		System.out.println(map.get("sql"));
		return dao.sqlInsert(map);
	};
	
	@Override
	public ArrayList<DTO> sqlSelect(HashMap<String,String> map){
		DAO dao = sqlSession.getMapper(DAO.class);		
		return dao.sqlSelect(map);
	}
	
	// 특수 명령어 ===================================================
	@Override 
	public int fileUpload(FileDTO fdto){
		DAO dao = sqlSession.getMapper(DAO.class);
		return dao.fileUpload(fdto);
	};
	
	@Override 
	public int fileUpdate(FileDTO fdto){
		DAO dao = sqlSession.getMapper(DAO.class);
		return dao.fileUpdate(fdto);
	};
	
	@Override 
	public DTO fileDownload(DTO dto){
		DAO dao = sqlSession.getMapper(DAO.class);
		return dao.fileDownload(dto);
	};
}

