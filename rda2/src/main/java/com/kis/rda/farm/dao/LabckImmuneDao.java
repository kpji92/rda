package com.kis.rda.farm.dao;							
							
import java.util.List;							
import java.util.Map;							
							
import org.mybatis.spring.SqlSessionTemplate;							
import org.springframework.beans.factory.annotation.Autowired;							
import org.springframework.stereotype.Repository;							
							
import com.kis.rda.farm.domain.Farm;							
import com.kis.rda.farm.domain.NewFarm;							
							
@Repository							
public class LabckImmuneDao {							
							
@Autowired							
private SqlSessionTemplate sqlSession;							
							
							
	public int selectLabckImmuneCount(Map<String, Object> map){						
		return sqlSession.selectOne("labckimmuneDao.selectFarmCount", map);					
	}						
 
public List<Farm> selectLabckimmuneList(Map<String, Object> map) {
	return sqlSession.selectList("labckimmuneDao.selectFarmList", map);			
}						
}							
							
							
							
							
