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
				
				
import com.kis.rda.farm.service.SenseService;				
				
				
@Controller				
public class SenseController {				
				
@Autowired				
private SenseService senseService;				
				
				
				
				
//=============================현황==================================================		
@RequestMapping(value = "/senseCountList", method = RequestMethod.GET)				
public String senseCountList(Model model,				
@RequestParam(value="pageNum", defaultValue="1") int pageNum,				
@RequestParam(value="searchOption", defaultValue="none") String searchOption,				
@RequestParam(value="searchValue", defaultValue="none") String searchValue) {				
//Map<String, Object> map = senseService.selectFarmListServ(pageNum, searchOption, searchValue);				
//model.addAttribute("farmList", map.get("farmList"));				
//model.addAttribute("totalCount", map.get("totalCount"));				
//model.addAttribute("paging", map.get("paging"));				
//model.addAttribute("searchOption", searchOption);				
//model.addAttribute("searchValue", searchValue);				
return "data_management/sensecount/senseCount_list";				
	}		


//==============================개체=================================================		
@RequestMapping(value = "/senseEntityList", method = RequestMethod.GET)				
public String senseEntityList(Model model,				
@RequestParam(value="pageNum", defaultValue="1") int pageNum,				
@RequestParam(value="searchOption", defaultValue="none") String searchOption,				
@RequestParam(value="searchValue", defaultValue="none") String searchValue) {				
//Map<String, Object> map = senseService.selectFarmListServ(pageNum, searchOption, searchValue);				
//model.addAttribute("farmList", map.get("farmList"));				
//model.addAttribute("totalCount", map.get("totalCount"));				
//model.addAttribute("paging", map.get("paging"));				
 model.addAttribute("searchOption", searchOption);				
 model.addAttribute("searchValue", searchValue);				
return "data_management/senseentity/senseEntity_list";				
}		

@RequestMapping(value = "/senseEntityListDetail", method = RequestMethod.GET)				
public String senseEntityListDetail(Model model,				
@RequestParam(value="pageNum", defaultValue="1") int pageNum,				
@RequestParam(value="searchOption", defaultValue="none") String searchOption,				
@RequestParam(value="searchValue", defaultValue="none") String searchValue,String sensecuid,String sensenodeid) {				
//Map<String, Object> map = senseService.selectFarmListServ(pageNum, searchOption, searchValue);				
//model.addAttribute("farmList", map.get("farmList"));				
//model.addAttribute("totalCount", map.get("totalCount"));				
//model.addAttribute("paging", map.get("paging"));				
 model.addAttribute("sensecuid", sensecuid);				
 model.addAttribute("sensenodeid", sensenodeid);				
return "data_management/senseentity/senseEntity_list_detail";				
}		



@RequestMapping(value = "/senseEntityChart", method = RequestMethod.GET)				
public String senseChart(Model model,				
@RequestParam(value="pageNum", defaultValue="1") int pageNum,				
@RequestParam(value="searchOption", defaultValue="none") String searchOption,				
@RequestParam(value="searchValue", defaultValue="none") String searchValue,String sense_nodeId,String sense_cuId) {				
Map<String, Object> map = senseService.selectFarmListServ(pageNum, searchOption, searchValue);	
 
model.addAttribute("sense_nodeId",sense_nodeId);
model.addAttribute("sense_cuId", sense_cuId);
//model.addAttribute("farmList", map.get("farmList"));				
//model.addAttribute("totalCount", map.get("totalCount"));				
//model.addAttribute("paging", map.get("paging"));				
//model.addAttribute("searchOption", searchOption);				
//model.addAttribute("searchValue", searchValue);				
return "data_management/senseentity/chart_22";				
	}		
//===============================축사================================================		
@RequestMapping(value = "/senseStableList", method = RequestMethod.GET)				
public String senseList(Model model,				
@RequestParam(value="pageNum", defaultValue="1") int pageNum,				
@RequestParam(value="searchOption", defaultValue="none") String searchOption,				
@RequestParam(value="searchValue", defaultValue="none") String searchValue) {				
//Map<String, Object> map = senseService.selectFarmListServ(pageNum, searchOption, searchValue);				
//model.addAttribute("farmList", map.get("farmList"));				
//model.addAttribute("totalCount", map.get("totalCount"));				
//model.addAttribute("paging", map.get("paging"));				
//model.addAttribute("searchOption", searchOption);				
//model.addAttribute("searchValue", searchValue);				
return "data_management/sensestable/senseStable_list";				
}		


@RequestMapping(value = "/senseStableListDetail", method = RequestMethod.GET)				
public String senseStableListDetail(Model model,				
@RequestParam(value="pageNum", defaultValue="1") int pageNum,				
@RequestParam(value="searchOption", defaultValue="none") String searchOption,				
@RequestParam(value="searchValue", defaultValue="none") String searchValue,String sensecuid,String sensenodeid) {				
	 model.addAttribute("sensecuid", sensecuid);				
	 model.addAttribute("sensenodeid", sensenodeid);		
	//Map<String, Object> map = senseService.selectFarmListServ(pageNum, searchOption, searchValue);				
//model.addAttribute("farmList", map.get("farmList"));				
//model.addAttribute("totalCount", map.get("totalCount"));				
//model.addAttribute("paging", map.get("paging"));				
//model.addAttribute("searchOption", searchOption);				
//model.addAttribute("searchValue", searchValue);				
return "data_management/sensestable/senseStable_list_detail";				
}		



@RequestMapping(value = "/senseStableChart", method = RequestMethod.GET)				
public String senseStableChart(Model model,				
@RequestParam(value="pageNum", defaultValue="1") int pageNum,				
@RequestParam(value="searchOption", defaultValue="none") String searchOption,				
@RequestParam(value="searchValue", defaultValue="none") String searchValue,String sense_nodeId,String sense_cuId,String sensecuid,String sensenodeid) {				
Map<String, Object> map = senseService.selectFarmListServ(pageNum, searchOption, searchValue);	
 
model.addAttribute("sensecuid", sensecuid);				
model.addAttribute("sensenodeid", sensenodeid);		
//model.addAttribute("farmList", map.get("farmList"));				
//model.addAttribute("totalCount", map.get("totalCount"));				
//model.addAttribute("paging", map.get("paging"));				
//model.addAttribute("searchOption", searchOption);				
//model.addAttribute("searchValue", searchValue);				
return "data_management/sensestable/chart_env";				
	}		
// 현황 리스트

// 개체자료 리스트

// 축사 자료 리스트( 센스가 있는 ?? 목장리스트)

//// 축사 자료 리스트( 센스가 있는 ?? 목장리스트) > (데이터) 보기


////축사 자료 리스트( 센스가 있는 ?? 목장리스트) > (데이터) 보기 > 추가 



////축사 자료 리스트( 센스가 있는 ?? 목장리스트) > (분석) 보기
 

}				
