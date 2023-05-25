package cobra.mvc.center.circle.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import cobra.mvc.center.common.domain.DTO;

@Repository
public class CircleDAOImpl implements CircleDAO{
	@Inject
	public SqlSession sqlSession;
	
	@Override
	public int MaxValue(DTO dto) {
		CircleDAO dao = sqlSession.getMapper(CircleDAO.class);
		return dao.MaxValue(dto);
	}
}
