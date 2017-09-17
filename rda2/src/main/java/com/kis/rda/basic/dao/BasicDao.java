package com.kis.rda.basic.dao;		
		
import java.util.List;		
import java.util.Map;		
		
import org.mybatis.spring.SqlSessionTemplate;		
import org.springframework.beans.factory.annotation.Autowired;		
import org.springframework.stereotype.Repository;

import com.kis.rda.basic.domain.Basic;
import com.kis.rda.farm.domain.Farm;		
import com.kis.rda.farm.domain.NewFarm;
import com.kis.rda.farm.domain.TbSenseEntityList;		
		
@Repository		
public class BasicDao {		
		
@Autowired		
private SqlSessionTemplate sqlSession;		
		
		
	public int selectTemperCount(Map<String, Object> map){	
		return sqlSession.selectOne("BasicDao.selectFarmCount", map);
	}	
public List<Basic> selectTemperList(Map<String, Object> map){		
	return sqlSession.selectList("BasicDao.selectFarmList", map);	
	}
public List<TbSenseEntityList> ajaxbasicEntityList(String sensedevtipe) {
	return sqlSession.selectList("BasicDao.ajaxbasicEntityList",sensedevtipe);	
	}
}		
		
		
		
		
		
		
