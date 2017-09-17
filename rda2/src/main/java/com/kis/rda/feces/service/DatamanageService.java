package com.kis.rda.feces.service;							
import java.util.HashMap;							
import java.util.List;							
import java.util.Map;							
							
import org.springframework.beans.factory.annotation.Autowired;							
import org.springframework.stereotype.Service;							
							
import com.kis.rda.feces.dao.DatamanageDao;
import com.kis.rda.feces.domain.Feces;
import com.kis.rda.farm.domain.Farm;							
import com.kis.rda.farm.domain.NewFarm;							
import com.kis.rda.util.Paging;							
import com.kis.rda.util.UtilPaging;							
							
@Service							
public class DatamanageService {							
							
							
							
@Autowired							
private DatamanageDao datamanageDao;							
public Map<String, Object> selectFarmListServ(int pageNum, String searchOption, String searchValue){							
	Map<String, Object> map = new HashMap<String, Object>();						
	map.put("searchOption", searchOption);						
	map.put("searchValue", searchValue);						
	int totalCount = datamanageDao.selectDatamanageCount(map);						
	UtilPaging utilPaging = new UtilPaging();						
	Paging paging = utilPaging.pagingMethod(pageNum, totalCount);						
	map.put("beginRow", paging.getBeginRow());						
	map.put("endRow", paging.getEndRow());						
	List<Feces> datamanageList = datamanageDao.selectDatamanageList(map);						
	map.put("datamanageList",datamanageList);						
	map.put("totalCount", totalCount);						
	map.put("paging", paging);						
	return map;						
}							
}							
							
