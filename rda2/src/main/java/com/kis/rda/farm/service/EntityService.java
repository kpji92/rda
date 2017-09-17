package com.kis.rda.farm.service;							
import java.util.HashMap;							
import java.util.List;							
import java.util.Map;							
							
import org.springframework.beans.factory.annotation.Autowired;							
import org.springframework.stereotype.Service;

import com.kis.rda.common.domain.Environment;
import com.kis.rda.farm.dao.EntityDao;
import com.kis.rda.farm.domain.EntityList;
import com.kis.rda.farm.domain.EnvUpdate;
import com.kis.rda.farm.domain.Farm;							
import com.kis.rda.farm.domain.NewFarm;							
import com.kis.rda.util.Paging;							
import com.kis.rda.util.UtilPaging;							
							
@Service							
public class EntityService {							
							
							
							
@Autowired							
private EntityDao entityDao;							
public Map<String, Object> selectFarmListServ(int pageNum, String searchOption, String searchValue){							
	Map<String, Object> map = new HashMap<String, Object>();						
	map.put("searchOption", searchOption);						
	map.put("searchValue", searchValue);						
	int totalCount = entityDao.selectEntityCount(map);						
	UtilPaging utilPaging = new UtilPaging();						
	Paging paging = utilPaging.pagingMethod(pageNum, totalCount);						
	map.put("beginRow", paging.getBeginRow());						
	map.put("endRow", paging.getEndRow());						
	List<Farm> entityList = entityDao.selectEntityList(map);						
	map.put("entityList",entityList);						
	map.put("totalCount", totalCount);						
	map.put("paging", paging);						
	return map;						
}
public Map<String, Object> ajaxentityEntityList(EntityList entityEntityList) {
	Map<String, Object> map = new HashMap<String, Object>();		
	List<EntityList> ajaxentityEntityList = entityDao.ajaxentityEntityList(entityEntityList);	
	map.put("entityList",ajaxentityEntityList);
	return map;
}

public String entityEntityUpdateSelectOne(String farmId) {			
	Map<String, Object> map = new HashMap<String, Object>();		
	map.put("farmId", farmId);		
	String farmNm =    entityDao.entityEntityUpdateSelectOne(farmId);		
	return farmNm;		
}			
		

public int ajaxentityEntityUpdatetDo(EntityList entityUpdate) {			
	
int result = entityDao.ajaxentityEntityUpdatetDo(entityUpdate);		
return result;		
}			

//public int ajaxenvEntityDeleteDo(EntityList environment) {			
//int result = entityDao.ajaxentityEntityDeleteDo(environment);		
//return result;		
//}			
 
public int ajaxentityEntityDeleteDo(EntityList entityUpdate) {
	int result = entityDao.ajaxentityEntityDeleteDo(entityUpdate);		
	return result;		
	}	
public int ajaxentityEntityInsertDo(EntityList environment) {			
	 int result = entityDao.ajaxentityEntityInsertDo(environment);		
	return result;		
}
 
public EntityList ajaxenvEntitySelectOneBeforUpdate(String entity_id) {
	// TODO Auto-generated method stub
	return entityDao.ajaxenvEntitySelectOneBeforUpdate(entity_id);	 
}			
			
			



 						
}							
							
							
							
