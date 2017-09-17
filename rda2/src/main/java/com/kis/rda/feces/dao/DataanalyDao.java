package com.kis.rda.feces.dao;		
		
import java.util.List;		
import java.util.Map;		
		
import org.mybatis.spring.SqlSessionTemplate;		
import org.springframework.beans.factory.annotation.Autowired;		
import org.springframework.stereotype.Repository;

import com.kis.rda.common.domain.Entity;
import com.kis.rda.farm.domain.EntityList;
import com.kis.rda.farm.domain.Farm;		
import com.kis.rda.farm.domain.NewFarm;
import com.kis.rda.feces.domain.Feces;		
		
@Repository		
public class DataanalyDao {		
		
@Autowired		
private SqlSessionTemplate sqlSession;		
		
		
	public int selectDataanalyCount(Map<String, Object> map){	
		return sqlSession.selectOne("DataanalyDao.selectFarmCount", map);
	}	
public List<Feces> selectDataanalyList(Map<String, Object> map){		
	return sqlSession.selectList("DataanalyDao.selectFarmList", map);	
	}
public EntityList feserecogrecogEntitySelectOne(String entity_id) {
	return sqlSession.selectOne("DataanalyDao.feserecogrecogEntitySelectOne",entity_id);	
}


}		
		
		
