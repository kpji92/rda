package com.kis.rda.farm.service;							
import java.util.HashMap;							
import java.util.List;							
import java.util.Map;							
							
import org.springframework.beans.factory.annotation.Autowired;							
import org.springframework.stereotype.Service;							
							
import com.kis.rda.farm.dao.MhDao;
import com.kis.rda.farm.domain.EntityList;
import com.kis.rda.farm.domain.Farm;
import com.kis.rda.farm.domain.MhListDetail;
import com.kis.rda.farm.domain.NewFarm;							
import com.kis.rda.util.Paging;							
import com.kis.rda.util.UtilPaging;							
							
@Service							
public class MhService {							
							
							
							
@Autowired							
private MhDao mhDao;							
public Map<String, Object> selectFarmListServ(int pageNum, String searchOption, String searchValue){							
	Map<String, Object> map = new HashMap<String, Object>();						
	map.put("searchOption", searchOption);						
	map.put("searchValue", searchValue);						
	int totalCount = mhDao.selectMhCount(map);						
	UtilPaging utilPaging = new UtilPaging();						
	Paging paging = utilPaging.pagingMethod(pageNum, totalCount);						
	map.put("beginRow", paging.getBeginRow());						
	map.put("endRow", paging.getEndRow());						
	List<Farm> mhList = mhDao.selectMhList(map);						
	map.put("mhList",mhList);						
	map.put("totalCount", totalCount);						
	map.put("paging", paging);						
	return map;						
}
public Map<String, Object> ajaxmhEntityListDetail(MhListDetail entityDetail) {
	Map<String, Object> map = new HashMap<String, Object>();		
	List<EntityList> ajaxentityDetail = mhDao.ajaxmhEntityListDetail(entityDetail);		
	map.put("entityList",ajaxentityDetail);		
	return map;
}
public String mhEntityInsertSelectOne(String farmId) {
	String farmNm =    mhDao.mhEntityInsertSelectOne(farmId);		
	return farmNm;		
}
public int ajaxmhEntityInsertDo(MhListDetail entityInsert) {
	 int result = mhDao.ajaxmhEntityInsertDo(entityInsert);		
	return result;	
}
public MhListDetail mhEntitySelectOneBeforeUpdate(String entity_id) {
	
	
	
	return mhDao.mhEntitySelectOneBeforeUpdate(entity_id);	 
	}

				
}							
							
