package com.kis.rda.farm.dao;		
		
import java.util.List;		
import java.util.Map;		
		
import org.mybatis.spring.SqlSessionTemplate;		
import org.springframework.beans.factory.annotation.Autowired;		
import org.springframework.stereotype.Repository;

import com.kis.rda.common.domain.TbSensetime;
import com.kis.rda.farm.domain.Cbcentity;
import com.kis.rda.farm.domain.Farm;		
import com.kis.rda.farm.domain.NewFarm;
import com.kis.rda.farm.domain.TbSenseCount;
import com.kis.rda.farm.domain.TbSenseEntityList;
import com.kis.rda.farm.domain.TbSenseEntityListDetail;
import com.kis.rda.farm.domain.TbsenseStableList;		
		
@Repository		
public class SenseDao {		
		
@Autowired		
private SqlSessionTemplate sqlSession;		
		
		
	public int selectSenseCount(Map<String, Object> map){	
		return sqlSession.selectOne("SenseDao.selectFarmCount", map);
	}	
public List<Farm> selectSenseList(Map<String, Object> map){		
	return sqlSession.selectList("SenseDao.selectFarmList", map);	
	}
public List<TbSenseCount> ajaxsenseCountList() {
	 
	return sqlSession.selectList("SenseDao.ajaxsenseCountList");	
}
public List<TbSenseEntityList> ajaxsenseEntityList() {
	return sqlSession.selectList("SenseDao.ajaxsenseEntityList");	
}
public List<TbsenseStableList> ajaxsenseStableList() {
	return sqlSession.selectList("SenseDao.ajaxsenseStableList");	
}
public List<TbSenseEntityListDetail> ajaxsenseEntityListDetail(TbSenseEntityListDetail entityDetail) {
	return sqlSession.selectList("SenseDao.ajaxsenseEntityListDetail", entityDetail);	
}
public List<TbsenseStableList> ajaxsenseStableListDetail(TbsenseStableList entityDetail) {
	return sqlSession.selectList("SenseDao.ajaxsenseStableListDetail", entityDetail);	
}
}		
		
		
