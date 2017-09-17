package com.kis.rda.farm.dao;							
							
import java.util.List;							
import java.util.Map;							
							
import org.mybatis.spring.SqlSessionTemplate;							
import org.springframework.beans.factory.annotation.Autowired;							
import org.springframework.stereotype.Repository;							
							
import com.kis.rda.farm.domain.Farm;							
import com.kis.rda.farm.domain.NewFarm;							
							
@Repository							
public class LabckIstatDao {							
							
@Autowired							
private SqlSessionTemplate sqlSession;							
							
							
	public int selectLabckIstatCount(Map<String, Object> map){						
		return sqlSession.selectOne("labckistatDao.selectFarmCount", map);					
	}						
 
public List<Farm> selectLabckistatList(Map<String, Object> map) {
	return sqlSession.selectList("labckistatDao.selectFarmList", map);		
}						
}							
							
							
							
