package cobra.mvc.center.art.persistence;

import java.util.ArrayList;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import cobra.mvc.center.common.domain.DTO;
import cobra.mvc.center.common.persistence.DAOAbst;

@Repository
public class DAO_art_Impl extends DAOAbst implements DAO_art {
	
	@Inject
	public SqlSession sqlSession;	// 종속 객체 주입

	// 메소드 호출용 ============================================================
	protected DAO_art_Impl() {		
		methods = this.getClass().getDeclaredMethods();
	}	
	// ==========================================================================
	
	public DAO_art_Impl getInstance(){
		return this;
	}	
	
	@Override
	public ArrayList<DTO> showFind(DTO dto) {
		DAO_art dao = sqlSession.getMapper(DAO_art.class);
		return dao.showFind(dto);
	}
	
	
		
}

