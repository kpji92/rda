package com.kis.rda.farm.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kis.rda.farm.domain.Farm;
import com.kis.rda.farm.service.FarmService;


@Controller
public class FarmController {
	
	@Autowired
	private FarmService farmService;
	
	//목장자료 - 기존 목장 LIST
	@RequestMapping(value = "/farmList_old", method = RequestMethod.GET)
	public String farmListCtrl_old(Model model,
			@RequestParam(value="pageNum", defaultValue="1") int pageNum,
			@RequestParam(value="searchOption", defaultValue="none") String searchOption,
			@RequestParam(value="searchValue", defaultValue="none") String searchValue) {
		Map<String, Object> map = farmService.selectFarmListServ(pageNum, searchOption, searchValue);
		model.addAttribute("farmList", map.get("farmList"));
		model.addAttribute("totalCount", map.get("totalCount"));
		model.addAttribute("paging", map.get("paging"));
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("searchValue", searchValue);
		return "data_management/farm/farm_list";
	}
	
	
	//목장자료 - 기존 목장 LIST
		@RequestMapping(value = "/farmList", method = RequestMethod.GET)
		public String farmListCtrl(Model model,
				@RequestParam(value="pageNum", defaultValue="1") int pageNum,
				@RequestParam(value="searchOption", defaultValue="none") String searchOption,
				@RequestParam(value="searchValue", defaultValue="none") String searchValue) {
//			Map<String, Object> map = farmService.selectFarmListServ(pageNum, searchOption, searchValue);
//			model.addAttribute("farmList", map.get("farmList"));
//			model.addAttribute("totalCount", map.get("totalCount"));
//			model.addAttribute("paging", map.get("paging"));
//			model.addAttribute("searchOption", searchOption);
//			model.addAttribute("searchValue", searchValue);
			return "data_management/farm/farm_list";
		}
		
	
	
	
	//목장자료 - 기존 목장 추가 FORM
	@RequestMapping(value = "/farmAdd", method = RequestMethod.GET)
	public String farmAddFormCtrl(Model model) {
		String newId = farmService.selectFarmNewIdServ();
		model.addAttribute("newId", newId);
		return "data_management/farm/farm_input";
	}
	
	//목장자료 - 기존 목장 수정 FORM
	@RequestMapping(value = "/farmUpdate", method = RequestMethod.GET)
	public String farmUpdateFormCtrl(Model model,
			@RequestParam(value="farmId") String farmId) {
		Farm farm = farmService.selectFarmDetailServ(farmId);
		model.addAttribute("farm", farm);
		return "data_management/farm/farm_update";
	}
	
	//목장자료 - 신규목장 LIST
	@RequestMapping(value = "/newFarmList_old", method = RequestMethod.GET)
	public String newFarmListCtrl_old(Model model,
			@RequestParam(value="cateNum", defaultValue="1") int cateNum,
			@RequestParam(value="pageNum", defaultValue="1") int pageNum,
			@RequestParam(value="searchOption", defaultValue="none") String searchOption,
			@RequestParam(value="searchValue", defaultValue="none") String searchValue) {
		Map<String, Object> map = farmService.selectNewFarmListServ(pageNum, searchOption, searchValue);
		model.addAttribute("farmList", map.get("farmList"));
		model.addAttribute("totalCount", map.get("totalCount"));
		model.addAttribute("paging", map.get("paging"));
		model.addAttribute("cateNum", cateNum);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("searchValue", searchValue);
		return "data_management/new_farm/new_farm_list";
	}

	//목장자료 - 신규목장 LIST
	@RequestMapping(value = "/newFarmList", method = RequestMethod.GET)
	public String newFarmListCtrl(Model model,
			@RequestParam(value="cateNum", defaultValue="1") int cateNum,
			@RequestParam(value="pageNum", defaultValue="1") int pageNum,
			@RequestParam(value="searchOption", defaultValue="none") String searchOption,
			@RequestParam(value="searchValue", defaultValue="none") String searchValue) {
		 
		return "data_management/new_farm/new_farm_list";
	}
	
	
	//목장자료 - 신규 목장 추가 FORM
	@RequestMapping(value = "/newFarmAdd", method = RequestMethod.GET)
	public String newFarmAddFormCtrl(Model model) {
		/*String newId = farmService.selectFarmNewIdServ();
		model.addAttribute("newId", newId);*/
		return "data_management/new_farm/new_farm_input";
	}
}
