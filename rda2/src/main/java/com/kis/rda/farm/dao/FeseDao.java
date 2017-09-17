package com.kis.rda.farm.dao;		
		
import java.util.List;		
import java.util.Map;		
		
import org.mybatis.spring.SqlSessionTemplate;		
import org.springframework.beans.factory.annotation.Autowired;		
import org.springframework.stereotype.Repository;		
		
import com.kis.rda.farm.domain.Farm;
import com.kis.rda.farm.domain.FecesInput;
import com.kis.rda.farm.domain.NewFarm;		
		
@Repository		
public class FeseDao {		
		
@Autowired		
private SqlSessionTemplate sqlSession;		
		
		
	public int selectFeseCount(Map<String, Object> map){	
		return sqlSession.selectOne("FeseDao.selectFarmCount", map);
	}	
public List<Farm> selectFeseList(Map<String, Object> map){		
	return sqlSession.selectList("FeseDao.selectFarmList", map);	
	}
public int ajaxfeseEntityInsertDo(FecesInput entityInsert) {
 return sqlSession.insert("FeseDao.ajaxfeseEntityInsertDo",entityInsert);
}	
}		
		
		
