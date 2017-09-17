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
				
				
import com.kis.rda.farm.service.LabckPhosService;				
				
@RestController				
public class LabckPhosRestController {				
				
@Autowired				
private LabckPhosService labckphosService;				
@RequestMapping(value = "/ajax/labckphosList", method = RequestMethod.GET)				
public Map<String,Object> ajaxlabckphosListCtrl(Model model,				
	@RequestParam(value="pageNum", defaultValue="1") int pageNum,			
	@RequestParam(value="searchOption", defaultValue="none") String searchOption,			
	@RequestParam(value="searchValue", defaultValue="none") String searchValue) {			
Map<String, Object> map = labckphosService.selectFarmListServ(pageNum, searchOption, searchValue);				
model.addAttribute("farmList", map.get("farmList"));				
model.addAttribute("totalCount", map.get("totalCount"));				
model.addAttribute("paging", map.get("paging"));				
model.addAttribute("searchOption", searchOption);				
model.addAttribute("searchValue", searchValue);				
				
				
return map;				
}				
}				
				
				
