package com.kis.rda.farm.service;							
import java.util.HashMap;							
import java.util.List;							
import java.util.Map;							
							
import org.springframework.beans.factory.annotation.Autowired;							
import org.springframework.stereotype.Service;							
							
import com.kis.rda.farm.dao.BirDao;
import com.kis.rda.farm.domain.BirUpdate;
import com.kis.rda.farm.domain.EntityList;
import com.kis.rda.farm.domain.Farm;							
import com.kis.rda.farm.domain.NewFarm;							
import com.kis.rda.util.Paging;							
import com.kis.rda.util.UtilPaging;							
							
@Service							
public class BirService {							
							
							
							
@Autowired							
private BirDao birDao;							
public Map<String, Object> selectFarmListServ(int pageNum, String searchOption, String searchValue){							
	Map<String, Object> map = new HashMap<String, Object>();						
	map.put("searchOption", searchOption);						
	map.put("searchValue", searchValue);						
	int totalCount = birDao.selectBirCount(map);						
	UtilPaging utilPaging = new UtilPaging();						
	Paging paging = utilPaging.pagingMethod(pageNum, totalCount);						
	map.put("beginRow", paging.getBeginRow());						
	map.put("endRow", paging.getEndRow());						
	List<Farm> birList = birDao.selectBirList(map);						
	map.put("birList",birList);						
	map.put("totalCount", totalCount);						
	map.put("paging", paging);						
	return map;						
}		
//public Map<String, Object>ajaxbirEntityList(EntityList entityEntityList) {			
//	Map<String, Object> map = new HashMap<String, Object>();		
//	List<EntityList> ajaxentityEntityList = entityDao.ajaxentityEntityList(entityEntityList);		
//	map.put("entityList",ajaxentityEntityList);		
//	return map;		
//}			
			


public String birEntityUpdateSelectOne(String farmId) {			
	Map<String, Object> map = new HashMap<String, Object>();		
	map.put("farmId", farmId);		
	String farmNm =    birDao.birEntityUpdateSelectOne(farmId);		
	return farmNm;		
}			
			
//public int ajaxbirEntityUpdatetDo(Environment environment) {			
// 			
//	 int result = birDao.ajaxbirEntityUpdatetDo(environment);		
//	return result;		
//}			
			
//public int ajaxbirEntityDeleteDo(EnvUpdate environment) {			
//	 int result = birDao.ajaxbirEntityDeleteDo(environment);		
//	return result;		
//}			
//			
//public int ajaxbirEntityInsertDo(EnvUpdate environment) {			
//	 int result = birDao.ajaxbirEntityInsertDo(environment);		
//	return result;		
//}
public int ajaxbirEntityInsertDo(BirUpdate entityInsert) {
 	 int result = birDao.ajaxbirEntityInsertDo(entityInsert);		
 	return result;	
}		
			


public Map<String, Object> ajaxbirEntityList(EntityList entityEntityList) {
	Map<String, Object> map = new HashMap<String, Object>();		
	List<EntityList> ajaxentityEntityList = birDao.ajaxentityEntityList(entityEntityList);		
	map.put("entityList",ajaxentityEntityList);		
	return map;
}



public Map<String, Object> birEntitySelectOneBeforeUpdate(String entity_id) {
	return birDao.birEntitySelectOneBeforeUpdate(entity_id);	 
}



public int ajaxbirEntityUpdatetDo(BirUpdate entityUpdate) {
	 int result = birDao.ajaxbirEntityUpdatetDo(entityUpdate);		
	return result;		
}



public int ajaxbirEntityDeleteDo(BirUpdate environment) {
	 int result = birDao.ajaxbirEntityDeleteDo(environment);		
 	return result;		
}



public Map<String, Object> ajaxbirEntityListDetail(BirUpdate entityDetail) {
	Map<String, Object> map = new HashMap<String, Object>();		
	List<EntityList> ajaxentityEntityList = birDao.ajaxbirEntityListDetail(entityDetail);		
	map.put("entityList",ajaxentityEntityList);		
	return map;
}



public String birEntityInsertSelectOne(String farmId) {
	String farmNm =    birDao.birEntityInsertSelectOne(farmId);		
	return farmNm;		
}



 

	
 			
			
			
			
			
			
			

}							
							
							
							
