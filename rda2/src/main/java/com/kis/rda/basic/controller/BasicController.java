package com.kis.rda.basic.controller;		
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
		
		
import com.kis.rda.basic.service.BasicService;		
		
		
@Controller		
public class BasicController {		
		
@Autowired		
private BasicService basicService;		
		
		
		
		
		
@RequestMapping(value = "/temperList", method = RequestMethod.GET)		
public String temperList(Model model,		
@RequestParam(value="pageNum", defaultValue="1") int pageNum,		
@RequestParam(value="searchOption", defaultValue="none") String searchOption,		
@RequestParam(value="searchValue", defaultValue="none") String searchValue) {		
Map<String, Object> map = basicService.selectFarmListServ(pageNum, searchOption, searchValue);		
model.addAttribute("farmList", map.get("farmList"));		
model.addAttribute("totalCount", map.get("totalCount"));		
model.addAttribute("paging", map.get("paging"));		
model.addAttribute("searchOption", searchOption);		
model.addAttribute("searchValue", searchValue);		
return "data_management/farm/farm_list";		
	}	

@RequestMapping(value = "/basicTempList", method = RequestMethod.GET)				
public String fecesTempList(Model model,				
@RequestParam(value="pageNum", defaultValue="1") int pageNum,				
@RequestParam(value="searchOption", defaultValue="none") String searchOption,				
@RequestParam(value="searchValue", defaultValue="none") String searchValue) {				
//Map<String, Object> map = senseService.selectFarmListServ(pageNum, searchOption, searchValue);				
//model.addAttribute("farmList", map.get("farmList"));				
//model.addAttribute("totalCount", map.get("totalCount"));				
//model.addAttribute("paging", map.get("paging"));				
 model.addAttribute("searchOption", searchOption);				
 model.addAttribute("searchValue", searchValue);				
return "data_management/basictemp/basictempEntity_list";				
}	


@RequestMapping(value = "/basicTempEntityChart", method = RequestMethod.GET)				
public String basicTempEntityChart(Model model,				
@RequestParam(value="pageNum", defaultValue="1") int pageNum,				
@RequestParam(value="searchOption", defaultValue="none") String searchOption,				
@RequestParam(value="searchValue", defaultValue="none") String searchValue,String sensenodeid,String sensecuid) {				
Map<String, Object> map = basicService.selectFarmListServ(pageNum, searchOption, searchValue);	
 
model.addAttribute("sensenodeid",sensenodeid);
model.addAttribute("sensecuid", sensecuid);
//model.addAttribute("farmList", map.get("farmList"));				
//model.addAttribute("totalCount", map.get("totalCount"));				
//model.addAttribute("paging", map.get("paging"));				
//model.addAttribute("searchOption", searchOption);				
//model.addAttribute("searchValue", searchValue);				
return "data_management/basictemp/chart_22";				
	}		

@RequestMapping(value = "/basicTempTotalChart", method = RequestMethod.GET)				
public String basicTempTotalChart(Model model,				
@RequestParam(value="pageNum", defaultValue="1") int pageNum,				
@RequestParam(value="searchOption", defaultValue="none") String searchOption,				
@RequestParam(value="searchValue", defaultValue="none") String searchValue,String sensenodeid,String sensecuid) {				
Map<String, Object> map = basicService.selectFarmListServ(pageNum, searchOption, searchValue);	
 
model.addAttribute("sensenodeid",sensenodeid);
model.addAttribute("sensecuid", sensecuid);
//model.addAttribute("farmList", map.get("farmList"));				
//model.addAttribute("totalCount", map.get("totalCount"));				
//model.addAttribute("paging", map.get("paging"));				
//model.addAttribute("searchOption", searchOption);				
//model.addAttribute("searchValue", searchValue);				
return "data_management/basictemp/chart_3";				
	}		

//============================================================
@RequestMapping(value = "/basicActiveList", method = RequestMethod.GET)				
public String fecesActiveList(Model model,				
@RequestParam(value="pageNum", defaultValue="1") int pageNum,				
@RequestParam(value="searchOption", defaultValue="none") String searchOption,				
@RequestParam(value="searchValue", defaultValue="none") String searchValue) {				
//Map<String, Object> map = senseService.selectFarmListServ(pageNum, searchOption, searchValue);				
//model.addAttribute("farmList", map.get("farmList"));				
//model.addAttribute("totalCount", map.get("totalCount"));				
//model.addAttribute("paging", map.get("paging"));				
 model.addAttribute("searchOption", searchOption);				
 model.addAttribute("searchValue", searchValue);				
return "data_management/basicactive/basicactiveEntity_list";				
}	


@RequestMapping(value = "/basicActiveEntityChart", method = RequestMethod.GET)				
public String basicActiveEntityChart(Model model,				
@RequestParam(value="pageNum", defaultValue="1") int pageNum,				
@RequestParam(value="searchOption", defaultValue="none") String searchOption,				
@RequestParam(value="searchValue", defaultValue="none") String searchValue,String sensenodeid,String sensecuid) {				
Map<String, Object> map = basicService.selectFarmListServ(pageNum, searchOption, searchValue);	
 
model.addAttribute("sensenodeid",sensenodeid);
model.addAttribute("sensecuid", sensecuid);
//model.addAttribute("farmList", map.get("farmList"));				
//model.addAttribute("totalCount", map.get("totalCount"));				
//model.addAttribute("paging", map.get("paging"));				
//model.addAttribute("searchOption", searchOption);				
//model.addAttribute("searchValue", searchValue);				
return "data_management/basicactive/chart_22";				
	}		

@RequestMapping(value = "/basicActiveTotalChart", method = RequestMethod.GET)				
public String basicActiveTotalChart(Model model,				
@RequestParam(value="pageNum", defaultValue="1") int pageNum,				
@RequestParam(value="searchOption", defaultValue="none") String searchOption,				
@RequestParam(value="searchValue", defaultValue="none") String searchValue,String sensenodeid,String sensecuid) {				
Map<String, Object> map = basicService.selectFarmListServ(pageNum, searchOption, searchValue);	
 
model.addAttribute("sensenodeid",sensenodeid);
model.addAttribute("sensecuid", sensecuid);
//model.addAttribute("farmList", map.get("farmList"));				
//model.addAttribute("totalCount", map.get("totalCount"));				
//model.addAttribute("paging", map.get("paging"));				
//model.addAttribute("searchOption", searchOption);				
//model.addAttribute("searchValue", searchValue);				
return "data_management/basicactive/chart_3";				
	}		



}		
