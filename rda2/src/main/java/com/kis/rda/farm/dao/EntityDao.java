package com.kis.rda.farm.dao;		
		
import java.util.List;		
import java.util.Map;		
		
import org.mybatis.spring.SqlSessionTemplate;		
import org.springframework.beans.factory.annotation.Autowired;		
import org.springframework.stereotype.Repository;

import com.kis.rda.common.domain.Environment;
import com.kis.rda.farm.domain.EntityList;
import com.kis.rda.farm.domain.EnvUpdate;
import com.kis.rda.farm.domain.Farm;		
import com.kis.rda.farm.domain.NewFarm;		
		
@Repository		
public class EntityDao {		
		
@Autowired		
private SqlSessionTemplate sqlSession;		
		
		
	public int selectEntityCount(Map<String, Object> map){	
		return sqlSession.selectOne("EntityDao.selectFarmCount", map);
	}	
public List<Farm> selectEntityList(Map<String, Object> map){		
	return sqlSession.selectList("EntityDao.selectFarmList", map);	
	}
public List<EntityList> ajaxentityEntityList(EntityList entityEntityList) {
	// TODO Auto-generated method stub
	return sqlSession.selectList("EntityDao.ajaxentityEntityList", entityEntityList);	
}	
public String entityEntityUpdateSelectOne(String farmId) {			
System.out.println("===================farmId=의 맵값============="+ farmId);			
	return sqlSession.selectOne("EntityDao.entityEntityUpdateSelectOne",farmId);		
}			
public int ajaxentityEntityUpdatetDo(EntityList entityUpdate) {			
			
return sqlSession.update("EntityDao.ajaxentityEntityUpdatetDo",entityUpdate);			
}			
public int ajaxentityEntityDeleteDo(EntityList entityUpdate) {			
	// TODO Auto-generated method stub		
return sqlSession.delete("EntityDao.ajaxentityEntityDeleteDo",entityUpdate);			
}			
public int ajaxentityEntityInsertDo(EntityList environment) {			
	// TODO Auto-generated method stub		
return sqlSession.insert("EntityDao.ajaxentityEntityInsertDo",environment);			
}
public EntityList ajaxenvEntitySelectOneBeforUpdate(String entity_id) {
	// TODO Auto-generated method stub
	return sqlSession.selectOne("EntityDao.ajaxenvEntitySelectOneBeforUpdate",entity_id);	
}
 
 			
			


}		
		
		
		
		
		
		
 
		
