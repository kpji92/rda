package com.kis.rda.farm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kis.rda.farm.dao.FarmDao;
import com.kis.rda.farm.domain.Farm;
import com.kis.rda.farm.domain.NewFarm;
import com.kis.rda.util.Paging;
import com.kis.rda.util.UtilPaging;

@Service
public class FarmService {

	@Autowired
	private FarmDao farmDao;
	
	//목장자료 - 기존목장 LIST
	public Map<String, Object> selectFarmListServ(int pageNum, String searchOption, String searchValue){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("searchValue", searchValue);
		int totalCount = farmDao.selectFarmCount(map);
		UtilPaging utilPaging = new UtilPaging();
		Paging paging = utilPaging.pagingMethod(pageNum, totalCount);
		map.put("beginRow", paging.getBeginRow());
		map.put("endRow", paging.getEndRow());
		List<Farm> farmList = farmDao.selectFarmList(map);
		map.put("farmList", farmList);
		map.put("totalCount", totalCount);
		map.put("paging", paging);
		return map;
	}
	
	//목장자료 - 기존목장 EXCEL LIST
	public List<Farm> selectFarmExcelServ(){
		return farmDao.selectFarmExcel();
	}
	
	//목장 추가를 위한 ID값 SELECT
	public String selectFarmNewIdServ(){
		String newId = "";
		int id = farmDao.selectFarmNewId();
		String parseId = Integer.toString(id);		
		if(id < 10){
			newId = "00" + parseId;
		}else if(id >= 10 && id <100){
			newId = "0" + parseId;
		}else{
			newId = parseId;
		}
		return newId;
	}
	
	//목장 추가
	public int insertFarmServ(Farm farm) {
		return farmDao.insertFarm(farm);
	}
	
	//목장자료 - 기존 목장 DETAIL
	public Farm selectFarmDetailServ(String farmId) {
		return farmDao.selectFarmDetail(farmId);
	}
	
	//목장자료 - 기존 목장 UPDATE
	public int updateFarmServ(Farm farm) {
		return farmDao.updateFarm(farm);
	}
	
	//목장자료 - 기존 목장 DELETE
	public int deleteFarmServ(String farmId) {
		return farmDao.deleteFarm(farmId);
	}
	
	//목장자료 - 신규목장 LIST
	public Map<String, Object> selectNewFarmListServ(int pageNum, String searchOption, String searchValue){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("searchValue", searchValue);
		int totalCount = farmDao.selectNewFarmCount(map);
		UtilPaging utilPaging = new UtilPaging();
		Paging paging = utilPaging.pagingMethod(pageNum, totalCount);
		map.put("beginRow", paging.getBeginRow());
		map.put("endRow", paging.getEndRow());
		List<NewFarm> farmList = farmDao.selectNewFarmList(map);
		map.put("farmList", farmList);
		map.put("totalCount", totalCount);
		map.put("paging", paging);
		return map;
	}
	//목장자료 - 신규목장 EXCEL LIST
	public List<NewFarm> selectNewFarmExcelServ(){
		return farmDao.selectNewFarmExcel();
	}
}
