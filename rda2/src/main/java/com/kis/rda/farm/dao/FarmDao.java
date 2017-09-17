package com.kis.rda.farm.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kis.rda.farm.domain.Farm;
import com.kis.rda.farm.domain.NewFarm;

@Repository
public class FarmDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//목장자료 - 기존 목장 COUNT
	public int selectFarmCount(Map<String, Object> map){
		return sqlSession.selectOne("FarmDao.selectFarmCount", map);
	}
	//목장자료 - 기존 목장 LIST
	public List<Farm> selectFarmList(Map<String, Object> map){
		return sqlSession.selectList("FarmDao.selectFarmList", map);
	}
	//목장자료 - 기존 목장 EXCEL LIST
	public List<Farm> selectFarmExcel(){
		return sqlSession.selectList("FarmDao.selectFarmExcel");
	}
	
	//목장 추가를 위한 ID값 SELECT
	public int selectFarmNewId(){
		return sqlSession.selectOne("FarmDao.selectFarmNewId");
	}
	
	//목장 추가
	public int insertFarm(Farm farm){
		return sqlSession.insert("FarmDao.insertFarm", farm);
	}
	
	//목장자료 - 기존 목장 DETAIL
	public Farm selectFarmDetail(String farmId) {
		return sqlSession.selectOne("FarmDao.selectFarmDetail", farmId);
	}
	
	//목장자료 - 기존 목장 UPDATE
	public int updateFarm(Farm farm){
		return sqlSession.insert("FarmDao.updateFarm", farm);
	}
	
	//목장자료 - 기존 목장 DELETE
	public int deleteFarm(String farmId){
		return sqlSession.insert("FarmDao.deleteFarm", farmId);
	}
	
	
	//목장자료 - 신규 목장 COUNT
	public int selectNewFarmCount(Map<String, Object> map){
		return sqlSession.selectOne("FarmDao.selectNewFarmCount", map);
	}
	//목장자료 - 신규 목장 LIST
	public List<NewFarm> selectNewFarmList(Map<String, Object> map){
		return sqlSession.selectList("FarmDao.selectNewFarmList", map);
	}
	//목장자료 - 신규 목장 EXCEL LIST
	public List<NewFarm> selectNewFarmExcel(){
		return sqlSession.selectList("FarmDao.selectNewFarmExcel");
	}
}
