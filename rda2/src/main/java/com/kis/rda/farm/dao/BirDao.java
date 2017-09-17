package com.kis.rda.farm.dao;		
		
import java.util.List;		
import java.util.Map;		
		
import org.mybatis.spring.SqlSessionTemplate;		
import org.springframework.beans.factory.annotation.Autowired;		
import org.springframework.stereotype.Repository;

import com.kis.rda.common.domain.Environment;
import com.kis.rda.farm.domain.BirUpdate;
import com.kis.rda.farm.domain.EntityList;
import com.kis.rda.farm.domain.Farm;		
import com.kis.rda.farm.domain.NewFarm;		
		
@Repository		
public class BirDao {		
		
@Autowired		
private SqlSessionTemplate sqlSession;		
		
		
	public int selectBirCount(Map<String, Object> map){	
		return sqlSession.selectOne("BirDao.selectFarmCount", map);
	}	
public List<Farm> selectBirList(Map<String, Object> map){		
	return sqlSession.selectList("BirDao.selectFarmList", map);	
	}	
public List<Farm> selectEnvList(Map<String, Object> map){		
System.out.println("=================================");		
return sqlSession.selectList("BirDao.selectFarmList", map);		
}		
public List<Environment> ajaxbirEntityList(Map<String, Object> map) {		
System.out.println("===================farmId=의 맵값============="+ map.get("farmId"));		
return sqlSession.selectList("BirDao.ajaxbirEntityList", map);		
}		
public String birEntityUpdateSelectOne(String farmId) {		
System.out.println("===================farmId=의 맵값============="+ farmId);		
	return sqlSession.selectOne("BirDao.birEntityUpdateSelectOne",farmId);	
}		
//public int ajaxbirEntityUpdatetDo(Environment environment) {		
//		
//return sqlSession.update("BirDao.ajaxbirEntityUpdatetDo",environment);		
//}		
public int ajaxbirEntityDeleteDo(BirUpdate environment) {		
	// TODO Auto-generated method stub	
return sqlSession.delete("BirDao.ajaxbirEntityDeleteDo",environment);		
}		
//public int ajaxbirEntityInsertDo(EnvUpdate environment) {		
//	// TODO Auto-generated method stub	
//return sqlSession.insert("BirDao.ajaxbirEntityInsertDo",environment);		
//}		
public int ajaxbirEntityInsertDo(BirUpdate entityInsert) {
	return sqlSession.insert("BirDao.ajaxbirEntityInsertDo",entityInsert);		

}
public Map<String, Object> ajaxenvEntitySelectOneBeforUpdate(String entity_id) {
	// TODO Auto-generated method stub
	return sqlSession.selectOne("BirDao.ajaxenvEntitySelectOneBeforUpdate",entity_id);	
}
public int ajaxbirEntityUpdatetDo(BirUpdate entityUpdate) {
	System.out.println("===================farmId=의 맵값=========== 수정==");	
	return sqlSession.update("BirDao.ajaxbirEntityUpdatetDo",entityUpdate);		
}
public List<EntityList> ajaxentityEntityList(EntityList entityEntityList) {
	// TODO Auto-generated method stub
	return sqlSession.selectList("BirDao.ajaxentityEntityList", entityEntityList);	
}
public Map<String, Object> birEntitySelectOneBeforeUpdate(String entity_id) {
	return sqlSession.selectOne("BirDao.birEntitySelectOneBeforeUpdate",entity_id);	
}
public List<EntityList> ajaxbirEntityListDetail(BirUpdate entityDetail) {
	System.out.println("===================farmId=의 맵값=========== dao수정=="+entityDetail.getENTITY_ID());	
	String birEntityID = entityDetail.getENTITY_ID();
	return sqlSession.selectList("BirDao.ajaxbirEntityListDetail", entityDetail);	
}
public String birEntityInsertSelectOne(String farmId) {
	System.out.println("===================farmId=의 맵값=====birEntityInsertSelectOne====== dao수정=="+farmId);	
	return sqlSession.selectOne("BirDao.birEntityInsertSelectOne",farmId);	
}

}		
		
		
		
		
 