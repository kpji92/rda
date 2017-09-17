package com.kis.rda.farm.dao;							
							
import java.util.List;							
import java.util.Map;							
							
import org.mybatis.spring.SqlSessionTemplate;							
import org.springframework.beans.factory.annotation.Autowired;							
import org.springframework.stereotype.Repository;							
							
import com.kis.rda.farm.domain.Farm;							
import com.kis.rda.farm.domain.NewFarm;							
							
@Repository							
public class LabckInfectionDao {							
							
@Autowired							
private SqlSessionTemplate sqlSession;							
							
							
	public int selectLabckInfectionCount(Map<String, Object> map){						
		return sqlSession.selectOne("labckinfectionDao.selectFarmCount", map);					
	}						
 
public List<Farm> selectLabckinfectionList(Map<String, Object> map) {
	return sqlSession.selectList("labckinfectionDao.selectFarmList", map);			
}						
}							
							
							
							
