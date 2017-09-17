package com.kis.rda.farm.service;							
import java.util.HashMap;							
import java.util.List;							
import java.util.Map;							
							
import org.springframework.beans.factory.annotation.Autowired;							
import org.springframework.stereotype.Service;							
							
import com.kis.rda.farm.dao.QuDao;							
import com.kis.rda.farm.domain.Farm;							
import com.kis.rda.farm.domain.NewFarm;
import com.kis.rda.farm.domain.QuResearch;
import com.kis.rda.util.Paging;							
import com.kis.rda.util.UtilPaging;							
							
@Service							
public class QuService {							
							
							
							
@Autowired							
private QuDao quDao;							
public Map<String, Object> selectFarmListServ(int pageNum, String searchOption, String searchValue){							
	//검색
	Map<String, Object> map = new HashMap<String, Object>();						
	map.put("searchOption", searchOption);						
	map.put("searchValue", searchValue);						
	//페이징
	int totalCount = quDao.selectQuCount(map);						
	UtilPaging utilPaging = new UtilPaging();						
	Paging paging = utilPaging.pagingMethod(pageNum, totalCount);						
	map.put("beginRow", paging.getBeginRow());						
	map.put("endRow", paging.getEndRow());						
	//리스트
	
	
	List<Farm> quList = quDao.selectQuList(map);						
	map.put("quList",quList);						
	map.put("totalCount", totalCount);						
	map.put("paging", paging);						
	return map;						
}
public int quresearchInput(QuResearch quresearch) {
 
	System.out.println("목장 수정"+quresearch.getQ_DATE1());
	System.out.println("목장 수정"+quresearch.getQ_DATE2());
	System.out.println("목장 수정"+quresearch.getQ_DATE3());
	String qdate1 = quresearch.getQ_DATE1();
	String qdate2 = quresearch.getQ_DATE2();
	String qdate3 = quresearch.getQ_DATE3();
	String q_DATE = qdate1+"년"+qdate2+"월"+qdate3+"일";
	quresearch.setQ_DATE(q_DATE);
	return quDao.quresearchInput(quresearch);
	
}							
}						
