package com.kis.rda.feces.controller;				
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

import com.kis.rda.common.domain.Entity;
import com.kis.rda.farm.domain.EntityList;
import com.kis.rda.farm.domain.MhListDetail;
import com.kis.rda.feces.service.DataanalyService;				
				
				
@Controller				
public class FecesrecogController {				
				
@Autowired				
private DataanalyService dataanalyService;				
				
				
				
				
				
@RequestMapping(value = "/dataanalyList", method = RequestMethod.GET)				
public String dataanalyList(Model model,				
@RequestParam(value="pageNum", defaultValue="1") int pageNum,				
@RequestParam(value="searchOption", defaultValue="none") String searchOption,				
@RequestParam(value="searchValue", defaultValue="none") String searchValue) {				
Map<String, Object> map = dataanalyService.selectFarmListServ(pageNum, searchOption, searchValue);				
model.addAttribute("farmList", map.get("farmList"));				
model.addAttribute("totalCount", map.get("totalCount"));				
model.addAttribute("paging", map.get("paging"));				
model.addAttribute("searchOption", searchOption);				
model.addAttribute("searchValue", searchValue);				
return "data_management/farm/farm_list";				
	}			



@RequestMapping(value = "/fecesmanageList", method = RequestMethod.GET)				
public String fecesmanageList(Model model,				
@RequestParam(value="pageNum", defaultValue="1") int pageNum,				
@RequestParam(value="searchOption", defaultValue="none") String searchOption,				
@RequestParam(value="searchValue", defaultValue="none") String searchValue) {				
//Map<String, Object> map = senseService.selectFarmListServ(pageNum, searchOption, searchValue);				
//model.addAttribute("farmList", map.get("farmList"));				
//model.addAttribute("totalCount", map.get("totalCount"));				
//model.addAttribute("paging", map.get("paging"));				
 model.addAttribute("searchOption", searchOption);				
 model.addAttribute("searchValue", searchValue);				
return "data_management/fecesrecogmng/feserecogmng_list";				
}	

@RequestMapping(value = "/fecesrecogList", method = RequestMethod.GET)				
public String fecesrecogList(Model model,				
@RequestParam(value="pageNum", defaultValue="1") int pageNum,				
@RequestParam(value="searchOption", defaultValue="none") String searchOption,				
@RequestParam(value="searchValue", defaultValue="none") String searchValue) {				
//Map<String, Object> map = senseService.selectFarmListServ(pageNum, searchOption, searchValue);				
//model.addAttribute("farmList", map.get("farmList"));				
//model.addAttribute("totalCount", map.get("totalCount"));				
//model.addAttribute("paging", map.get("paging"));				
 model.addAttribute("searchOption", searchOption);				
 model.addAttribute("searchValue", searchValue);				
return "data_management/fecesrecogrecog/feserecog_list";				
}	

@RequestMapping(value = "/feserecogmngList", method = RequestMethod.GET)		
public String feserecogmngList(Model model,		
@RequestParam(value="pageNum", defaultValue="1") int pageNum,		
@RequestParam(value="searchOption", defaultValue="none") String searchOption,		
@RequestParam(value="searchValue", defaultValue="none") String searchValue, String farmId ) {		
//Map<String, Object> map = envService.selectFarmListServ(pageNum, searchOption, searchValue);		
		
		
model.addAttribute("farmId", farmId);		
//model.addAttribute("paging", map.get("paging"));		
//model.addAttribute("searchOption", searchOption);		
//model.addAttribute("searchValue", searchValue);		
return "data_management/fecesrecogmng/feserecogmngEntity_list";		
}		
@RequestMapping(value = "/feserecogrecogList", method = RequestMethod.GET)		
public String feserecogrecogList(Model model,		
@RequestParam(value="pageNum", defaultValue="1") int pageNum,		
@RequestParam(value="searchOption", defaultValue="none") String searchOption,		
@RequestParam(value="searchValue", defaultValue="none") String searchValue, String farmId ) {		
//Map<String, Object> map = envService.selectFarmListServ(pageNum, searchOption, searchValue);		
		
		
model.addAttribute("farmId", farmId);		
//model.addAttribute("paging", map.get("paging"));		
//model.addAttribute("searchOption", searchOption);		
//model.addAttribute("searchValue", searchValue);		
return "data_management/fecesrecogrecog/feserecogEntity_list";		
}	


@RequestMapping(value = "/feserecogmngEntityList", method = RequestMethod.GET)		
public String feserecogmngEntityList(Model model,		
@RequestParam(value="pageNum", defaultValue="1") int pageNum,		
@RequestParam(value="searchOption", defaultValue="none") String searchOption,		
@RequestParam(value="searchValue", defaultValue="none") String searchValue, String farmId ) {		
//Map<String, Object> map = envService.selectFarmListServ(pageNum, searchOption, searchValue);		
		
		
model.addAttribute("farmId", farmId);		
//model.addAttribute("paging", map.get("paging"));		
//model.addAttribute("searchOption", searchOption);		
//model.addAttribute("searchValue", searchValue);		
return "data_management/fecesrecogmng/feserecogmngEntity_list";		
}		
@RequestMapping(value = "/feserecogrecogEntityList", method = RequestMethod.GET)		
public String feserecogrecogEntityList(Model model,		
@RequestParam(value="pageNum", defaultValue="1") int pageNum,		
@RequestParam(value="searchOption", defaultValue="none") String searchOption,		
@RequestParam(value="searchValue", defaultValue="none") String searchValue, String farmId ) {		
//Map<String, Object> map = envService.selectFarmListServ(pageNum, searchOption, searchValue);		
		
		
model.addAttribute("farmId", farmId);		
//model.addAttribute("paging", map.get("paging"));		
//model.addAttribute("searchOption", searchOption);		
//model.addAttribute("searchValue", searchValue);		
return "data_management/fecesrecogrecog/feserecogEntity_list";		
}	


@RequestMapping(value = "/feserecogrecogEntityListDetail", method = RequestMethod.GET)		
public String feserecogrecogEntityListDetail(Model model,		
@RequestParam(value="pageNum", defaultValue="1") int pageNum,		
@RequestParam(value="searchOption", defaultValue="none") String searchOption,		
@RequestParam(value="searchValue", defaultValue="none") String searchValue, String farmId,String entity_id ) {		
//Map<String, Object> map = envService.selectFarmListServ(pageNum, searchOption, searchValue);		

	EntityList  listDetail= dataanalyService.feserecogrecogEntitySelectOne(entity_id);		
//System.out.println("목장   mhEntityUpdateSelectOne"+map.get("envList").toString());		
   
model.addAttribute("listDetail", listDetail);		
listDetail.getENTITY_ID();
listDetail.getBREEDING();
listDetail.getVARIETY();
listDetail.getGENDER();
listDetail.getBIRTH();
listDetail.getBIRTH_WEIGHT();
listDetail.getCOLOSTRUM();
listDetail.getVACCINE();
listDetail.getBirth_NUMBER();
listDetail.getBIRTH_CASE();

	model.addAttribute("entity_id", entity_id);		
model.addAttribute("farmId", farmId);		
//model.addAttribute("paging", map.get("paging"));		
//model.addAttribute("searchOption", searchOption);		
//model.addAttribute("searchValue", searchValue);		
return "data_management/fecesrecogrecog/feserecogEntity_list_detail";		
}	



}				
