package com.kis.rda.farm.service;							
import java.util.HashMap;							
import java.util.List;							
import java.util.Map;							
							
import org.springframework.beans.factory.annotation.Autowired;							
import org.springframework.stereotype.Service;

import com.kis.rda.common.domain.Environment;
import com.kis.rda.farm.dao.EnvDao;
import com.kis.rda.farm.domain.EnvUpdate;
import com.kis.rda.farm.domain.Farm;							
import com.kis.rda.farm.domain.NewFarm;							
import com.kis.rda.util.Paging;							
import com.kis.rda.util.UtilPaging;							
							
@Service							
public class EnvService {							
							
							
							
@Autowired							
private EnvDao envDao;							
public Map<String, Object> selectFarmListServ(int pageNum, String searchOption, String searchValue){							
	Map<String, Object> map = new HashMap<String, Object>();						
	map.put("searchOption", searchOption);						
	map.put("searchValue", searchValue);						
	int totalCount = envDao.selectEnvCount(map);						
	UtilPaging utilPaging = new UtilPaging();						
	Paging paging = utilPaging.pagingMethod(pageNum, totalCount);						
	map.put("beginRow", paging.getBeginRow());						
	map.put("endRow", paging.getEndRow());						
	List<Farm> envList = envDao.selectEnvList(map);						
	map.put("envList",envList);						
	map.put("totalCount", totalCount);						
	map.put("paging", paging);						
	return map;						
}

public Map<String, Object> ajaxenvEntityList(String farmId) {
	Map<String, Object> map = new HashMap<String, Object>();		
	map.put("farmId", farmId);	
	 
	List<Environment> envList = envDao.ajaxenvEntityList(map);
	//System.out.println("목장 tostring    11"+envList.get(0).getTest_env_g());
	 
	//System.out.println("목장 tostring    11"+envList.get(0).getINPUTDATE());
	//System.out.println("목장 tostring   "+envList.toString());
	
	map.put("envList",envList);	
 
 

	return map;
}

public String envEntityUpdateSelectOne(String farmId) {
	Map<String, Object> map = new HashMap<String, Object>();		
	map.put("farmId", farmId);	
	String farmNm =     envDao.envEntityUpdateSelectOne(farmId);
	return farmNm;
}

public int ajaxenvEntityUpdateDo(Environment environment) {
 
	 int result =  envDao.ajaxenvEntityUpdateDo(environment);
	return result;
}

public int ajaxenvEntityDeleteDo(EnvUpdate environment) {
	int result =  envDao.ajaxenvEntityDeleteDo(environment);
	return result;
}

public int ajaxenvEntityInsertDo(EnvUpdate environment) {
	int result =  envDao.ajaxenvEntityInsertDo(environment);
	return result;
}
 
}							
							
							
							
							
