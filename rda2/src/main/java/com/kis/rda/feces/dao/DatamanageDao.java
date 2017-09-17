package com.kis.rda.feces.dao;		
		
import java.util.List;		
import java.util.Map;		
		
import org.mybatis.spring.SqlSessionTemplate;		
import org.springframework.beans.factory.annotation.Autowired;		
import org.springframework.stereotype.Repository;		
		
import com.kis.rda.farm.domain.Farm;		
import com.kis.rda.farm.domain.NewFarm;
import com.kis.rda.feces.domain.Feces;		
		
@Repository		
public class DatamanageDao {		
		
@Autowired		
private SqlSessionTemplate sqlSession;		
		
		
	public int selectDatamanageCount(Map<String, Object> map){	
		return sqlSession.selectOne("DatamanageDao.selectFarmCount", map);
	}	
public List<Feces> selectDatamanageList(Map<String, Object> map){		
	return sqlSession.selectList("DatamanageDao.selectFarmList", map);	
	}	
}		
		
		
