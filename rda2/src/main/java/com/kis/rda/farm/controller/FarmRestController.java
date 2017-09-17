package com.kis.rda.farm.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kis.rda.farm.domain.Farm;
import com.kis.rda.farm.service.FarmService;


@RestController
public class FarmRestController {
	
	@Autowired
	private FarmService farmService;

	//목장자료 - 기존 목장 추가
	@RequestMapping(value = "/farmAdd", method = RequestMethod.POST)
	public int farmAddCtrl(Farm farm) {
		int result = farmService.insertFarmServ(farm);
		return result;
	}
	
	//목장자료 - 기존 목장 수정
	@RequestMapping(value = "/farmUpdate", method = RequestMethod.POST)
	public int farmUpdateCtrl(Farm farm) {
		int result = farmService.updateFarmServ(farm);
		return result;
	}
	
	//목장자료 - 기존 목장 삭제
	@RequestMapping(value = "/farmDelete", method = RequestMethod.POST)
	public int farmDeleteCtrl(
			@RequestParam(value="farmId") String farmId) {
		int result = farmService.deleteFarmServ(farmId);
		return result;
	}
	 
 	
	//======목장자료 - 기존 목장 LIST
		@RequestMapping(value = "/ajax/farmList", method = RequestMethod.POST)
		public Map<String,Object> ajaxfarmListCtrl(Model model,
				@RequestParam(value="pageNum", defaultValue="1") int pageNum,
				@RequestParam(value="searchOption", defaultValue="none") String searchOption,
				@RequestParam(value="searchValue", defaultValue="none") String searchValue) {
			Map<String, Object> map = farmService.selectFarmListServ(pageNum, searchOption, searchValue);
//			model.addAttribute("farmList", map.get("farmList"));
//			model.addAttribute("totalCount", map.get("totalCount"));
//			model.addAttribute("paging", map.get("paging"));
//			model.addAttribute("searchOption", searchOption);
//			model.addAttribute("searchValue", searchValue);
			
		
		return map;
		}

		//목장자료 - 신규목장 LIST
		@RequestMapping(value = "/ajax/newFarmList", method = RequestMethod.POST)
		public Map<String,Object> ajaxnewFarmListCtrl(Model model,
				@RequestParam(value="cateNum", defaultValue="1") int cateNum,
				@RequestParam(value="pageNum", defaultValue="1") int pageNum,
				@RequestParam(value="searchOption", defaultValue="none") String searchOption,
				@RequestParam(value="searchValue", defaultValue="none") String searchValue) {
			Map<String, Object> map = farmService.selectNewFarmListServ(pageNum, searchOption, searchValue);
//			model.addAttribute("farmList", map.get("farmList"));
//			model.addAttribute("totalCount", map.get("totalCount"));
//			model.addAttribute("paging", map.get("paging"));
//			model.addAttribute("cateNum", cateNum);
//			model.addAttribute("searchOption", searchOption);
//			model.addAttribute("searchValue", searchValue);
			return map;
		}
		
	
}
