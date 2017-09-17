package com.kis.rda;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kis.rda.farm.service.FarmService;

@Controller
public class HomeController {

	@Autowired
	private FarmService farmService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model,
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
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Model model,
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
	
	@RequestMapping(value = "/test2", method = RequestMethod.GET)
	public String test2(Model model) {
		return "test/test2";
	}
	@RequestMapping(value = "/test3", method = RequestMethod.GET)
	public String test3(Model model) {
		return "test/test3";
	}
	@RequestMapping(value = "/test4", method = RequestMethod.GET)
	public String test4(Model model) {
		return "test/test4";
	}
	@RequestMapping(value = "/test5", method = RequestMethod.GET)
	public String test5(Model model) {
		return "test/test5";
	}
	@RequestMapping(value = "/test6", method = RequestMethod.GET)
	public String test6(Model model) {
		return "test/test6";
	}
	
}
