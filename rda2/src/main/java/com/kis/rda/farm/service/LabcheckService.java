package com.kis.rda.farm.service;							
import java.util.HashMap;							
import java.util.List;							
import java.util.Map;							
							
import org.springframework.beans.factory.annotation.Autowired;							
import org.springframework.stereotype.Service;							
							
import com.kis.rda.farm.dao.LabcheckDao;
import com.kis.rda.farm.domain.Biochemicalentity;
import com.kis.rda.farm.domain.BirUpdate;
import com.kis.rda.farm.domain.Cbcentity;
import com.kis.rda.farm.domain.EntityList;
import com.kis.rda.farm.domain.Farm;
import com.kis.rda.farm.domain.Immuneentity;
import com.kis.rda.farm.domain.Infectionentity;
import com.kis.rda.farm.domain.Istatentity;
import com.kis.rda.farm.domain.MhListDetail;
import com.kis.rda.farm.domain.NewFarm;
import com.kis.rda.farm.domain.Phosentity;
import com.kis.rda.util.Paging;							
import com.kis.rda.util.UtilPaging;							
							
@Service							
public class LabcheckService {							
							
							
							
@Autowired							
private LabcheckDao labcheckDao;							
public Map<String, Object> selectFarmListServ(int pageNum, String searchOption, String searchValue){							
	Map<String, Object> map = new HashMap<String, Object>();						
	map.put("searchOption", searchOption);						
	map.put("searchValue", searchValue);						
	int totalCount = labcheckDao.selectLabcheckCount(map);						
	UtilPaging utilPaging = new UtilPaging();						
	Paging paging = utilPaging.pagingMethod(pageNum, totalCount);						
	map.put("beginRow", paging.getBeginRow());						
	map.put("endRow", paging.getEndRow());						
	List<Farm> labcheckList = labcheckDao.selectLabcheckList(map);						
	map.put("labcheckList",labcheckList);						
	map.put("totalCount", totalCount);						
	map.put("paging", paging);						
	return map;						
}
public Map<String, Object> ajaxcbcEntityListDetail(Cbcentity entityDetail) {
	Map<String, Object> map = new HashMap<String, Object>();		
	List<EntityList> ajaxentityDetail = labcheckDao.ajaxcbcEntityListDetail(entityDetail);		
	map.put("entityList",ajaxentityDetail);		
	return map;
}
public Map<String, Object> ajaxbiochemicalEntityListDetail(Biochemicalentity entityDetail) {
	Map<String, Object> map = new HashMap<String, Object>();		
	List<EntityList> ajaxentityDetail = labcheckDao.ajaxbiochemicalEntityListDetail(entityDetail);		
	map.put("entityList",ajaxentityDetail);		
	return map;
}
public Map<String, Object> ajaxphosEntityListDetail(Phosentity entityDetail) {
	Map<String, Object> map = new HashMap<String, Object>();		
	List<EntityList> ajaxentityDetail = labcheckDao.ajaxphosEntityListDetail(entityDetail);		
	map.put("entityList",ajaxentityDetail);		
	return map;
}
public Map<String, Object> ajaxistatEntityListDetail(Istatentity entityDetail) {
	Map<String, Object> map = new HashMap<String, Object>();		
	List<EntityList> ajaxentityDetail = labcheckDao.ajaxistatEntityListDetail(entityDetail);		
	map.put("entityList",ajaxentityDetail);		
	return map;
}
public Map<String, Object> ajaximmuneEntityListDetail(Immuneentity entityDetail) {
	Map<String, Object> map = new HashMap<String, Object>();		
	List<EntityList> ajaxentityDetail = labcheckDao.ajaximmuneEntityListDetail(entityDetail);		
	map.put("entityList",ajaxentityDetail);		
	return map;
}
public Map<String, Object> ajaxinfectionEntityListDetail(Infectionentity entityDetail) {
	Map<String, Object> map = new HashMap<String, Object>();		
	List<EntityList> ajaxentityDetail = labcheckDao.ajaxinfectionEntityListDetail(entityDetail);		
	map.put("entityList",ajaxentityDetail);		
	return map;
}
public Cbcentity cbcEntitySelectOneBeforeUpdate(String entity_id) {
	return labcheckDao.cbcEntitySelectOneBeforeUpdate(entity_id);	 
	}
public Biochemicalentity biochemicalEntitySelectOneBeforeUpdate(String entity_id) {
	return labcheckDao.biochemicalEntitySelectOneBeforeUpdate(entity_id);	 
	}
public Phosentity phosEntitySelectOneBeforeUpdate(String entity_id) {
	return labcheckDao.phosEntitySelectOneBeforeUpdate(entity_id);	 
	}
public Istatentity istatEntitySelectOneBeforeUpdate(String entity_id) {
	return labcheckDao.istatEntitySelectOneBeforeUpdate(entity_id);	 
	}
public Immuneentity  immuneEntitySelectOneBeforeUpdate(String entity_id) {
	return labcheckDao.immuneEntitySelectOneBeforeUpdate(entity_id);	 
	}
public Infectionentity infectionEntitySelectOneBeforeUpdate(String entity_id) {
	return labcheckDao.infectionEntitySelectOneBeforeUpdate(entity_id);	 
	}
public int ajaxcbcEntityInsertDo(Cbcentity entityInsert) {
	 int result = labcheckDao.ajaxcbcEntityInsertDo(entityInsert);		
	return result;	
}		

public int ajaxcbcEntityUpdateDo(Cbcentity entityUpdate) {
	 int result = labcheckDao.ajaxcbcEntityUpdateDo(entityUpdate);		
		return result;		
	}
public int ajaxcbcEntityDeleteDo(Cbcentity environment) {
	 int result = labcheckDao.ajaxcbcEntityDeleteDo(environment);		
	 	return result;		
	}
public int ajaxbiochemicalEntityInsertDo(Biochemicalentity entityInsert) {
	 int result = labcheckDao.ajaxbiochemicalEntityInsertDo(entityInsert);		
	return result;	
}		

public int ajaxbiochemicalEntityUpdateDo(Biochemicalentity entityUpdate) {
	 int result = labcheckDao.ajaxbiochemicalEntityUpdateDo(entityUpdate);		
		return result;		
	}
public int ajaxbiochemicalEntityDeleteDo(Biochemicalentity environment) {
	 int result = labcheckDao.ajaxbiochemicalEntityDeleteDo(environment);		
	 	return result;		
	}
public int ajaxphosEntityInsertDo(Phosentity entityInsert) {
	 int result = labcheckDao.ajaxphosEntityInsertDo(entityInsert);		
	 	return result;	
	}		
		
public int ajaxphosEntityUpdateDo(Phosentity entityUpdate) {
	 int result = labcheckDao.ajaxphosEntityUpdateDo(entityUpdate);		
		return result;		
	}
public int ajaxphosEntityDeleteDo(Phosentity environment) {
	 int result = labcheckDao.ajaxphosEntityDeleteDo(environment);		
	 	return result;		
	}
public int ajaxistatEntityInsertDo(Istatentity entityInsert) {
	 int result = labcheckDao.ajaxistatEntityInsertDo(entityInsert);		
	 	return result;	
	}		
		
public int ajaxistatEntityUpdateDo(Istatentity entityUpdate) {
	 int result = labcheckDao.ajaxistatEntityUpdateDo(entityUpdate);		
		return result;		
	}
public int ajaxistatEntityDeleteDo(Istatentity environment) {
	 int result = labcheckDao.ajaxistatEntityDeleteDo(environment);		
	 	return result;		
	}
public int ajaximmuneEntityInsertDo(Immuneentity entityInsert) {
	 int result = labcheckDao.ajaximmuneEntityInsertDo(entityInsert);		
	 	return result;	
	}		
		
public int ajaximmuneEntityUpdateDo(Immuneentity entityUpdate) {
	 int result = labcheckDao.ajaximmuneEntityUpdateDo(entityUpdate);		
		return result;		
	}
public int ajaximmuneEntityDeleteDo(Immuneentity environment) {
	 int result = labcheckDao.ajaximmuneEntityDeleteDo(environment);		
	 	return result;		
	}
public int ajaxinfectionEntityInsertDo(Infectionentity entityInsert) {
	 int result = labcheckDao.ajaxinfectionEntityInsertDo(entityInsert);		
	 	return result;	
	}		
		
public int ajaxinfectionEntityUpdateDo(Infectionentity entityUpdate) {
	 int result = labcheckDao.ajaxinfectionEntityUpdateDo(entityUpdate);		
		return result;		
	}
public int ajaxinfectionEntityDeleteDo(Infectionentity environment) {
	 int result = labcheckDao.ajaxinfectionEntityDeleteDo(environment);		
	 	return result;		
	}			
}							
							
							
