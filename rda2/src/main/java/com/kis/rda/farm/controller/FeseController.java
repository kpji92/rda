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
				
				
import com.kis.rda.farm.service.FeseService;				
				
				
@Controller				
public class FeseController {				
				
@Autowired				
private FeseService feseService;				
				
				
				
				
//분변자료리스트				
@RequestMapping(value = "/feseList", method = RequestMethod.GET)				
public String feseList(Model model,				
@RequestParam(value="pageNum", defaultValue="1") int pageNum,				
@RequestParam(value="searchOption", defaultValue="none") String searchOption,				
@RequestParam(value="searchValue", defaultValue="none") String searchValue) {				
Map<String, Object> map = feseService.selectFarmListServ(pageNum, searchOption, searchValue);				
model.addAttribute("farmList", map.get("farmList"));				
model.addAttribute("totalCount", map.get("totalCount"));				
model.addAttribute("paging", map.get("paging"));				
model.addAttribute("searchOption", searchOption);				
model.addAttribute("searchValue", searchValue);				
return "data_management/feces/fese_list";				
	}		



//병력자료 >(자료) 관리 
@RequestMapping(value = "/feseEntityList", method = RequestMethod.GET)		
public String mhEntityList(Model model,		
@RequestParam(value="pageNum", defaultValue="1") int pageNum,		
@RequestParam(value="searchOption", defaultValue="none") String searchOption,		
@RequestParam(value="searchValue", defaultValue="none") String searchValue, String farmId ) {		
//Map<String, Object> map = envService.selectFarmListServ(pageNum, searchOption, searchValue);		
		
		
model.addAttribute("farmId", farmId);		
//model.addAttribute("paging", map.get("paging"));		
//model.addAttribute("searchOption", searchOption);		
//model.addAttribute("searchValue", searchValue);		
return "data_management/feces/feseEntity_list";		
}		
//분변자료리스트 > (자료)관리 > 추가



@RequestMapping(value = "/fecesEntityInsert", method = RequestMethod.GET)	
public String envEntityInsert(Model model,	
@RequestParam(value="pageNum", defaultValue="1") int pageNum,	
@RequestParam(value="searchOption", defaultValue="none") String searchOption,	
@RequestParam(value="searchValue", defaultValue="none") String searchValue, String farmId, String entity_id) {	

//Map<String, Object> map = envService.selectFarmListServ(pageNum, searchOption, searchValue);	
//model.addAttribute("farmList", map.get("farmList"));	
//model.addAttribute("totalCount", map.get("totalCount"));	
//model.addAttribute("paging", map.get("paging"));	
//model.addAttribute("searchOption", searchOption);	
//model.addAttribute("searchValue", searchValue);	

//String newEntity_id = 	mhService.mhEntityInsertSelectOne(farmId);
//System.out.println(newEntity_id);
model.addAttribute("farmId", farmId);	
model.addAttribute("entity_id", entity_id);	
return "data_management/feces/feseEntity_insert_openWindow";	
}	
//분변자료리스트 > (자료)관리 > 추가 >저장


}				
