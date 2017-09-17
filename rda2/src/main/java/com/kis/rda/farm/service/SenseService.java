package com.kis.rda.farm.service;							
import java.util.HashMap;							
import java.util.List;							
import java.util.Map;							
							
import org.springframework.beans.factory.annotation.Autowired;							
import org.springframework.stereotype.Service;

import com.kis.rda.common.domain.TbSensetime;
import com.kis.rda.farm.dao.SenseDao;
import com.kis.rda.farm.domain.Cbcentity;
import com.kis.rda.farm.domain.EntityList;
import com.kis.rda.farm.domain.Farm;							
import com.kis.rda.farm.domain.NewFarm;
import com.kis.rda.farm.domain.TbSenseCount;
import com.kis.rda.farm.domain.TbSenseEntityList;
import com.kis.rda.farm.domain.TbSenseEntityListDetail;
import com.kis.rda.farm.domain.TbsenseStableList;
import com.kis.rda.util.Paging;							
import com.kis.rda.util.UtilPaging;							
							
@Service							
public class SenseService {							
							
							
							
@Autowired							
private SenseDao senseDao;							
public Map<String, Object> selectFarmListServ(int pageNum, String searchOption, String searchValue){							
	Map<String, Object> map = new HashMap<String, Object>();						
	map.put("searchOption", searchOption);						
	map.put("searchValue", searchValue);						
	int totalCount = senseDao.selectSenseCount(map);						
	UtilPaging utilPaging = new UtilPaging();						
	Paging paging = utilPaging.pagingMethod(pageNum, totalCount);						
	map.put("beginRow", paging.getBeginRow());						
	map.put("endRow", paging.getEndRow());						
	List<Farm> senseList = senseDao.selectSenseList(map);						
	map.put("senseList",senseList);						
	map.put("totalCount", totalCount);						
	map.put("paging", paging);						
	return map;						
}
public Map<String, Object> ajaxsenseCountList() {
	Map<String, Object> map = new HashMap<String, Object>();		
	List<TbSenseCount> ajaxList = senseDao.ajaxsenseCountList();		
	map.put("ajaxList",ajaxList);		
	return map;
}
public Map<String, Object> ajaxsenseEntityList() {
	Map<String, Object> map = new HashMap<String, Object>();		
	List<TbSenseEntityList> ajaxList = senseDao.ajaxsenseEntityList();		
	map.put("ajaxList",ajaxList);		
	return map;
}
public Map<String, Object> ajaxsenseStableList() {
	Map<String, Object> map = new HashMap<String, Object>();		
	List<TbsenseStableList> ajaxList = senseDao.ajaxsenseStableList();		
	map.put("ajaxList",ajaxList);		
	return map;
}
public Map<String, Object> ajaxsenseEntityListDetail(TbSenseEntityListDetail entityDetail) {
	Map<String, Object> map = new HashMap<String, Object>();		
	System.out.println("목장getSENSENODEID"+ entityDetail.getNODEID());		
	List<TbSenseEntityListDetail> ajaxList = senseDao.ajaxsenseEntityListDetail(entityDetail);		
	map.put("ajaxList",ajaxList);		
	return map;
}
public Map<String, Object> ajaxsenseStableListDetail(TbsenseStableList entityDetail) {
	Map<String, Object> map = new HashMap<String, Object>();	
	System.out.println("목장getSENSENODEID"+ entityDetail.getSENSENODEID());		
	List<TbsenseStableList> ajaxList = senseDao.ajaxsenseStableListDetail(entityDetail);		
	map.put("ajaxList",ajaxList);		
	return map;				
}							
}						
