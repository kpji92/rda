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
import com.kis.rda.farm.domain.QuResearch;
import com.kis.rda.farm.service.FarmService;
import com.kis.rda.farm.service.QuService;				
				
@RestController				
public class QuRestController {				
@Autowired
private FarmService farmService;
				
@Autowired				
private QuService quService;				
@RequestMapping(value = "/ajax/quList", method = RequestMethod.POST)				
public Map<String,Object> ajaxquList(Model model,				
	@RequestParam(value="pageNum", defaultValue="1") int pageNum,			
	@RequestParam(value="searchOption", defaultValue="none") String searchOption,			
	@RequestParam(value="searchValue", defaultValue="none") String searchValue) {			
Map<String, Object> map = quService.selectFarmListServ(pageNum, searchOption, searchValue);				
//model.addAttribute("farmList", map.get("farmList"));				
//model.addAttribute("totalCount", map.get("totalCount"));				
//model.addAttribute("paging", map.get("paging"));				
//model.addAttribute("searchOption", searchOption);				
//model.addAttribute("searchValue", searchValue);				
System.out.println("확인"+map);		
				
return map;				
}			

// 설문조사 폼 저장 


//@RequestMapping(value = "/ajax/input_qu", method = RequestMethod.POST)				
//public Map<String,Object> ajaxinput_qu(Model model,				
//	@RequestParam(value="pageNum", defaultValue="1") int pageNum,			
//	@RequestParam(value="searchOption", defaultValue="none") String searchOption,			
//	@RequestParam(value="searchValue", defaultValue="none") String searchValue) {	
//	
//	System.out.println("설문조사");	
//	
//Map<String, Object> map = quService.selectFarmListServ(pageNum, searchOption, searchValue);				
////model.addAttribute("farmList", map.get("farmList"));				
////model.addAttribute("totalCount", map.get("totalCount"));				
////model.addAttribute("paging", map.get("paging"));				
////model.addAttribute("searchOption", searchOption);				
////model.addAttribute("searchValue", searchValue);				
//System.out.println("확인");		
//				
//return map;				
//}

//목장자료 - 기존 목장 수정
	@RequestMapping(value = "/ajax/input_qu", method = RequestMethod.POST)
	public int farmUpdateCtrl(Model model,Farm farm,String sfarm,QuResearch quresearch) {
		//int result = farmService.updateFarmServ(farm);
		System.out.println("목장 수정"+farm);
		System.out.println("목장 수정"+sfarm);
		System.out.println("목장 수정"+quresearch.getQ1());
		quresearch.getQ1();
		int result = quService.quresearchInput(quresearch);
		 
		System.out.println("목장 수정"+result);
		return result;
	}
	


}				
				
