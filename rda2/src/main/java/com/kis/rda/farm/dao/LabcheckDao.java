package com.kis.rda.farm.dao;		
		
import java.util.List;		
import java.util.Map;		
		
import org.mybatis.spring.SqlSessionTemplate;		
import org.springframework.beans.factory.annotation.Autowired;		
import org.springframework.stereotype.Repository;

import com.kis.rda.farm.domain.Biochemicalentity;
import com.kis.rda.farm.domain.Cbcentity;
import com.kis.rda.farm.domain.EntityList;
import com.kis.rda.farm.domain.Farm;
import com.kis.rda.farm.domain.Immuneentity;
import com.kis.rda.farm.domain.Infectionentity;
import com.kis.rda.farm.domain.Istatentity;
import com.kis.rda.farm.domain.MhListDetail;
import com.kis.rda.farm.domain.NewFarm;
import com.kis.rda.farm.domain.Phosentity;		
		
@Repository		
public class LabcheckDao {		
		
@Autowired		
private SqlSessionTemplate sqlSession;		
		
		
	public int selectLabcheckCount(Map<String, Object> map){	
		return sqlSession.selectOne("LabcheckDao.selectFarmCount", map);
	}	
public List<Farm> selectLabcheckList(Map<String, Object> map){		
	return sqlSession.selectList("LabcheckDao.selectFarmList", map);	
	}
public List<EntityList> ajaxcbcEntityListDetail(Cbcentity entityDetail) {
	System.out.println("===================farmId=의 맵값=========== dao수정=="+entityDetail.getENTITY_ID());	
	String birEntityID = entityDetail.getENTITY_ID();
	return sqlSession.selectList("LabcheckDao.ajaxcbcEntityListDetail", entityDetail);	
}
public List<EntityList> ajaxbiochemicalEntityListDetail(Biochemicalentity entityDetail) {
	System.out.println("===================farmId=의 맵값=========== dao수정=="+entityDetail.getENTITY_ID());	
	String birEntityID = entityDetail.getENTITY_ID();
	return sqlSession.selectList("LabcheckDao.ajaxbiochemicalEntityListDetail", entityDetail);	
}
public List<EntityList> ajaxphosEntityListDetail(Phosentity entityDetail) {
	System.out.println("===================farmId=의 맵값=========== dao수정=="+entityDetail.getENTITY_ID());	
	String birEntityID = entityDetail.getENTITY_ID();
	return sqlSession.selectList("LabcheckDao.ajaxphosEntityListDetail", entityDetail);	
}
public List<EntityList> ajaxistatEntityListDetail(Istatentity entityDetail) {
	System.out.println("===================farmId=의 맵값=========== dao수정=="+entityDetail.getENTITY_ID());	
	String birEntityID = entityDetail.getENTITY_ID();
	return sqlSession.selectList("LabcheckDao.ajaxistatEntityListDetail", entityDetail);	
}
public List<EntityList> ajaximmuneEntityListDetail(Immuneentity entityDetail) {
	System.out.println("===================farmId=의 맵값=========== dao수정=="+entityDetail.getENTITY_ID());	
	String birEntityID = entityDetail.getENTITY_ID();
	return sqlSession.selectList("LabcheckDao.ajaximmuneEntityListDetail", entityDetail);	
}
public List<EntityList> ajaxinfectionEntityListDetail(Infectionentity entityDetail) {
	System.out.println("===================farmId=의 맵값=========== dao수정=="+entityDetail.getENTITY_ID());	
	String birEntityID = entityDetail.getENTITY_ID();
	return sqlSession.selectList("LabcheckDao.ajaxinfectionEntityListDetail", entityDetail);	
}

// 수정전 개체 값가져오는것==============================================================
public Cbcentity cbcEntitySelectOneBeforeUpdate(String entity_id) {
	
	
	return sqlSession.selectOne("LabcheckDao.cbcEntitySelectOneBeforeUpdate",entity_id);	
}
public Biochemicalentity biochemicalEntitySelectOneBeforeUpdate(String entity_id) {
	return sqlSession.selectOne("LabcheckDao.biochemicalEntitySelectOneBeforeUpdate",entity_id);	
}
public Phosentity phosEntitySelectOneBeforeUpdate(String entity_id) {
	return sqlSession.selectOne("LabcheckDao.phosEntitySelectOneBeforeUpdate",entity_id);	
}
public Istatentity istatEntitySelectOneBeforeUpdate(String entity_id) {
	return sqlSession.selectOne("LabcheckDao.istatEntitySelectOneBeforeUpdate",entity_id);	
}
public Immuneentity immuneEntitySelectOneBeforeUpdate(String entity_id) {
	return sqlSession.selectOne("LabcheckDao.immuneEntitySelectOneBeforeUpdate",entity_id);	
}
public Infectionentity infectionEntitySelectOneBeforeUpdate(String entity_id) {
	return sqlSession.selectOne("LabcheckDao.infectionEntitySelectOneBeforeUpdate",entity_id);	
}
//입력 수정 삭제 ========================================================
public int ajaxcbcEntityInsertDo(Cbcentity entityInsert) {
	System.out.println("===================ajaxcbcEntityInsertDo= dao ==" );	
	return sqlSession.insert("LabcheckDao.ajaxcbcEntityInsertDo",entityInsert);		
}

public int ajaxcbcEntityUpdateDo(Cbcentity entityUpdate) {
	System.out.println("===================farmId=의 맵값=========== 수정==");	
	return sqlSession.update("LabcheckDao.ajaxcbcEntityUpdateDo",entityUpdate);		
}
public int ajaxcbcEntityDeleteDo(Cbcentity environment) {
	return sqlSession.delete("LabcheckDao.ajaxcbcEntityDeleteDo",environment);		
	}		
public int ajaxbiochemicalEntityInsertDo(Biochemicalentity entityInsert) {
	return sqlSession.insert("LabcheckDao.ajaxbiochemicalEntityInsertDo",entityInsert);		
	}
 
public int ajaxbiochemicalEntityUpdateDo(Biochemicalentity entityUpdate) {
	System.out.println("===================farmId=의 맵값=========== 수정==");	
	return sqlSession.update("LabcheckDao.ajaxbiochemicalEntityUpdateDo",entityUpdate);		
}
public int ajaxbiochemicalEntityDeleteDo(Biochemicalentity environment) {
	return sqlSession.delete("LabcheckDao.ajaxbiochemicalEntityDeleteDo",environment);		
	}		
public int ajaxphosEntityInsertDo(Phosentity entityInsert) {
	return sqlSession.insert("LabcheckDao.ajaxphosEntityInsertDo",entityInsert);		
	}
 
public int ajaxphosEntityUpdateDo(Phosentity entityUpdate) {
	System.out.println("===================farmId=의 맵값=========== 수정==");	
	return sqlSession.update("LabcheckDao.ajaxphosEntityUpdateDo",entityUpdate);		
}
public int ajaxphosEntityDeleteDo(Phosentity environment) {
	return sqlSession.delete("LabcheckDao.ajaxphosEntityDeleteDo",environment);		
	}		
public int ajaxistatEntityInsertDo(Istatentity entityInsert) {
	return sqlSession.insert("LabcheckDao.ajaxistatEntityInsertDo",entityInsert);		
	}
 
public int ajaxistatEntityUpdateDo(Istatentity entityUpdate) {
	System.out.println("===================farmId=의 맵값=========== 수정==");	
	return sqlSession.update("LabcheckDao.ajaxistatEntityUpdateDo",entityUpdate);		
}
public int ajaxistatEntityDeleteDo(Istatentity environment) {
	return sqlSession.delete("LabcheckDao.ajaxistatEntityDeleteDo",environment);		
	}		
public int ajaximmuneEntityInsertDo(Immuneentity entityInsert) {
	return sqlSession.insert("LabcheckDao.ajaximmuneEntityInsertDo",entityInsert);		
	}
 
public int ajaximmuneEntityUpdateDo(Immuneentity entityUpdate) {
	System.out.println("===================farmId=의 맵값=========== 수정==");	
	return sqlSession.update("LabcheckDao.ajaximmuneEntityUpdateDo",entityUpdate);		
}
public int ajaximmuneEntityDeleteDo(Immuneentity environment) {
	return sqlSession.delete("LabcheckDao.ajaximmuneEntityDeleteDo",environment);		
	}		
public int ajaxinfectionEntityInsertDo(Infectionentity entityInsert) {
	return sqlSession.insert("LabcheckDao.ajaxinfectionEntityInsertDo",entityInsert);		
	}
 
public int ajaxinfectionEntityUpdateDo(Infectionentity entityUpdate) {
	System.out.println("===================farmId=의 맵값=========== 수정==");	
	return sqlSession.update("LabcheckDao.ajaxinfectionEntityUpdateDo",entityUpdate);		
}
public int ajaxinfectionEntityDeleteDo(Infectionentity environment) {
	return sqlSession.delete("LabcheckDao.ajaxinfectionEntityDeleteDo",environment);		
	}		
}		
		
		
