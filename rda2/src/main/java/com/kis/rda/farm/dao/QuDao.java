package com.kis.rda.farm.dao;		
		
import java.util.List;		
import java.util.Map;		
		
import org.mybatis.spring.SqlSessionTemplate;		
import org.springframework.beans.factory.annotation.Autowired;		
import org.springframework.stereotype.Repository;		
		
import com.kis.rda.farm.domain.Farm;		
import com.kis.rda.farm.domain.NewFarm;
import com.kis.rda.farm.domain.QuResearch;		
		
@Repository		
public class QuDao {		
		
@Autowired		
private SqlSessionTemplate sqlSession;		
		
		
	public int selectQuCount(Map<String, Object> map){	
		return sqlSession.selectOne("QuDao.selectFarmCount", map);
	}	
public List<Farm> selectQuList(Map<String, Object> map){		
	return sqlSession.selectList("QuDao.selectFarmList", map);	
	}
public int quresearchInput(QuResearch quresearch) {
	 
	return sqlSession.insert("QuDao.quresearchInput", quresearch);
	}	
}		
		
